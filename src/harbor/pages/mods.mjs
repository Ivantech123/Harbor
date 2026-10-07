// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// The store page runs privileged, so everything coming from the catalog is
// written with textContent and never parsed as markup.

const gMods = window.browsingContext.topChromeWindow.gHarborMods;

const list = document.getElementById("mods-list");
const status = document.getElementById("mods-status");
const template = document.getElementById("mod-card");

let gCatalog = [];

function setStatus(l10nId) {
  status.hidden = !l10nId;
  if (l10nId) {
    document.l10n.setAttributes(status, l10nId);
  }
}

async function onAction(mod, button) {
  button.disabled = true;
  try {
    if (await gMods.isModInstalled(mod.id)) {
      await gMods.uninstallMod(mod.id);
    } else {
      await gMods.installModFromStore(mod.id);
    }
    setStatus(null);
  } catch (e) {
    console.error("[HarborMods]: store action failed", mod.id, e);
    setStatus("harbor-page-mods-action-error");
  }
  await render();
}

async function render() {
  const installed = await gMods.getMods();
  const fragment = document.createDocumentFragment();
  for (const mod of gCatalog) {
    const card = template.content.firstElementChild.cloneNode(true);
    card.querySelector(".mod-name").textContent = mod.name;
    card.querySelector(".mod-description").textContent = mod.description ?? "";
    document.l10n.setAttributes(
      card.querySelector(".mod-meta"),
      "harbor-page-mods-meta",
      { author: mod.author ?? "", version: mod.version ?? "" }
    );
    const button = card.querySelector(".mod-action");
    const isInstalled = Boolean(installed?.[mod.id]);
    button.classList.toggle("primary", !isInstalled);
    document.l10n.setAttributes(
      button,
      isInstalled ? "harbor-page-mods-remove" : "harbor-page-mods-install"
    );
    button.addEventListener("click", () => onAction(mod, button));
    fragment.appendChild(card);
  }
  list.replaceChildren(fragment);
}

async function init() {
  if (!gMods) {
    setStatus("harbor-page-mods-load-error");
    return;
  }
  try {
    gCatalog = await gMods.getStoreCatalog();
  } catch (e) {
    console.error("[HarborMods]: could not load the store", e);
    setStatus("harbor-page-mods-load-error");
    return;
  }
  setStatus(gCatalog.length ? null : "harbor-page-mods-empty");
  await render();

  // Mods can also be removed from the settings while this page is open.
  const observer = () => render();
  Services.prefs.addObserver(gMods.updatePref, observer);
  window.addEventListener(
    "unload",
    () => Services.prefs.removeObserver(gMods.updatePref, observer),
    { once: true }
  );
}

init();
