#!/usr/bin/env python3
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""
Translate Harbor Fluent (.ftl) strings via OpenRouter.

Default model: stealth/space-bunny-alpha

Usage:
  set OPENROUTER_API_KEY=sk-or-v1-...
  python scripts/translate_locales.py --lang ru
  python scripts/translate_locales.py --all
  python scripts/translate_locales.py --lang de,fr,uk --files harbor-welcome.ftl

Reads source from locales/en-US/browser/browser/**/harbor*.ftl
Writes to locales/<lang>/browser/browser/... preserving relative paths.
Does not invent new message IDs. Keeps Fluent placeables and brand terms.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import threading
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EN_US = ROOT / "locales" / "en-US" / "browser"
SUPPORTED = ROOT / "locales" / "supported-languages"
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"
DEFAULT_MODEL = "stealth/space-bunny-alpha"

# Keep these tokens exactly as in the English source.
PRESERVE_HINT = """
Rules:
- Output ONLY the translated Fluent file body, no markdown fences.
- Keep every message id, attribute name (.label, .placeholder, .accesskey, etc.) unchanged.
- Keep Fluent placeables exactly: { -brand-short-name }, { $var }, { PLATFORM() -> ... }, select variants structure.
- Keep HTML-like tags inside strings (<strong>, <br/>, etc.).
- Keep accesskeys as a single character suitable for the target language when possible.
- Do not translate brand names Harbor, Harbor Browser, uBlock Origin, GitHub, YouTube.
- Translate comments that explain UI only if they help translators; keep License header in English.
- Prefer natural UI phrasing for a desktop browser.
""".strip()

LOCALE_NAMES = {
    "ar": "Arabic",
    "bg": "Bulgarian",
    "bs": "Bosnian",
    "ca": "Catalan",
    "cs": "Czech",
    "cy": "Welsh",
    "da": "Danish",
    "de": "German",
    "el": "Greek",
    "en-GB": "British English",
    "es-ES": "Spanish (Spain)",
    "et": "Estonian",
    "fa": "Persian",
    "fi": "Finnish",
    "fr": "French",
    "ga-IE": "Irish",
    "he": "Hebrew",
    "hu": "Hungarian",
    "id": "Indonesian",
    "is": "Icelandic",
    "it": "Italian",
    "ja": "Japanese",
    "ko": "Korean",
    "lt": "Lithuanian",
    "nb": "Norwegian Bokmål",
    "nl": "Dutch",
    "nn-NO": "Norwegian Nynorsk",
    "pl": "Polish",
    "pt-BR": "Portuguese (Brazil)",
    "pt-PT": "Portuguese (Portugal)",
    "ro": "Romanian",
    "ru": "Russian",
    "sk": "Slovak",
    "sv-SE": "Swedish",
    "th": "Thai",
    "tr": "Turkish",
    "uk": "Ukrainian",
    "vi": "Vietnamese",
    "zh-CN": "Simplified Chinese",
    "zh-TW": "Traditional Chinese",
}


def load_dotenv() -> None:
    for name in (".env", ".env.local"):
        path = ROOT / name
        if not path.is_file():
            continue
        for line in path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, value = line.split("=", 1)
            key = key.strip()
            value = value.strip().strip('"').strip("'")
            os.environ.setdefault(key, value)


def list_supported_langs() -> list[str]:
    langs = []
    for line in SUPPORTED.read_text(encoding="utf-8").splitlines():
        lang = line.strip()
        if lang and not lang.startswith("#") and lang != "en-US":
            langs.append(lang)
    return langs


def harbor_source_files(only: list[str] | None) -> list[Path]:
    files = sorted(EN_US.rglob("harbor*.ftl"))
    if only:
        wanted = set(only)
        files = [f for f in files if f.name in wanted]
    if not files:
        raise SystemExit("No harbor*.ftl source files found under locales/en-US/browser")
    return files


def relative_under_browser(path: Path) -> Path:
    return path.relative_to(EN_US)


def log(msg: str = "") -> None:
    print(msg, flush=True)


def progress_line(done: int, total: int, lang: str, name: str, status: str, started: float) -> None:
    pct = (100.0 * done / total) if total else 100.0
    elapsed = time.time() - started
    rate = done / elapsed if elapsed > 0 and done else 0.0
    left = total - done
    eta = (left / rate) if rate > 0 else 0.0
    eta_m, eta_s = divmod(int(eta), 60)
    bar_len = 24
    filled = int(bar_len * done / total) if total else bar_len
    bar = "#" * filled + "-" * (bar_len - filled)
    log(
        f"[{done}/{total}] {pct:5.1f}% |{bar}| "
        f"{lang} {name} — {status} | elapsed {int(elapsed)}s | ETA {eta_m}m{eta_s:02d}s"
    )


def call_openrouter(api_key: str, model: str, system: str, user: str, temperature: float) -> str:
    payload = {
        "model": model,
        "temperature": temperature,
        "messages": [
            {"role": "system", "content": system},
            {"role": "user", "content": user},
        ],
    }
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        OPENROUTER_URL,
        data=data,
        method="POST",
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
            "HTTP-Referer": "https://harbor.browser",
            "X-Title": "Harbor Locale Translator",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=180) as resp:
            body = json.loads(resp.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"OpenRouter HTTP {exc.code}: {detail}") from exc

    try:
        text = body["choices"][0]["message"]["content"]
    except (KeyError, IndexError, TypeError) as exc:
        raise RuntimeError(f"Unexpected OpenRouter response: {body}") from exc

    text = text.strip()
    if text.startswith("```"):
        text = re.sub(r"^```[a-zA-Z]*\n?", "", text)
        text = re.sub(r"\n?```$", "", text)
        text = text.strip()
    return text


