/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const PAGES = "chrome://browser/content/harbor-pages/";

function untranslated(doc) {
  return [...doc.querySelectorAll("[data-l10n-id]")]
    .filter(element => !element.textContent.trim())
    .map(element => element.getAttribute("data-l10n-id"));
}

async function waitForTranslation(doc) {
  await TestUtils.waitForCondition(
    () => !untranslated(doc).length,
    "Every string on the page is translated"
  ).catch(() => {});
  Assert.deepEqual(untranslated(doc), [], "No string is left untranslated");
}

add_task(async function test_pages_load_translated() {
  for (const page of ["welcome", "guide", "mods"]) {
    await BrowserTestUtils.withNewTab(`${PAGES}${page}.html`, async browser => {
      const doc = browser.contentDocument;
      info(`Checking ${page}`);
      await waitForTranslation(doc);
      ok(doc.title.trim(), "The page has a title");
      ok(doc.querySelector("h1").textContent.trim(), "The page has a heading");
    });
  }
});

add_task(async function test_guide_has_every_linked_section() {
  let anchors = [];
  await BrowserTestUtils.withNewTab(`${PAGES}welcome.html`, async browser => {
    anchors = [...browser.contentDocument.querySelectorAll("a[href*='#']")].map(
      link => new URL(link.href).hash.slice(1)
    );
  });
  Assert.greater(anchors.length, 0, "The welcome page links into the guide");
  // The window sync dialog links here too.
  anchors.push("window-sync");
  await BrowserTestUtils.withNewTab(`${PAGES}guide.html`, async browser => {
    for (const anchor of anchors) {
      ok(
        browser.contentDocument.getElementById(anchor),
        `The guide has a "${anchor}" section`
      );
    }
  });
});

add_task(async function test_mods_page_installs_and_removes() {
  const catalog = await gHarborMods.getStoreCatalog();
  const { id } = catalog[0];

  await BrowserTestUtils.withNewTab(`${PAGES}mods.html`, async browser => {
    const doc = browser.contentDocument;
    const cards = () => doc.querySelectorAll("#mods-list .harbor-page-card");
    await TestUtils.waitForCondition(
      () => cards().length === catalog.length,
      "A card per mod in the store"
    );
    await waitForTranslation(doc);
    ok(doc.getElementById("mods-status").hidden, "No error is shown");

    cards()[0].querySelector(".mod-action").click();
    await TestUtils.waitForCondition(
      () => gHarborMods.isModInstalled(id),
      "Clicking the button installs the mod"
    );
    await TestUtils.waitForCondition(
      () =>
        cards()[0]?.querySelector(".mod-action").dataset.l10nId ===
        "harbor-page-mods-remove",
      "The button turns into Remove"
    );

    cards()[0].querySelector(".mod-action").click();
    await TestUtils.waitForCondition(
      async () => !(await gHarborMods.isModInstalled(id)),
      "Clicking it again removes the mod"
    );
  });
});

add_task(async function test_sharing_needs_a_server() {
  ok(Services.harbor, "The Harbor service is registered");
  ok(!gHarborShareManager.enabled, "Sharing is off without a share server");

  await SpecialPowers.pushPrefEnv({
    set: [["harbor.share.base-url", "https://share.example.com"]],
  });
  ok(gHarborShareManager.enabled, "Sharing is on once a server is set");
  await SpecialPowers.popPrefEnv();
});
