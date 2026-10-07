// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Harbor share server. Stores the documents the browser uploads when a
// space, a folder or a split view is shared, and serves them back.
//
//   POST /api/shares[?name=]   create a share            (key required)
//   GET  /api/shares/{id}      share with its metadata   (key required)
//   GET  /{slug}/{id}          public page for the link
//   GET  /healthz
//
// No dependencies, Node 20 or newer. Configuration is in the environment,
// see README.md.

import { createServer } from "node:http";
import { randomInt, timingSafeEqual, createHash } from "node:crypto";
import { mkdir, readFile, writeFile, readdir, unlink } from "node:fs/promises";
import { join, resolve } from "node:path";
import { pathToFileURL } from "node:url";

const MIB = 1024 * 1024;

function list(value) {
  return (value ?? "")
    .split(",")
    .map(item => item.trim())
    .filter(Boolean);
}

export function readConfig(env = process.env) {
  return {
    port: Number(env.PORT ?? 8787),
    host: env.HOST ?? "0.0.0.0",
    dataDir: resolve(env.DATA_DIR ?? "./data"),
    // Sent by every browser build. Shares made with it expire.
    apiKeys: list(env.API_KEYS ?? "harbor-desktop"),
    // Private keys. Shares made with one never expire.
    secretKeys: list(env.SECRET_KEYS),
    ttlDays: Number(env.TTL_DAYS ?? 30),
    maxBytes: Number(env.MAX_BYTES ?? 25 * MIB),
    // Creations per client address per hour.
    rateLimit: Number(env.RATE_LIMIT ?? 30),
    // Set when the server sits behind a reverse proxy that sets
    // X-Forwarded-For.
    trustProxy: env.TRUST_PROXY === "1",
  };
}

// Mark: ids

// No 0/O or 1/I/L, the id may be read out loud or retyped.
const ID_ALPHABET = "ABCDEFGHJKMNPQRSTUVWXYZ23456789";
const ID_RE = /^[0-9A-Z]{4}-[0-9A-Z]{4}-[0-9A-Z]{4}-[0-9A-Z]{4}$/;

export function newId() {
  const groups = [];
  for (let group = 0; group < 4; group++) {
    let chars = "";
    for (let i = 0; i < 4; i++) {
      chars += ID_ALPHABET[randomInt(ID_ALPHABET.length)];
    }
    groups.push(chars);
  }
  return groups.join("-");
}

const SLUGS = { space: "space", folder: "folder", splitView: "split-view" };
const PAGE_RE = /^\/(space|folder|split-view|split)\/([0-9A-Za-z-]{19})\/?$/;
const API_ITEM_RE = /^\/api\/shares\/([0-9A-Za-z-]{19})\/?$/;

// Mark: document validation, mirrors share.schema.json in the browser

const MAX_DEPTH = 16;

function fail(message) {
  const error = new Error(message);
  error.invalid = true;
  throw error;
}

function onlyKeys(object, allowed, where) {
  if (object === null || typeof object !== "object" || Array.isArray(object)) {
    fail(`${where} must be an object`);
  }
  for (const key of Object.keys(object)) {
    if (!allowed.includes(key)) {
      fail(`${where} has an unknown property "${key}"`);
    }
  }
}

function optional(object, key, type, where) {
  if (key in object && typeof object[key] !== type) {
    fail(`${where}.${key} must be a ${type}`);
  }
}

function validateTab(tab, where) {
  onlyKeys(tab, ["type", "url", "label", "image", "isPinned"], where);
  if (typeof tab.url !== "string") {
    fail(`${where}.url must be a string`);
  }
  let parsed;
  try {
    parsed = new URL(tab.url);
  } catch {
    fail(`${where}.url is not a URL`);
  }
  // Stricter than the schema on purpose: a shared tab is opened by whoever
  // imports the share.
  if (parsed.protocol !== "http:" && parsed.protocol !== "https:") {
    fail(`${where}.url must be http or https`);
  }
  optional(tab, "label", "string", where);
  optional(tab, "image", "string", where);
  optional(tab, "isPinned", "boolean", where);
}

