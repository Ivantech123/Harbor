// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

const PREF = "harbor.proxy.ru-direct.enabled";

// Zones the user asked to open outside a VPN or VLESS client.
const RUSSIAN_SUFFIXES = [".ru", ".su", ".xn--p1ai"];

// Russian services that are not under those zones but fail the same way
// when a tunnel is up.
const RUSSIAN_HOSTS = new Set([
  "vk.com",
  "userapi.com",
  "vkuseraudio.net",
  "yandex.com",
  "yandex.net",
  "yastatic.net",
  "yandex.st",
]);

// Process names of VLESS clients and common VPN apps. Matched as substrings
// of the process list, so keep them specific.
const VPN_PROCESS_MARKERS = [
  "v2rayn",
  "v2ray",
  "xray",
  "sing-box",
  "hiddify",
  "nekoray",
  "nekobox",
  "clash-verge",
  "flclash",
  "mihomo",
  "throne",
  "happ.exe",
  "amnezia",
  "wireguard",
  "openvpn",
  "tun2socks",
  "karing",
  "furious",
  "outline",
  "protonvpn",
  "nordvpn",
  "expressvpn",
  "surfshark",
  "windscribe",
  "warp-svc",
  "cloudflare warp",
];

const SCAN_INTERVAL_MS = 20000;

let registered = false;
let vpnProcessRunning = false;
let localProxyEnabled = false;
let scanTimer = 0;

function hostOf(channel) {
  try {
    return channel.URI.asciiHost.toLowerCase().replace(/\.$/, "");
  } catch {
    return "";
  }
}

export function isRussianHost(host) {
  if (!host) {
    return false;
  }
  if (RUSSIAN_HOSTS.has(host)) {
    return true;
  }
  for (const suffix of RUSSIAN_HOSTS) {
    if (host.endsWith(`.${suffix}`)) {
      return true;
    }
  }
  for (const suffix of RUSSIAN_SUFFIXES) {
    if (host === suffix.slice(1) || host.endsWith(suffix)) {
      return true;
    }
  }
  return false;
}

function isLoopbackProxy(proxyInfo) {
  const host = proxyInfo?.host?.toLowerCase();
  return (
    host === "localhost" ||
    host === "127.0.0.1" ||
    host === "::1" ||
    host === "[::1]"
  );
}

function localSystemProxyEnabled() {
  if (!Services.appinfo.OS.toLowerCase().startsWith("win")) {
    return false;
  }
  let key;
  try {
    key = Cc["@mozilla.org/windows-registry-key;1"].createInstance(
      Ci.nsIWindowsRegKey
    );
    key.open(
      Ci.nsIWindowsRegKey.ROOT_KEY_CURRENT_USER,
      "Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings",
      Ci.nsIWindowsRegKey.ACCESS_READ
    );
    if (key.readIntValue("ProxyEnable") !== 1) {
      return false;
    }
    const server = key.readStringValue("ProxyServer").toLowerCase();
    return (
      server.includes("127.0.0.1") ||
      server.includes("localhost") ||
      server.includes("[::1]")
    );
  } catch {
    return false;
  } finally {
    try {
      key?.close();
    } catch {
      // Already closed or never opened.
    }
  }
}

async function readProcessList() {
  const { Subprocess } = ChromeUtils.importESModule(
    "resource://gre/modules/Subprocess.sys.mjs"
  );
  const os = Services.appinfo.OS.toLowerCase();
  const command = os.startsWith("win") ? "tasklist" : "/bin/ps";
  const arguments_ = os.startsWith("win")
    ? ["/FO", "CSV", "/NH"]
    : ["-ax", "-o", "comm="];
  const proc = await Subprocess.call({
    command,
    arguments: arguments_,
    stderr: "stdout",
  });
  return (await proc.stdout.readString()).toLowerCase();
}

async function refreshVpnProcess() {
  localProxyEnabled = localSystemProxyEnabled();
  try {
    const listing = await readProcessList();
    vpnProcessRunning = VPN_PROCESS_MARKERS.some(marker =>
      listing.includes(marker)
    );
  } catch (error) {
    console.error("Harbor: failed to scan VPN processes", error);
    vpnProcessRunning = false;
  }
}

function tunnelIsActive(proxyInfo) {
  return vpnProcessRunning || localProxyEnabled || isLoopbackProxy(proxyInfo);
}

const filter = {
  applyFilter(channel, proxyInfo, callback) {
    if (
      !Services.prefs.getBoolPref(PREF, true) ||
      !proxyInfo ||
      !tunnelIsActive(proxyInfo) ||
      !isRussianHost(hostOf(channel))
    ) {
      callback.onProxyFilterResult(proxyInfo);
      return;
    }
    // null is a direct connection. A TUN-mode VPN still captures the
    // socket below the browser; this bypass works for proxy-mode clients.
    callback.onProxyFilterResult(null);
  },
};

export function ensureRuDirect() {
  if (registered || !Services.prefs.getBoolPref(PREF, true)) {
    return;
  }
  registered = true;
  const service = Cc["@mozilla.org/network/protocol-proxy-service;1"].getService(
    Ci.nsIProtocolProxyService
  );
  service.registerChannelFilter(filter, 0);
  refreshVpnProcess();
  scanTimer = setInterval(refreshVpnProcess, SCAN_INTERVAL_MS);
}

export function _testReset() {
  registered = false;
  vpnProcessRunning = false;
  localProxyEnabled = false;
  if (scanTimer) {
    clearInterval(scanTimer);
    scanTimer = 0;
  }
}