def translate_file(
    src: Path,
    lang: str,
    api_key: str,
    model: str,
    temperature: float,
    dry_run: bool,
) -> Path:
    rel = relative_under_browser(src)
    out = ROOT / "locales" / lang / "browser" / rel
    english = src.read_text(encoding="utf-8")
    locale_name = LOCALE_NAMES.get(lang, lang)

    system = (
        f"You are a professional localization engineer for Harbor Browser, a Firefox fork.\n"
        f"Translate Fluent (.ftl) UI strings from English (en-US) to {locale_name} ({lang}).\n"
        f"{PRESERVE_HINT}"
    )
    user = (
        f"Target locale: {lang} ({locale_name})\n"
        f"File: {rel.as_posix()}\n\n"
        f"---BEGIN FTL---\n{english}\n---END FTL---"
    )

    if dry_run:
        return out

    translated = call_openrouter(api_key, model, system, user, temperature)
    if not translated or " = " not in translated:
        raise RuntimeError(f"Translation looks empty or invalid for {rel}")

    out.parent.mkdir(parents=True, exist_ok=True)
    if not translated.endswith("\n"):
        translated += "\n"
    out.write_text(translated, encoding="utf-8")
    return out


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Translate Harbor FTL locales via OpenRouter")
    parser.add_argument(
        "--lang",
        help="Comma-separated locale ids (e.g. ru,uk,de). Default: ru",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Translate into every locale listed in locales/supported-languages",
    )
    parser.add_argument(
        "--files",
        help="Comma-separated harbor*.ftl basenames to translate (default: all)",
    )
    parser.add_argument(
        "--model",
        default=os.environ.get("OPENROUTER_MODEL", DEFAULT_MODEL),
        help=f"OpenRouter model id (default: {DEFAULT_MODEL})",
    )
    parser.add_argument("--temperature", type=float, default=0.2)
    parser.add_argument(
        "--sleep",
        type=float,
        default=0.0,
        help="Seconds to sleep after each successful API call (per worker)",
    )
    parser.add_argument(
        "--workers",
        type=int,
        default=12,
        help="Parallel OpenRouter requests (default: 12)",
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument(
        "--force",
        action="store_true",
        help="Overwrite existing locale files (default: skip existing)",
    )
    return parser.parse_args()


def main() -> int:
    load_dotenv()
    args = parse_args()
    api_key = os.environ.get("OPENROUTER_API_KEY", "").strip()
    if not api_key and not args.dry_run:
        log("Set OPENROUTER_API_KEY in the environment or in .env / .env.local")
        return 1

    if args.all:
        langs = list_supported_langs()
    elif args.lang:
        langs = [part.strip() for part in args.lang.split(",") if part.strip()]
    else:
        langs = ["ru"]

    only_files = None
    if args.files:
        only_files = [part.strip() for part in args.files.split(",") if part.strip()]

    sources = harbor_source_files(only_files)
    jobs: list[tuple[str, Path]] = [(lang, src) for lang in langs for src in sources]
    total = len(jobs)
    workers = max(1, int(args.workers))

    log(f"Model: {args.model}")
    log(f"Workers: {workers}")
    log(f"Locales ({len(langs)}): {', '.join(langs)}")
    log(f"Files per locale: {len(sources)}")
    log(f"Total jobs: {total}")
    log("")

    ok = 0
    skipped = 0
    failed = 0
    started = time.time()
    done = 0
    lock = threading.Lock()
    pending: list[tuple[str, Path]] = []

    for lang, src in jobs:
        rel = relative_under_browser(src)
        out = ROOT / "locales" / lang / "browser" / rel
        name = rel.as_posix()
        if out.exists() and not args.force and not args.dry_run:
            with lock:
                done += 1
                skipped += 1
                progress_line(done, total, lang, name, "skip", started)
            continue
        pending.append((lang, src))

    def run_one(lang: str, src: Path) -> tuple[str, str, str]:
        rel = relative_under_browser(src)
        name = rel.as_posix()
        try:
            translate_file(
                src,
                lang,
                api_key,
                args.model,
                args.temperature,
                args.dry_run,
            )
            status = "ok" if not args.dry_run else "dry-run"
            if not args.dry_run and args.sleep > 0:
                time.sleep(args.sleep)
            return lang, name, status
        except Exception as exc:  # noqa: BLE001
            return lang, name, f"ERROR: {exc}"

    if pending:
        log(f"Queued for translation: {len(pending)}")
        with ThreadPoolExecutor(max_workers=workers) as pool:
            futures = [pool.submit(run_one, lang, src) for lang, src in pending]
            for fut in as_completed(futures):
                lang, name, status = fut.result()
                with lock:
                    done += 1
                    if status.startswith("ERROR"):
                        failed += 1
                        print(status, file=sys.stderr, flush=True)
                    else:
                        ok += 1
                    progress_line(done, total, lang, name, status, started)

    elapsed = int(time.time() - started)
    log("")
    log(
        f"Done in {elapsed}s. translated={ok} skipped={skipped} "
        f"failed={failed} total={total} workers={workers}"
    )
    return 0 if failed == 0 else 2


if __name__ == "__main__":
    raise SystemExit(main())
