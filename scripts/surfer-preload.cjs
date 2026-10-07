// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Loaded before surfer (see the "surfer:run" script) to work around two of
// its problems with this repository:
//
// - On native Windows it rewrites "C:\x" as "/c/x" and hands that to fs,
//   which Node resolves to "C:\c\x".
// - It copies every entry of a branding folder as a file, and ours has a
//   folder in it (msix/Assets).

const fs = require("node:fs");

const existsSync = fs.existsSync;
const copyFileSync = fs.copyFileSync;

fs.copyFileSync = function (source, destination, ...rest) {
  if (fs.statSync(source).isDirectory()) {
    return fs.cpSync(source, destination, { recursive: true });
  }
  return copyFileSync.call(this, source, destination, ...rest);
};

if (process.platform === "win32") {
  const MSYS_PATH_RE = /^\/([a-zA-Z])\/(.*)$/;

  const fixPath = value =>
    typeof value === "string" && MSYS_PATH_RE.test(value) && !existsSync(value)
      ? value.replace(
          MSYS_PATH_RE,
          (_, drive, rest) => `${drive.toUpperCase()}:/${rest}`
        )
      : value;

  const wrapAll = target => {
    for (const name of Object.keys(target)) {
      const original = target[name];
      // Leave classes and constants alone.
      if (typeof original !== "function" || /^[A-Z]/.test(name)) {
        continue;
      }
      const wrapped = function (...args) {
        // Source and destination of copies and renames are both paths.
        for (let i = 0; i < Math.min(args.length, 2); i++) {
          args[i] = fixPath(args[i]);
        }
        return original.apply(this, args);
      };
      Object.assign(wrapped, original);
      try {
        target[name] = wrapped;
      } catch {
        // Read-only export, nothing surfer calls with a path.
      }
    }
  };

  wrapAll(fs.promises);
  wrapAll(fs);
}