function validateSplitView(split, where) {
  onlyKeys(split, ["type", "tabs"], where);
  if (
    !Array.isArray(split.tabs) ||
    split.tabs.length < 2 ||
    split.tabs.length > 4
  ) {
    fail(`${where}.tabs must hold 2 to 4 tabs`);
  }
  split.tabs.forEach((tab, i) => {
    if (tab?.type !== "tab") {
      fail(`${where}.tabs[${i}] must be a tab`);
    }
    validateTab(tab, `${where}.tabs[${i}]`);
  });
}

function validateItems(items, where, depth) {
  if (!Array.isArray(items)) {
    fail(`${where} must be an array`);
  }
  items.forEach((item, i) => {
    const at = `${where}[${i}]`;
    switch (item?.type) {
      case "tab":
        validateTab(item, at);
        break;
      case "folder":
        validateFolder(item, at, depth + 1);
        break;
      case "splitView":
        validateSplitView(item, at);
        break;
      default:
        fail(`${at} has an unknown type`);
    }
  });
}

function validateFolder(folder, where, depth) {
  if (depth > MAX_DEPTH) {
    fail(`${where} is nested too deep`);
  }
  onlyKeys(folder, ["type", "name", "icon", "items"], where);
  if (typeof folder.name !== "string") {
    fail(`${where}.name must be a string`);
  }
  optional(folder, "icon", "string", where);
  validateItems(folder.items, `${where}.items`, depth);
}

function validateTheme(theme, where) {
  onlyKeys(theme, ["type", "gradientColors"], where);
  if (theme.type !== "gradient") {
    fail(`${where}.type must be "gradient"`);
  }
  if (!Array.isArray(theme.gradientColors) || !theme.gradientColors.length) {
    fail(`${where}.gradientColors must not be empty`);
  }
  theme.gradientColors.forEach((color, i) => {
    const at = `${where}.gradientColors[${i}]`;
    onlyKeys(
      color,
      ["c", "isCustom", "algorithm", "isPrimary", "lightness", "position", "type"],
      at
    );
    if (
      !Array.isArray(color.c) ||
      color.c.length !== 3 ||
      color.c.some(n => typeof n !== "number")
    ) {
      fail(`${at}.c must be three numbers`);
    }
    if (typeof color.type !== "string") {
      fail(`${at}.type must be a string`);
    }
    optional(color, "isCustom", "boolean", at);
    optional(color, "algorithm", "string", at);
    optional(color, "isPrimary", "boolean", at);
    optional(color, "lightness", "string", at);
    if ("position" in color) {
      onlyKeys(color.position, ["x", "y"], `${at}.position`);
      if (
        typeof color.position.x !== "number" ||
        typeof color.position.y !== "number"
      ) {
        fail(`${at}.position needs numeric x and y`);
      }
    }
  });
}

/**
 * @param {object} doc
 * @returns {string} The type of the shared item.
 */
export function validateDocument(doc) {
  onlyKeys(doc, ["version", "shared"], "document");
  optional(doc, "version", "string", "document");
  const shared = doc.shared;
  switch (shared?.type) {
    case "space":
      onlyKeys(shared, ["type", "name", "theme", "items"], "shared");
      if (typeof shared.name !== "string") {
        fail("shared.name must be a string");
      }
      if ("theme" in shared) {
        validateTheme(shared.theme, "shared.theme");
      }
      validateItems(shared.items, "shared.items", 0);
      break;
    case "folder":
      validateFolder(shared, "shared", 0);
      break;
    case "splitView":
      validateSplitView(shared, "shared");
      break;
    default:
      fail("shared has an unknown type");
  }
  return shared.type;
}

// Mark: storage, one JSON file per share

export class ShareStore {
  constructor(dataDir) {
    this.dir = dataDir;
  }

