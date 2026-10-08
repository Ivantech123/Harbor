# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Turns the output of `surfer package` into what a GitHub release needs.

Signs dist/output.mar with the key in build/signing, rewrites the update
manifests for the signed file and collects everything in dist/release:

  dist/release/assets/   files to attach to the GitHub release
  dist/release/updates/  tree to commit to the "updates" branch

Run it from the project root, after `npm run package`.
"""

import argparse
import glob
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

SIGNING_DIR = os.path.join("build", "signing")
DIST_DIR = "dist"
RELEASE_DIR = os.path.join(DIST_DIR, "release")
CERT_NAME = "mar_sig"


def run(args):
  result = subprocess.run(args, capture_output=True, text=True)
  if result.returncode != 0:
    raise RuntimeError(
      f"{os.path.basename(args[0])} failed:\n{result.stdout}{result.stderr}")
  return result.stdout


def find_bin_dir():
  for candidate in glob.glob(os.path.join("engine", "obj-*", "dist", "bin")):
    if glob.glob(os.path.join(candidate, "signmar*")):
      return candidate
  raise RuntimeError("signmar not found, build the engine first")


def tool(bin_dir, name):
  path = os.path.join(bin_dir, name + (".exe" if os.name == "nt" else ""))
  if not os.path.exists(path):
    raise RuntimeError(f"{path} not found")
  return os.path.abspath(path)


def sign_mar(bin_dir, source, destination):
  key = os.path.join(SIGNING_DIR, "private_key.pem")
  cert = os.path.join(SIGNING_DIR, "cert.pem")
  for path in (key, cert):
    if not os.path.exists(path):
      raise RuntimeError(f"{path} not found, the MAR cannot be signed")

  # The key only lives in a throwaway NSS database while signing.
  with tempfile.TemporaryDirectory() as work:
    database = os.path.join(work, "nss")
    os.mkdir(database)
    password_file = os.path.join(work, "password.txt")
    with open(password_file, "w", encoding="utf-8") as f:
      f.write("\n")
    bundle = os.path.join(work, "key.p12")

    run([tool(bin_dir, "certutil"), "-N", "-d", database, "-f", password_file])
    run(["openssl", "pkcs12", "-export", "-inkey", key, "-in", cert,
         "-name", CERT_NAME, "-passout", "pass:", "-out", bundle])
    run([tool(bin_dir, "pk12util"), "-i", bundle, "-d", database,
         "-W", "", "-K", ""])

    signmar = tool(bin_dir, "signmar")
    run([signmar, "-d", database, "-n", CERT_NAME, "-s", source, destination])
    # Fails unless the signature checks out against the public key the
    # updater is built with.
    public_key = os.path.join(SIGNING_DIR, "public_key.der")
    run([signmar, "-D", public_key, "-v", destination])


def sha512(path):
  digest = hashlib.sha512()
  with open(path, "rb") as f:
    for chunk in iter(lambda: f.read(1 << 20), b""):
      digest.update(chunk)
  return digest.hexdigest()


def reported_build_id():
  """The build ID the packaged browser reports about itself.

  The update check compares the manifest against this one. Packaging writes
  a later ID into application.ini than the one compiled into the binary, and
  with that in the manifest an updated browser takes the build it already
  runs for a newer one and updates in a loop.
  """
  import time
  sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
  import take_screenshots as browser

  binaries = [
    path
    for path in glob.glob(os.path.join("engine", "obj-*", "dist", "*", "harbor*"))
    if os.path.basename(path).lower() in ("harbor.exe", "harbor")
    and os.path.basename(os.path.dirname(path)) != "bin"
  ]
  if not binaries:
    raise RuntimeError("the packaged browser was not found in dist")

  work = tempfile.mkdtemp(prefix="harbor-buildid-")
  profile = os.path.join(work, "profile")
  browser.write_profile(
    profile, dict(browser.PREFS, **{"harbor.welcome-screen.seen": True}))
  browser.launch(os.path.abspath(binaries[0]), profile)
  client = browser.Marionette(browser.PORT)
  try:
    return str(client.run("return Services.appinfo.appBuildID;"))
  finally:
    client.quit()
    time.sleep(4)
    shutil.rmtree(work, ignore_errors=True)


def rewrite_manifests(mar_path, mar_url, build_id):
  manifests = glob.glob(
    os.path.join(DIST_DIR, "update", "browser", "**", "update.xml"),
    recursive=True)
  if not manifests:
    raise RuntimeError("no update.xml in dist/update, run the packaging first")

  replacements = {
    "URL": mar_url,
    "hashValue": sha512(mar_path),
    "size": str(os.path.getsize(mar_path)),
  }
  written = []
  for manifest in manifests:
    with open(manifest, "r", encoding="utf-8") as f:
      data = f.read()
    for attribute, value in replacements.items():
      data, count = re.subn(
        rf'(<patch\b[^>]*\b{attribute}=")[^"]*(")',
        lambda m, value=value: m.group(1) + value + m.group(2), data)
      if count != 1:
        raise RuntimeError(f"{manifest}: no single patch {attribute}")
    data, count = re.subn(
      r'(<update\b[^>]*\bbuildID=")[^"]*(")',
      lambda m: m.group(1) + build_id + m.group(2), data)
    if count != 1:
      raise RuntimeError(f"{manifest}: no single update buildID")
    relative =os.path.relpath(manifest, os.path.join(DIST_DIR, "update"))
    # The update URL of the browser is {host}/updates/browser/...
    target = os.path.join(RELEASE_DIR, "updates", relative)
    os.makedirs(os.path.dirname(target), exist_ok=True)
    with open(target, "w", encoding="utf-8", newline="\n") as f:
      f.write(data)
    written.append(target)
  return written


def main():
  parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
  parser.add_argument("--brand", default="release")
  parser.add_argument("--mar-name", default="windows.mar",
                      help="Name of the MAR on the release")
  parser.add_argument("--build-id",
                      help="Build ID for the manifests, instead of asking "
                           "the packaged browser for the one it reports")
  args = parser.parse_args()

  with open("surfer.json", "r", encoding="utf-8") as f:
    release = json.load(f)["brands"][args.brand]["release"]
  version = release["displayVersion"]
  repo = release["github"]["repo"]
  tag = "twilight" if args.brand == "twilight" else version

  source_mar = os.path.join(DIST_DIR, "output.mar")
  if not os.path.exists(source_mar):
    raise RuntimeError(f"{source_mar} not found, run the packaging first")

  shutil.rmtree(RELEASE_DIR, ignore_errors=True)
  assets = os.path.join(RELEASE_DIR, "assets")
  os.makedirs(assets)

  signed_mar = os.path.join(assets, args.mar_name)
  sign_mar(find_bin_dir(), source_mar, signed_mar)
  print(f"Signed {signed_mar}")

  mar_url = f"https://github.com/{repo}/releases/download/{tag}/{args.mar_name}"
  build_id = args.build_id or reported_build_id()
  print(f"The browser reports build {build_id}")
  for manifest in rewrite_manifests(signed_mar, mar_url, build_id):
    print(f"Wrote {manifest}")

  for pattern in ("*.installer.exe", "*.win64.zip", "*.tar.xz", "*.dmg"):
    for path in glob.glob(os.path.join(DIST_DIR, pattern)):
      # surfer also leaves an unversioned copy of the installer behind.
      if version in os.path.basename(path):
        shutil.copy2(path, assets)
        print(f"Collected {os.path.basename(path)}")

  print(f"\nVersion {version}, build {build_id}, tag {tag}, MAR at {mar_url}")


if __name__ == "__main__":
  try:
    main()
  except (OSError, RuntimeError, KeyError) as e:
    print(f"prepare_github_release: {e}", file=sys.stderr)
    sys.exit(1)
