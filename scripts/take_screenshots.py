# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Takes the screenshots used in the README and the promo material.

Starts the browser on a throwaway profile, drives it over Marionette and
captures the window after each scene. Windows only.

  python scripts/take_screenshots.py --binary <path to harbor.exe> --out docs/screenshots
"""

import argparse
import ctypes
import json
import os
import shutil
import socket
import subprocess
import sys
import tempfile
import time
from ctypes import wintypes

from PIL import Image, ImageChops, ImageGrab

PORT = 2829
PAGES = "chrome://browser/content/harbor-pages/"

PREFS = {
  "marionette.port": PORT,
  "browser.shell.checkDefaultBrowser": False,
  "browser.aboutwelcome.enabled": False,
  "datareporting.policy.dataSubmissionPolicyBypassNotification": True,
  "app.update.auto": False,
  "app.update.disabledForTesting": True,
  "harbor.updates.show-update-notification": False,
  "browser.startup.homepage_override.mstone": "ignore",
  "browser.tabs.warnOnClose": False,
  "browser.warnOnQuit": False,
  "intl.locale.requested": "ru",
}


class Marionette:
  def __init__(self, port):
    self.id = 0
    deadline = time.time() + 90
    while True:
      try:
        self.sock = socket.create_connection(("127.0.0.1", port), timeout=5)
        break
      except OSError:
        if time.time() > deadline:
          raise RuntimeError("the browser never opened its Marionette port")
        time.sleep(1)
    self.sock.settimeout(120)
    self._receive()  # server hello
    self.send("WebDriver:NewSession", {"capabilities": {}})
    self.send("Marionette:SetContext", {"value": "chrome"})
    self.send("WebDriver:SetTimeouts", {"script": 110000})

  def _receive(self):
    length = b""
    while not length.endswith(b":"):
      chunk = self.sock.recv(1)
      if not chunk:
        raise RuntimeError("the browser closed the connection")
      length += chunk
    remaining = int(length[:-1])
    data = b""
    while len(data) < remaining:
      data += self.sock.recv(remaining - len(data))
    return json.loads(data)

  def send(self, command, params):
    self.id += 1
    payload = json.dumps([0, self.id, command, params])
    self.sock.sendall(f"{len(payload)}:{payload}".encode("utf-8"))
    _, _, error, result = self._receive()
    if error:
      raise RuntimeError(f"{command}: {error.get('message')}")
    return result.get("value") if isinstance(result, dict) else result

  def run(self, script, *args):
    """Runs async chrome JS, `resolve` ends it."""
    body = (
      "const resolve = arguments[arguments.length - 1];"
      "(async () => {" + script + "})().then(resolve, e => resolve('ERROR: ' + e));"
    )
    value = self.send("WebDriver:ExecuteAsyncScript",
                      {"script": body, "args": list(args)})
    if isinstance(value, str) and value.startswith("ERROR: "):
      raise RuntimeError(value)
    return value

  def quit(self):
    try:
      self.send("Marionette:Quit", {"flags": ["eForceQuit"]})
    except (OSError, RuntimeError):
      pass


# Mark: window capture

user32 = ctypes.windll.user32
gdi32 = ctypes.windll.gdi32


class BITMAPINFOHEADER(ctypes.Structure):
  _fields_ = [
    ("biSize", wintypes.DWORD), ("biWidth", wintypes.LONG),
    ("biHeight", wintypes.LONG), ("biPlanes", wintypes.WORD),
    ("biBitCount", wintypes.WORD), ("biCompression", wintypes.DWORD),
    ("biSizeImage", wintypes.DWORD), ("biXPelsPerMeter", wintypes.LONG),
    ("biYPelsPerMeter", wintypes.LONG), ("biClrUsed", wintypes.DWORD),
    ("biClrImportant", wintypes.DWORD),
  ]


def find_window(pid):
  """The largest visible top-level window of the process tree."""
  pids = {pid}
  found = []

  def visit(hwnd, _):
    owner = wintypes.DWORD()
    user32.GetWindowThreadProcessId(hwnd, ctypes.byref(owner))
    if owner.value in pids and user32.IsWindowVisible(hwnd):
      rect = wintypes.RECT()
      user32.GetWindowRect(hwnd, ctypes.byref(rect))
      found.append(((rect.right - rect.left) * (rect.bottom - rect.top), hwnd))
    return True

  callback = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)
  user32.EnumWindows(callback(visit), 0)
  if not found:
    raise RuntimeError("the browser window was not found")
  return max(found)[1]


def capture(hwnd, path):
  rect = wintypes.RECT()
  user32.GetWindowRect(hwnd, ctypes.byref(rect))
  width, height = rect.right - rect.left, rect.bottom - rect.top

  window_dc = user32.GetWindowDC(hwnd)
  memory_dc = gdi32.CreateCompatibleDC(window_dc)
  bitmap = gdi32.CreateCompatibleBitmap(window_dc, width, height)
  gdi32.SelectObject(memory_dc, bitmap)
  # PW_RENDERFULLCONTENT, so GPU-composited content is captured too.
  user32.PrintWindow(hwnd, memory_dc, 2)

  header = BITMAPINFOHEADER()
  header.biSize = ctypes.sizeof(BITMAPINFOHEADER)
  header.biWidth, header.biHeight = width, -height
  header.biPlanes, header.biBitCount = 1, 32
  buffer = ctypes.create_string_buffer(width * height * 4)
  gdi32.GetDIBits(memory_dc, bitmap, 0, height, buffer, ctypes.byref(header), 0)

  gdi32.DeleteObject(bitmap)
  gdi32.DeleteDC(memory_dc)
  user32.ReleaseDC(hwnd, window_dc)

  image = Image.frombuffer("RGBA", (width, height), buffer, "raw", "BGRA", 0, 1)
  image = image.convert("RGB")
  # The window rectangle includes the resize border, which comes out as a
  # flat frame. Trim it.
  frame = Image.new("RGB", image.size, image.getpixel((0, 0)))
  box = ImageChops.difference(image, frame).getbbox()
  if box:
    image = image.crop(box)
  image.save(path, optimize=True)
  return image.size


def capture_screen(hwnd, path):
  user32.SetForegroundWindow(hwnd)
  time.sleep(0.4)
  rect = wintypes.RECT()
  user32.GetWindowRect(hwnd, ctypes.byref(rect))
  # The window rectangle includes the invisible resize border on the sides
  # and the bottom, which would show whatever is behind the window.
  border = 8
  image = ImageGrab.grab(
    bbox=(rect.left + border, rect.top, rect.right - border,
          rect.bottom - border),
    all_screens=True)
  image.convert("RGB").save(path, optimize=True)
  return image.size


# Mark: scenes

WAIT_LOADED = """
  const wait = ms => new Promise(r => setTimeout(r, ms));
  const loaded = async tab => {
    for (let i = 0; i < 80; i++) {
      const browser = tab.linkedBrowser;
      if (!browser.webProgress?.isLoadingDocument &&
          browser.currentURI.spec != "about:blank") {
        break;
      }
      await wait(250);
    }
  };
  const open = async (url, background = true) => {
    const tab = gBrowser.addTrustedTab(url, { inBackground: background });
    await loaded(tab);
    return tab;
  };
