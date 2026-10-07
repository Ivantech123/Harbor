<!--
   - This Source Code Form is subject to the terms of the Mozilla Public
   - License, v. 2.0. If a copy of the MPL was not distributed with this
   - file, You can obtain one at http://mozilla.org/MPL/2.0/.
   -->

# Harbor share server

Stores what the browser uploads when a space, a folder or a split view is
shared, and serves it back to whoever opens the link in Harbor.

No dependencies. Needs Node 20 or newer.

```sh
node server.mjs        # listens on :8787, data in ./data
node --test            # tests
```

## Configuration

| Variable      | Default          | Meaning                                                         |
| ------------- | ---------------- | --------------------------------------------------------------- |
| `PORT`        | `8787`           | Port to listen on                                               |
| `HOST`        | `0.0.0.0`        | Address to listen on                                            |
| `DATA_DIR`    | `./data`         | Where shares are stored, one JSON file each                     |
| `API_KEYS`    | `harbor-desktop` | Comma separated keys the browser builds send. Shares expire     |
| `SECRET_KEYS` | none             | Comma separated private keys. Shares made with one never expire |
| `TTL_DAYS`    | `30`             | Lifetime of a share made with an API key                        |
| `MAX_BYTES`   | `26214400`       | Largest accepted document (25 MiB)                              |
| `RATE_LIMIT`  | `30`             | Shares one address may create per hour                          |
| `TRUST_PROXY` | unset            | `1` to take the client address from `X-Forwarded-For`           |

The API key ships inside every browser build, so it is not a secret. It
only keeps casual clients out; the rate limit and the size limit are what
protect the server.

## Pointing the browser at it

Serve it over HTTPS (put it behind a reverse proxy and set `TRUST_PROXY=1`),
then set in `prefs/harbor/share.yaml`:

- `harbor.share.base-url` to the public address, for example
  `https://share.example.org`
- `harbor.share.api-key` to one of `API_KEYS`

Sharing stays hidden in the browser while `harbor.share.base-url` is empty.

## API

- `POST /api/shares?name=` with a document matching
  `src/harbor/share/share.schema.json`. Answers `201` with
  `{ id, name, createdAt, expiresAt, size, url, webUrl }`.
- `GET /api/shares/{id}` answers the same metadata plus `data`.
- `GET /space/{id}`, `/folder/{id}`, `/split-view/{id}` are the public
  pages the links point at.
- `GET /healthz`

Both API calls need `x-api-key` or `x-secret-key`. Tab URLs other than
`http` and `https` are refused.
