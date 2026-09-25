// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import { nsHarborPreloadedFeature } from "chrome://browser/content/harbor-components/HarborCommonUtils.mjs";

class HarborSessionStore extends nsHarborPreloadedFeature {
  init() {
    this.#waitAndCleanup();
  }

  promiseInitialized = new Promise(resolve => {
    this._resolveInitialized = resolve;
  });

  restoreInitialTabData(tab, tabData) {
    if (tabData.harborWorkspace) {
      tab.setAttribute("harbor-workspace-id", tabData.harborWorkspace);
    }
    if (tabData.harborLiveFolderItemId) {
      tab.setAttribute("harbor-live-folder-item-id", tabData.harborLiveFolderItemId);
    }
    // Keep for now, for backward compatibility for window sync to work.
    if (tabData.harborSyncId || tabData.harborPinnedId) {
      tab.setAttribute("id", tabData.harborSyncId || tabData.harborPinnedId);
    }
    if (typeof tabData.harborStaticLabel === "string") {
      tab.harborStaticLabel = tabData.harborStaticLabel;
    }
    if (tabData.harborHasStaticIcon && tabData.image) {
      tab.harborStaticIcon = tabData.image;
    }
    if (tabData.harborEssential) {
      tab.setAttribute("harbor-essential", "true");
    }
    if (tabData.harborDefaultUserContextId) {
      tab.setAttribute("harborDefaultUserContextId", "true");
    }
    if (tabData._harborPinnedInitialState) {
      tab._harborPinnedInitialState = tabData._harborPinnedInitialState;
    }
  }

  async #waitAndCleanup() {
    await SessionStore.promiseInitialized;
    this.#cleanup();
  }

  #cleanup() {
    this._resolveInitialized();
  }
}

window.gHarborSessionStore = new HarborSessionStore();