  #path(id) {
    return join(this.dir, `${id}.json`);
  }

  async init() {
    await mkdir(this.dir, { recursive: true });
  }

  async put(record) {
    await writeFile(this.#path(record.id), JSON.stringify(record), {
      // Never overwrite a share on an id collision.
      flag: "wx",
    });
  }

  async get(id) {
    if (!ID_RE.test(id)) {
      return null;
    }
    let record;
    try {
      record = JSON.parse(await readFile(this.#path(id), "utf8"));
    } catch {
      return null;
    }
    if (record.expiresAt && Date.parse(record.expiresAt) <= Date.now()) {
      return null;
    }
    return record;
  }

  async sweep() {
    let removed = 0;
    for (const file of await readdir(this.dir)) {
      if (!file.endsWith(".json")) {
        continue;
      }
      try {
        const path = join(this.dir, file);
        const { expiresAt } = JSON.parse(await readFile(path, "utf8"));
        if (expiresAt && Date.parse(expiresAt) <= Date.now()) {
          await unlink(path);
          removed++;
        }
      } catch {
        // Unreadable file, leave it for a human.
      }
    }
    return removed;
  }
}

// Mark: http

class HttpError extends Error {
  constructor(status, message) {
    super(message);
    this.status = status;
  }
}

function digest(value) {
  return createHash("sha256").update(value).digest();
}

function matchesAny(key, keys) {
  if (!key) {
    return false;
  }
  const given = digest(key);
  let found = false;
  for (const candidate of keys) {
    // Compare them all, the time taken must not tell which one matched.
    if (timingSafeEqual(given, digest(candidate))) {
      found = true;
    }
  }
  return found;
}

function escapeHtml(text) {
  return String(text).replace(
    /[&<>"']/g,
    char =>
      ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[
        char
      ]
  );
}

function countTabs(item) {
  if (item.type === "tab") {
    return 1;
  }
  return (item.items ?? item.tabs ?? []).reduce(
    (sum, child) => sum + countTabs(child),
    0
  );
}

const KIND_LABELS = {
  space: "A Space",
  folder: "A Folder",
  splitView: "A Split View",
};

function page(status, title, body) {
  return {
    status,
    headers: {
      "content-type": "text/html; charset=utf-8",
      "content-security-policy": "default-src 'none'; style-src 'unsafe-inline'",
      "x-content-type-options": "nosniff",
      "referrer-policy": "no-referrer",
    },
    body: `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex">
<title>${escapeHtml(title)}</title>
<style>
  :root { color-scheme: light dark; }
  body { margin: 0; min-height: 100vh; display: grid; place-items: center;
    font: 16px/1.5 system-ui, sans-serif; background: Canvas; color: CanvasText; }
  main { max-width: 440px; padding: 32px 20px; text-align: center; }
  h1 { font-size: 1.6em; margin: 0 0 8px; overflow-wrap: anywhere; }
  p { margin: 0 0 12px; opacity: .75; }
  .kind { font-size: .85em; letter-spacing: .06em; text-transform: uppercase; }
</style>
</head>
<body><main>${body}</main></body>
</html>`,
  };
}

function sharePage(record) {
  const shared = record.data.shared;
  const kind = KIND_LABELS[shared.type];
  const from = record.name ? ` from ${record.name}` : "";
  const title = shared.name ?? "Split View";
  const tabs = countTabs(shared);
  return page(
    200,
    `${title} - Harbor`,
    `<p class="kind">${escapeHtml(kind + from)}</p>
<h1>${escapeHtml(title)}</h1>
<p>${tabs} ${tabs === 1 ? "tab" : "tabs"}</p>
<p>Open this link in Harbor to preview and import it.</p>`
  );
}

function json(status, value) {
  return {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store",
      "x-content-type-options": "nosniff",
    },
    body: JSON.stringify(value),
  };
}

function readBody(request, maxBytes) {
  return new Promise((resolvePromise, reject) => {
    const declared = Number(request.headers["content-length"]);
    if (declared > maxBytes) {
      reject(new HttpError(413, "share document is too large"));
      request.resume();
      return;
    }
    const chunks = [];
    let size = 0;
    request.on("data", chunk => {
      size += chunk.length;
      if (size > maxBytes) {
        reject(new HttpError(413, "share document is too large"));
        request.destroy();
        return;
      }
      chunks.push(chunk);
    });
    request.on("end", () => resolvePromise(Buffer.concat(chunks)));
    request.on("error", reject);
  });
}

export function createApp(config, store = new ShareStore(config.dataDir)) {
  // address -> timestamps of the creations in the last hour
  const creations = new Map();

  function clientAddress(request) {
    if (config.trustProxy) {
      const forwarded = request.headers["x-forwarded-for"];
      if (forwarded) {
        return String(forwarded).split(",")[0].trim();
      }
    }
    return request.socket.remoteAddress ?? "unknown";
  }

  function checkRate(request) {
    const address = clientAddress(request);
    const since = Date.now() - 60 * 60 * 1000;
    const recent = (creations.get(address) ?? []).filter(time => time > since);
    if (recent.length >= config.rateLimit) {
      creations.set(address, recent);
      throw new HttpError(429, "too many shares, try again later");
    }
    recent.push(Date.now());
    creations.set(address, recent);
  }

  // "secret" for a private key, "api" for the browser key.
  function authorize(request) {
    if (matchesAny(request.headers["x-secret-key"], config.secretKeys)) {
      return "secret";
    }
    if (matchesAny(request.headers["x-api-key"], config.apiKeys)) {
      return "api";
    }
    throw new HttpError(401, "missing or unknown key");
  }

  async function create(request, url) {
    const level = authorize(request);
    checkRate(request);
    const raw = await readBody(request, config.maxBytes);
    let data;
    try {
      data = JSON.parse(raw.toString("utf8"));
    } catch {
      throw new HttpError(400, "body is not JSON");
    }
    let type;
    try {
      type = validateDocument(data);
    } catch (e) {
      if (e.invalid) {
        throw new HttpError(422, e.message);
      }
      throw e;
    }
    const name = (url.searchParams.get("name") ?? "").trim().slice(0, 200);
    const now = Date.now();
    const record = {
      id: newId(),
      name: name || null,
      createdAt: new Date(now).toISOString(),
      expiresAt:
        level === "secret"
          ? null
          : new Date(now + config.ttlDays * 24 * 60 * 60 * 1000).toISOString(),
      size: raw.length,
      data,
    };
    await store.put(record);
    return json(201, {
      id: record.id,
      name: record.name,
      createdAt: record.createdAt,
      expiresAt: record.expiresAt,
      size: record.size,
      url: `/api/shares/${record.id}`,
      webUrl: `/${SLUGS[type]}/${record.id}`,
    });
  }

  async function route(request) {
    const url = new URL(request.url, "http://localhost");
    const path = url.pathname;

    if (path === "/healthz") {
      return json(200, { ok: true });
    }

    if (path === "/api/shares" || path === "/api/shares/") {
      if (request.method !== "POST") {
        throw new HttpError(405, "method not allowed");
      }
      return create(request, url);
    }

    const item = path.match(API_ITEM_RE);
    if (item) {
      if (request.method !== "GET") {
        throw new HttpError(405, "method not allowed");
      }
      authorize(request);
      const record = await store.get(item[1].toUpperCase());
      if (!record) {
        throw new HttpError(404, "share not found or expired");
      }
      return json(200, record);
    }

    const shared = path.match(PAGE_RE);
    if (shared && (request.method === "GET" || request.method === "HEAD")) {
      const record = await store.get(shared[2].toUpperCase());
      if (!record) {
        return page(
          404,
          "Link not found - Harbor",
          "<h1>This link is gone</h1><p>The share was not found or has expired.</p>"
        );
      }
      return sharePage(record);
    }

    if (path === "/" && request.method === "GET") {
      return page(
        200,
        "Harbor Share",
        "<h1>Harbor Share</h1><p>Links made with Share in Harbor open here.</p>"
      );
    }

    throw new HttpError(404, "not found");
  }

  return async function handle(request, response) {
    let result;
    try {
      result = await route(request);
    } catch (e) {
      if (!(e instanceof HttpError)) {
        console.error("share-server:", e);
      }
      result = json(e instanceof HttpError ? e.status : 500, {
        error: e instanceof HttpError ? e.message : "internal error",
      });
    }
    response.writeHead(result.status, result.headers);
    response.end(request.method === "HEAD" ? undefined : result.body);
  };
}

export async function start(config = readConfig()) {
  const store = new ShareStore(config.dataDir);
  await store.init();
  const server = createServer(createApp(config, store));
  // Expired shares are already hidden on read, this only frees the disk.
  const sweeper = setInterval(
    () => store.sweep().catch(e => console.error("share-server: sweep", e)),
    60 * 60 * 1000
  );
  sweeper.unref();
  await new Promise(done => server.listen(config.port, config.host, done));
  return server;
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  const config = readConfig();
  await start(config);
  console.log(
    `share-server: listening on ${config.host}:${config.port}, data in ${config.dataDir}`
  );
}
