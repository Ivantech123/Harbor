// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

window.gHarborOperatingSystemCommonUtils = {
  kHarborOSToSmallName: {
    WINNT: "windows",
    Darwin: "macos",
    Linux: "linux",
  },

  get currentOperatingSystem() {
    let os = Services.appinfo.OS;
    return this.kHarborOSToSmallName[os];
  },
};

export class nsHarborMultiWindowFeature {
  constructor() {}

  static get browsers() {
    return Services.wm.getEnumerator("navigator:browser");
  }

  static get currentBrowser() {
    return Services.wm.getMostRecentWindow("navigator:browser");
  }

  static get isActiveWindow() {
    return nsHarborMultiWindowFeature.currentBrowser === window;
  }

  windowIsActive(browser) {
    return browser === nsHarborMultiWindowFeature.currentBrowser;
  }

  async foreachWindowAsActive(callback) {
    if (!nsHarborMultiWindowFeature.isActiveWindow) {
      return;
    }
    await this.forEachWindow(callback);
  }

  async forEachWindow(callback) {
    for (const browser of nsHarborMultiWindowFeature.browsers) {
      try {
        if (browser.closed) {
          continue;
        }
        await callback(browser);
      } catch (e) {
        console.error(e);
      }
    }
  }

  forEachWindowSync(callback) {
    for (const browser of nsHarborMultiWindowFeature.browsers) {
      try {
        if (browser.closed) {
          continue;
        }
        callback(browser);
      } catch (e) {
        console.error(e);
      }
    }
  }
}

export class nsHarborDOMOperatedFeature {
  constructor() {
    var initBound = this.init.bind(this);
    document.addEventListener("DOMContentLoaded", initBound, { once: true });
  }
}

export class nsHarborPreloadedFeature {
  constructor() {
    var initBound = this.init.bind(this);
    document.addEventListener("MozBeforeInitialXULLayout", initBound, {
      once: true,
    });
  }
}

window.gHarborCommonActions = {
  copyCurrentURLToClipboard() {
    const [currentUrl, ClipboardHelper] = gURLBar.harborStrippedURI;
    let displaySpec = currentUrl.displaySpec;

    try {
      if (
        Services.prefs.getBoolPref("browser.urlbar.decodeURLsOnCopy", false) &&
        !currentUrl.schemeIs("data")
      ) {
        displaySpec = decodeURI(displaySpec);
      }
    } catch (e) {}

    ClipboardHelper.copyString(displaySpec);

    let button;
    /* eslint-disable mozilla/valid-services */
    if (Services.harbor.canShare() && displaySpec.startsWith("http")) {
      button = {
        id: "harbor-copy-current-url-button",
        command: event => {
          const buttonRect = event.target.getBoundingClientRect();
          /* eslint-disable mozilla/valid-services */
          Services.harbor.share(
            currentUrl,
            "",
            "",
            buttonRect.left,
            window.innerHeight - buttonRect.bottom,
            buttonRect.width,
            buttonRect.height
          );
        },
      };
    }
    gHarborUIManager.showToast("harbor-copy-current-url-confirmation", {
      button,
      timeout: 3000,
    });
  },

  copyCurrentURLAsMarkdownToClipboard() {
    const [currentUrl, ClipboardHelper] = gURLBar.harborStrippedURI;
    const tabTitle = gBrowser.selectedTab.label;
    let displaySpec = currentUrl.displaySpec;

    try {
      if (
        Services.prefs.getBoolPref("browser.urlbar.decodeURLsOnCopy", false) &&
        !currentUrl.schemeIs("data")
      ) {
        displaySpec = decodeURI(displaySpec);
      }
    } catch (e) {}

    const markdownLink = `[${tabTitle}](${displaySpec})`;
    ClipboardHelper.copyString(markdownLink);

    gHarborUIManager.showToast("harbor-copy-current-url-as-markdown-confirmation", {
      timeout: 3000,
    });
  },

  throttle(f, delay) {
    let timer = 0;
    return function (...args) {
      clearTimeout(timer);
      timer = setTimeout(() => f.apply(this, args), delay);
    };
  },

  /**
   * Determines if a tab should be closed when navigating back with no history.
   * Only tabs with an owner that are not pinned and not empty are eligible.
   * Respects the user preference harbor.tabs.close-on-back-with-no-history.
   *
   * @returns {boolean} True if the tab should be closed on back
   */
  shouldCloseTabOnBack() {
    if (
      !Services.prefs.getBoolPref(
        "harbor.tabs.close-on-back-with-no-history",
        true
      )
    ) {
      return false;
    }
    const tab = gBrowser.selectedTab;
    return Boolean(
      tab.owner && !tab.pinned && !tab.hasAttribute("harbor-empty-tab")
    );
  },
};
