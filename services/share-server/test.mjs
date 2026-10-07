// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Run with: node --test

import { test } from "node:test";
import assert from "node:assert/strict";
import { mkdtemp, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { start, readConfig, validateDocument, newId } from "./server.mjs";

const SPACE = {
  version: "1",
  shared: {
    type: "space",
    name: "Work <b>",
    items: [
      { type: "tab", url: "https://example.com/", label: "Example" },
      {
        type: "folder",
        name: "Docs",
        items: [{ type: "tab", url: "https://example.org/" }],
      },
    ],
  },
};

async function withServer(env, run) {
  const dataDir = await mkdtemp(join(tmpdir(), "harbor-share-"));
  const server = await start(
    readConfig({ PORT: "0", HOST: "127.0.0.1", DATA_DIR: dataDir, ...env })
  );
  const base = `http://127.0.0.1:${server.address().port}`;
  try {
    await run(base);
  } finally {
    await new Promise(done => server.close(done));
    await rm(dataDir, { recursive: true, force: true });
  }
}

function post(base, doc, headers = { "x-api-key": "harbor-desktop" }, query = "") {
  return fetch(`${base}/api/shares${query}`, {
    method: "POST",
    headers: { "content-type": "application/json", ...headers },
    body: typeof doc === "string" ? doc : JSON.stringify(doc),
  });
}

test("ids match what the browser recognizes", () => {
  assert.match(newId(), /^[0-9A-Z]{4}-[0-9A-Z]{4}-[0-9A-Z]{4}-[0-9A-Z]{4}$/);
});

test("create, read back and render a share", async () => {
  await withServer({}, async base => {
    const response = await post(base, SPACE, undefined, "?name=Ivan");
    assert.equal(response.status, 201);
    const created = await response.json();
    assert.equal(created.webUrl, `/space/${created.id}`);
    assert.equal(created.name, "Ivan");
    assert.ok(created.expiresAt, "a share made with the API key expires");

    const read = await fetch(`${base}/api/shares/${created.id.toLowerCase()}`, {
      headers: { "x-api-key": "harbor-desktop" },
    });
    assert.equal(read.status, 200);
    assert.deepEqual((await read.json()).data, SPACE);

    const html = await (await fetch(base + created.webUrl)).text();
    assert.ok(html.includes("Work &lt;b&gt;"), "the name is escaped");
    assert.ok(html.includes("2 tabs"));
  });
});

test("a secret key makes the share permanent", async () => {
  await withServer({ SECRET_KEYS: "shhh" }, async base => {
    const response = await post(base, SPACE, { "x-secret-key": "shhh" });
    assert.equal(response.status, 201);
    assert.equal((await response.json()).expiresAt, null);
  });
});

test("requests without a known key are refused", async () => {
  await withServer({}, async base => {
    assert.equal((await post(base, SPACE, {})).status, 401);
    assert.equal((await post(base, SPACE, { "x-api-key": "nope" })).status, 401);
    const read = await fetch(`${base}/api/shares/AAAA-AAAA-AAAA-AAAA`);
    assert.equal(read.status, 401);
  });
});

test("bad documents are refused", async () => {
  await withServer({ MAX_BYTES: "2000" }, async base => {
    assert.equal((await post(base, "{")).status, 400);
    assert.equal((await post(base, { shared: { type: "nope" } })).status, 422);
    const script = structuredClone(SPACE);
    script.shared.items[0].url = "javascript:alert(1)";
    assert.equal((await post(base, script)).status, 422);
    const big = structuredClone(SPACE);
    big.shared.name = "x".repeat(4000);
    assert.equal((await post(base, big)).status, 413);
  });
});

test("unknown and expired shares answer 404", async () => {
  await withServer({ TTL_DAYS: "0" }, async base => {
    const created = await (await post(base, SPACE)).json();
    const read = await fetch(`${base}/api/shares/${created.id}`, {
      headers: { "x-api-key": "harbor-desktop" },
    });
    assert.equal(read.status, 404);
    assert.equal((await fetch(base + created.webUrl)).status, 404);
    assert.equal((await fetch(`${base}/space/../etc`)).status, 404);
  });
});

test("creations are rate limited", async () => {
  await withServer({ RATE_LIMIT: "2" }, async base => {
    assert.equal((await post(base, SPACE)).status, 201);
    assert.equal((await post(base, SPACE)).status, 201);
    assert.equal((await post(base, SPACE)).status, 429);
  });
});

test("the validator mirrors the schema", () => {
  assert.equal(validateDocument(SPACE), "space");
  assert.equal(
    validateDocument({
      shared: {
        type: "splitView",
        tabs: [
          { type: "tab", url: "https://a.example/" },
          { type: "tab", url: "https://b.example/" },
        ],
      },
    }),
    "splitView"
  );
  assert.throws(() => validateDocument({ shared: SPACE.shared, extra: 1 }));
  assert.throws(() =>
    validateDocument({ shared: { type: "splitView", tabs: [] } })
  );
});
