/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const STORE_URL = "chrome://browser/content/harbor-mods-store/";

add_task(async function test_catalog_matches_manifests() {
  const catalog = await gHarborMods.getStoreCatalog();
  Assert.greater(catalog.length, 0, "The bundled store has mods");

  for (const entry of catalog) {
    const mod = await gHarborMods.requestMod(entry.id);
    ok(mod, `${entry.id} has a manifest`);
    Assert.equal(mod.id, entry.id, "The manifest is keyed by the store id");
    Assert.equal(mod.name, entry.name, "Catalog and manifest agree on the name");
    ok(mod.style.startsWith(STORE_URL), "The style is resolved into the store");
    ok(mod.readme.startsWith(STORE_URL), "The readme is resolved into the store");
  }
});

add_task(async function test_install_and_uninstall() {
  const [{ id }] = await gHarborMods.getStoreCatalog();
  ok(!(await gHarborMods.isModInstalled(id)), "Not installed to begin with");

  await gHarborMods.installModFromStore(id);
  ok(await gHarborMods.isModInstalled(id), "Installed");
  const style = PathUtils.join(gHarborMods.getModFolder(id), "chrome.css");
  ok(await IOUtils.exists(style), "The stylesheet is in the profile");
  Assert.greater((await IOUtils.readUTF8(style)).length, 0, "And not empty");
  ok((await gHarborMods.getMods())[id].enabled, "Installed mods start enabled");

  await gHarborMods.uninstallMod(id);
  ok(!(await gHarborMods.isModInstalled(id)), "Uninstalled");
  ok(!(await IOUtils.exists(style)), "The stylesheet is gone");
});

add_task(async function test_bad_ids_are_refused() {
  for (const id of ["../escape", "a/b", "", "with space"]) {
    await Assert.rejects(
      gHarborMods.requestMod(id),
      /Invalid mod id/,
      `"${id}" is not a mod id`
    );
  }
});

add_task(async function test_remote_store_has_to_be_https() {
  await SpecialPowers.pushPrefEnv({
    set: [["harbor.mods.store-url", "http://example.com/store"]],
  });
  await Assert.rejects(
    gHarborMods.getStoreCatalog(),
    /Refusing mod store URL/,
    "A plain HTTP store is refused"
  );
  await SpecialPowers.popPrefEnv();
});
