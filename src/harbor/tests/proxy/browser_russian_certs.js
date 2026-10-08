/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const { ensureRussianTrustedCerts } = ChromeUtils.importESModule(
  "chrome://browser/content/harbor/HarborCerts.mjs"
);

const CERT_URLS = [
  "chrome://browser/content/harbor/russian_trusted_root_ca.cer",
  "chrome://browser/content/harbor/russian_trusted_sub_ca.cer",
];

async function readCertificate(certDB, url) {
  const text = await (await fetch(url)).text();
  const base64 = text
    .replace(/-----(BEGIN|END) CERTIFICATE-----/g, "")
    .replace(/\s+/g, "");
  return certDB.constructX509FromBase64(base64);
}

add_task(async function test_russian_certificates_are_trusted_for_tls() {
  await ensureRussianTrustedCerts();

  const certDB = Cc["@mozilla.org/security/x509certdb;1"].getService(
    Ci.nsIX509CertDB
  );
  for (const url of CERT_URLS) {
    const cert = await readCertificate(certDB, url);
    ok(
      certDB.isCertTrusted(
        cert,
        Ci.nsIX509Cert.CA_CERT,
        Ci.nsIX509CertDB.TRUSTED_SSL
      ),
      `${cert.commonName} is trusted for TLS`
    );
    ok(
      !certDB.isCertTrusted(
        cert,
        Ci.nsIX509Cert.CA_CERT,
        Ci.nsIX509CertDB.TRUSTED_EMAIL
      ),
      `${cert.commonName} is not trusted for anything else`
    );
  }
});