"""

SCENES = [
  ("main", WAIT_LOADED + """
    await gHarborWorkspaces.promiseInitialized;
    window.__shots = {};
    const shots = window.__shots;
    shots.welcome = await open(arguments[0] + "welcome.html", false);
    shots.wiki = await open("https://ru.wikipedia.org/wiki/Браузер");
    shots.repo = await open("https://github.com/Ivantech123/Harbor");
    shots.second = await open("https://ru.wikipedia.org/wiki/Гавань");
    for (const tab of [...gBrowser.tabs]) {
      if (!Object.values(shots).includes(tab) &&
          !tab.hasAttribute("harbor-empty-tab")) {
        gBrowser.removeTab(tab);
      }
    }
    gBrowser.selectedTab = shots.welcome;
    await wait(1500);
  """),
  ("site", WAIT_LOADED + """
    gBrowser.selectedTab = window.__shots.wiki;
    await wait(1500);
  """),
  ("split-view", WAIT_LOADED + """
    const { wiki, second } = window.__shots;
    gHarborViewSplitter.splitTabs([wiki, second], "grid", -1);
    gBrowser.selectedTab = wiki;
    await wait(2500);
  """),
  ("mods", WAIT_LOADED + """
    window.__shots.mods = await open(arguments[0] + "mods.html", false);
    await wait(2000);
  """),
  ("guide", WAIT_LOADED + """
    gBrowser.removeTab(window.__shots.mods);
    window.__shots.guide = await open(arguments[0] + "guide.html", false);
    await wait(1500);
  """),
  ("settings", WAIT_LOADED + """
    gBrowser.removeTab(window.__shots.guide);
    window.__shots.settings = await open("about:preferences#harborLooks", false);
    await wait(3000);
  """),
]


# Buttons that move the setup on without changing anything on the machine:
# no import from another browser, no default browser, no extension install.
ONBOARDING_START = """
  document.getElementById("harbor-welcome-start-button").click();
  await new Promise(r => setTimeout(r, 2500));
