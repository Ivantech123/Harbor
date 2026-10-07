# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Points the branding surfer generates at Harbor.

surfer hardcodes its own project's URLs into the branding prefs and the
installer defines every time it imports. This rewrites them, and has to
run after `surfer import`.
"""

import json
import os
import re
import sys

BRANDING_ROOT = os.path.join("engine", "browser", "branding")


def load_brands():
  with open("surfer.json", "r", encoding="utf-8") as f:
    return json.load(f)["brands"]


def replace_values(path, pattern, values):
  """Sets the value of every key in `values`, `pattern` has to capture the
  text before and after the value around a `{key}` placeholder."""
  with open(path, "r", encoding="utf-8") as f:
    data = f.read()
  for key, value in values.items():
    regex = re.compile(pattern.format(key=re.escape(key)), re.M)
    data, count = regex.subn(lambda m: m.group(1) + value + m.group(2), data)
    if count != 1:
      raise RuntimeError(f"{path}: expected one '{key}', found {count}")
  with open(path, "w", encoding="utf-8", newline="\n") as f:
    f.write(data)


def fix_brand(brand, repo):
  base = f"https://github.com/{repo}"
  releases = f"{base}/releases"
  latest = f"{releases}/latest"

  replace_values(
    os.path.join(BRANDING_ROOT, brand, "pref", "firefox-branding.js"),
    r'^(pref\("{key}", ")[^"]*("\);)',
    {
      # The page after onboarding and the guide ship inside the browser.
      "startup.homepage_override_url": "",
      "startup.homepage_welcome_url": "",
      "startup.homepage_welcome_url.additional": "",
      "app.update.url.manual": latest,
      "app.update.url.details": releases,
      "app.releaseNotesURL": releases,
      "app.releaseNotesURL.aboutDialog": f"{releases}/tag/%VERSION%",
      "app.releaseNotesURL.prompt": f"{releases}/tag/%VERSION%",
    })

  replace_values(
    os.path.join(BRANDING_ROOT, brand, "branding.nsi"),
    r'^(!define {key}\s+")[^"]*(")',
    {
      "URLInfoAbout": base,
      "URLUpdateInfo": f"{releases}/tag/${{AppVersion}}",
      "HelpLink": f"{base}/issues",
      "URLStubDownloadX86": latest,
      "URLStubDownloadAMD64": latest,
      "URLStubDownloadAArch64": latest,
      "URLManualDownload": latest,
    })


def main():
  for brand, config in load_brands().items():
    if not os.path.isdir(os.path.join(BRANDING_ROOT, brand)):
      print(f"Skipping {brand}, it has no generated branding")
      continue
    fix_brand(brand, config["release"]["github"]["repo"])
    print(f"Fixed the branding links of {brand}")


if __name__ == "__main__":
  try:
    main()
  except (OSError, RuntimeError, KeyError) as e:
    print(f"fix_branding: {e}", file=sys.stderr)
    sys.exit(1)
