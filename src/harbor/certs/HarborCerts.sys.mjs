// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

const PREF = "harbor.certs.russian-trusted.enabled";

// Official Russian Trusted CA certificates published by the Ministry of
// Digital Development. Trust is limited to TLS server authentication.
const CERTS = [
  {
    nickname: "Russian Trusted Root CA",
    url: "chrome://browser/content/harbor/russian_trusted_root_ca.cer",
  },
  {
    nickname: "Russian Trusted Sub CA",
    url: "chrome://browser/content/harbor/russian_trusted_sub_ca.cer",
  },
];

let pending;

const PEM_RE =
  /-----BEGIN CERTIFICATE-----([A-Za-z0-9+/=\s]+)-----END CERTIFICATE-----/;

// The certificates are published both as DER and as PEM under the same
// extension, accept either.
async function certUrlToBase64(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Harbor certs: failed to read ${url}`);
  }
  const bytes = new Uint8Array(await response.arrayBuffer());
  let binary = "";
  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }
  const pem = binary.match(PEM_RE);
  return pem ? pem[1].replace(/\s+/g, "") : btoa(binary);
}

function alreadyImported(certDB, nickname) {
  try {
    return !!certDB.findCertByNickname(nickname);
  } catch {
    return false;
  }
}

async function importCert(certDB, cert) {
  if (alreadyImported(certDB, cert.nickname)) {
    return;
  }
  const base64 = await certUrlToBase64(cert.url);
  certDB.addCertFromBase64(base64, "C,,", cert.nickname);
}

export function ensureRussianTrustedCerts() {
  if (!Services.prefs.getBoolPref(PREF, true)) {
    return Promise.resolve();
  }
  pending ??= (async () => {
    const certDB = Cc["@mozilla.org/security/x509certdb;1"].getService(
      Ci.nsIX509CertDB
    );
    for (const cert of CERTS) {
      await importCert(certDB, cert);
    }
  })().catch(error => {
    pending = null;
    console.error("Harbor certs: import failed", error);
  });
  return pending;
}