"""

ONBOARDING_NEXT = """
  const SAFE = [
    "harbor-generic-next",
    "harbor-welcome-import-no",
    "harbor-welcome-block-ads-no",
    "harbor-welcome-skip",
    "harbor-welcome-dont-set-default-browser",
  ];
  const buttons = [...document.querySelectorAll(
    "#harbor-welcome-page-sidebar-buttons button")];
  const id = button => button.getAttribute("data-l10n-id");
  const finish = buttons.find(b => id(b) === "harbor-welcome-start-browsing");
  const next = SAFE.map(l10n => buttons.find(b => id(b) === l10n)).find(Boolean);
  (next ?? finish)?.click();
  await new Promise(r => setTimeout(r, 1800));
  return next ? "next" : "done";
"""


def write_profile(path, prefs):
  os.makedirs(path, exist_ok=True)
  with open(os.path.join(path, "user.js"), "w", encoding="utf-8") as f:
    for name, value in prefs.items():
      f.write(f"user_pref({json.dumps(name)}, {json.dumps(value)});\n")


def launch(binary, profile):
  return subprocess.Popen([
    binary, "-profile", profile, "-no-remote", "-marionette",
    "-remote-allow-system-access", "-width", "1440", "-height", "900",
  ])


def session(binary, prefs, work):
  profile = tempfile.mkdtemp(prefix="profile-", dir=work)
  write_profile(profile, prefs)
  process = launch(binary, profile)
  client = Marionette(PORT)
  # The launcher process hands over to another one, ask the browser itself.
  pid = client.run("return Services.appinfo.processID;")
  return process, client, pid


def main():
  parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
  parser.add_argument("--binary", required=True)
  parser.add_argument("--out", default=os.path.join("docs", "screenshots"))
  parser.add_argument("--only", nargs="*", help="Scene names to take")
  args = parser.parse_args()

  ctypes.windll.shcore.SetProcessDpiAwareness(2)
  os.makedirs(args.out, exist_ok=True)
  work = tempfile.mkdtemp(prefix="harbor-shots-")
  wanted = lambda name: not args.only or name in args.only

  try:
    if wanted("onboarding"):
      # A new profile starts on the first-run setup. Walk through it.
      process, client, pid = session(args.binary, PREFS, work)
      try:
        time.sleep(9)
        hwnd = find_window(pid)

        def shot(name):
          # Off the screen rather than out of the window: the setup opens
          # popups, which are windows of their own.
          print(name, capture_screen(hwnd, os.path.join(args.out, f"{name}.png")))

        shot("onboarding-1-start")
        client.run(ONBOARDING_START)
        for step in range(2, 12):
          shot(f"onboarding-{step}")
          if client.run(ONBOARDING_NEXT) == "done":
            time.sleep(4)
            shot("onboarding-finished")
            break
      finally:
        client.quit()
        time.sleep(5)

    scenes = [scene for scene in SCENES if wanted(scene[0])]
    if scenes:
      prefs = dict(PREFS, **{"harbor.welcome-screen.seen": True})
      process, client, pid = session(args.binary, prefs, work)
      try:
        time.sleep(6)
        hwnd = find_window(pid)
        # Later scenes build on the tabs of the earlier ones.
        for name, script in SCENES:
          client.run(script, PAGES)
          if wanted(name):
            size = capture(hwnd, os.path.join(args.out, f"{name}.png"))
            print(name, size)
      finally:
        client.quit()
        time.sleep(5)
  finally:
    shutil.rmtree(work, ignore_errors=True)


if __name__ == "__main__":
  try:
    main()
  except (OSError, RuntimeError, subprocess.SubprocessError) as e:
    print(f"take_screenshots: {e}", file=sys.stderr)
    sys.exit(1)
