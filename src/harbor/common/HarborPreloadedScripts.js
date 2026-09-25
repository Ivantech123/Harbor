// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// prettier-ignore
// eslint-disable-next-line no-lone-blocks
{
  ChromeUtils.defineESModuleGetters(this, {
    gHarborSpaceRoutingManager:
      "resource:///modules/harbor/spacerouting/HarborSpaceRoutingManager.sys.mjs",
  });

  Services.scriptloader.loadSubScript("chrome://browser/content/harbor-components/HarborSpaceBookmarksStorage.js", this);

  let scripts = [
    "chrome://browser/content/HarborStartup.mjs",
    "resource:///modules/harbor/HarborSpaceManager.mjs",
    "chrome://browser/content/harbor-components/HarborCompactMode.mjs",
    "chrome://browser/content/HarborUIManager.mjs",
    "chrome://browser/content/harbor-components/HarborMods.mjs",
    "chrome://browser/content/harbor-components/HarborKeyboardShortcuts.mjs",
    "chrome://browser/content/harbor-components/HarborSessionStore.mjs",
    "chrome://browser/content/harbor-components/HarborMediaController.mjs",
    "chrome://browser/content/harbor-components/HarborGlanceManager.mjs",
    "chrome://browser/content/harbor-components/HarborPinnedTabManager.mjs",
    "chrome://browser/content/harbor-components/HarborViewSplitter.mjs",
    "chrome://browser/content/harbor-components/HarborFolders.mjs",
    "chrome://browser/content/harbor-components/HarborEmojiPicker.mjs",
    "chrome://browser/content/harbor-components/HarborLiveFoldersUI.mjs",
    "chrome://browser/content/harbor-components/HarborDownloadAnimation.mjs",
    "resource:///modules/harbor/share/HarborShareManager.mjs",
  ];

  for (let script of scripts) {
    ChromeUtils.importESModule(script, { global: "current" });
  }

  let customHarborElements = [
    ["harbor-folder", "chrome://browser/content/harbor-components/HarborFolder.mjs"],
    ["harbor-workspace-creation", "resource:///modules/harbor/HarborSpaceCreation.mjs"],
    ["harbor-workspace", "resource:///modules/harbor/HarborSpace.mjs"],
    ["harbor-workspace-icons", "resource:///modules/harbor/HarborSpaceIcons.mjs"]
  ];

  document.addEventListener(
    "DOMContentLoaded",
    () => {
      // Only sync-import widgets once the document has loaded. If a widget is
      // used before DOMContentLoaded it will be imported and upgraded when
      // registering the customElements.setElementCreationCallback().
      for (let [tag, script] of customHarborElements) {
        customElements.setElementCreationCallback(
          tag,
          function customElementCreationCallback() {
            ChromeUtils.importESModule(script, { global: "current" });
          }
        );
      }
    },
    { once: true }
  );

  Services.scriptloader.loadSubScript("chrome://browser/content/harbor-components/HarborDragAndDrop.js", this);
}
