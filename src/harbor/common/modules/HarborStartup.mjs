// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import checkForHarborUpdates, {
  createWindowUpdateAnimation,
  playWindowSweepAnimation,
} from "chrome://browser/content/HarborUpdates.mjs";

class HarborStartup {
  #watermarkIgnoreElements = ["harbor-toast-container", "harbor-browser-background"];
  #hasInitializedLayout = false;

  isReady = false;
  promiseInitialized = new Promise(resolve => {
    this.promiseInitializedResolve = resolve;
  });

  init() {
    this.openWatermark();
    this.#harborInitBrowserLayout();
  }

  get #shouldUseWatermark() {
    return (
      Services.prefs.getBoolPref("harbor.watermark.enabled", false) &&
      gHarborWorkspaces.shouldHaveWorkspaces
    );
  }

  #harborInitBrowserLayout() {
    if (this.#hasInitializedLayout) {
      return;
    }
    this.#hasInitializedLayout = true;
    gHarborKeyboardShortcutsManager.beforeInit();
    try {
      const kNavbarItems = ["nav-bar", "PersonalToolbar"];
      const kNewContainerId = "harbor-appcontent-navbar-container";
      let newContainer = document.getElementById(kNewContainerId);
      for (let id of kNavbarItems) {
        const node = document.getElementById(id);
        if (!node) {
          console.error("Could not find node with id: " + id);
          continue;
        }
        newContainer.appendChild(node);
      }
      // Fix notification deck
      const deckTemplate =
        document.getElementById("tab-notification-deck-template") ||
        document.getElementById("tab-notification-deck");

      // overlap and interaction issues with vertical tabs
      document.getElementById("browser").prepend(deckTemplate);

      gHarborWorkspaces.init().then(() => {
        gHarborUIManager.init();
        this.#initUIComponents();
        this.#checkForWelcomePage();
      });
    } catch (e) {
      console.error("HarborThemeModifier: Error initializing browser layout", e);
    }
    if (gBrowserInit.delayedStartupFinished) {
      this.delayedStartupFinished();
    } else {
      Services.obs.addObserver(this, "browser-delayed-startup-finished");
    }
  }

  observe(aSubject, aTopic) {
    // This nsIObserver method allows us to defer initialization until after
    // this window has finished painting and starting up.
    if (aTopic == "browser-delayed-startup-finished" && aSubject == window) {
      Services.obs.removeObserver(this, "browser-delayed-startup-finished");
      this.delayedStartupFinished();
    }
  }

  delayedStartupFinished() {
    gHarborWorkspaces.promiseInitialized.then(async () => {
      await delayedStartupPromise;
      await SessionStore.promiseAllWindowsRestored;
      delete gHarborUIManager.promiseInitialized;
      gHarborCompactModeManager.init();
      // Fix for upstream issue #7605, specially in compact mode
      if (gURLBar.hasAttribute("breakout-extend")) {
        gURLBar.focus();
      }
      // A bit of a hack to make sure the tabs toolbar is updated.
      // Just in case we didn't get the right size.
      gHarborUIManager.updateTabsToolbar();
      this.closeWatermark();
      document
        .getElementById("tabbrowser-arrowscrollbox")
        .setAttribute("orient", "vertical");
      this.isReady = true;
      this.promiseInitializedResolve();
      ChromeUtils.importESModule(
        "chrome://browser/content/harbor/HarborCerts.mjs"
      )
        .ensureRussianTrustedCerts()
        .catch(console.error);
      ChromeUtils.importESModule(
        "chrome://browser/content/harbor/HarborRuDirect.mjs"
      ).ensureRuDirect();
      delete this.promiseInitializedResolve;

      setTimeout(() => {
        // Wait for the natural PlacesToolbar rebuild before invalidating, so
        // the two async rebuilds don't interleave and duplicate bookmarks.
        // promiseRebuilt() returns undefined when no rebuild is in flight.
        const rebuilt =
          document
            .getElementById("PlacesToolbar")
            ?._placesView?.promiseRebuilt() ?? Promise.resolve();
        rebuilt
          .catch(console.error)
          .then(() => gHarborWorkspaces._invalidateBookmarkContainers());
      });
    });
  }

  openWatermark() {
    if (!this.#shouldUseWatermark) {
      document.documentElement.removeAttribute("harbor-before-loaded");
      return;
    }
    for (let elem of document.querySelectorAll(
      `#browser > *:not(${this.#watermarkIgnoreElements.map(id => "#" + id).join(", ")}), #urlbar`
    )) {
      elem.style.opacity = 0;
    }
  }

  closeWatermark() {
    document.documentElement.removeAttribute("harbor-before-loaded");
    if (this.#shouldUseWatermark) {
      let elementsToIgnore = this.#watermarkIgnoreElements
        .map(id => "#" + id)
        .join(", ");
      gHarborUIManager.motion
        .animate(
          "#browser > *:not(" +
            elementsToIgnore +
            "), #urlbar, #tabbrowser-tabbox > *",
          {
            opacity: [0, 1],
          },
          {
            duration: 0.1,
          }
        )
        .then(() => {
          for (let elem of document.querySelectorAll(
            "#browser > *, #urlbar, #tabbrowser-tabbox > *"
          )) {
            elem.style.removeProperty("opacity");
          }
        });
    }
    window.requestAnimationFrame(() => {
      window.dispatchEvent(new window.Event("resize")); // To recalculate the layout
    });
  }

  #initUIComponents() {
    const kUIComponents = ["HarborProgressBar", "HarborSpaceRoutingNavigation"];
    for (let component of kUIComponents) {
      const module = ChromeUtils.importESModule(
        "resource:///modules/harbor/ui/" + component + ".sys.mjs"
      );
      new module[component](window);
    }
  }

  #checkForWelcomePage() {
    const kWelcomeScreenSeenPref = "harbor.welcome-screen.seen";
    if (Services.env.get("MOZ_HEADLESS")) {
      Services.prefs.setBoolPref(kWelcomeScreenSeenPref, true);
      return;
    }
    if (!Services.prefs.getBoolPref(kWelcomeScreenSeenPref, false)) {
      Services.prefs.setBoolPref(kWelcomeScreenSeenPref, true);
      Services.prefs.setStringPref(
        "harbor.updates.last-build-id",
        Services.appinfo.appBuildID
      );
      Services.prefs.setStringPref(
        "harbor.updates.last-version",
        Services.appinfo.version
      );
      Services.scriptloader.loadSubScript(
        "chrome://browser/content/harbor-components/HarborWelcome.mjs",
        window
      );
    } else {
      this.#createUpdateAnimation();
    }
  }

  async #createUpdateAnimation() {
    checkForHarborUpdates();
    return await createWindowUpdateAnimation();
  }

  /**
   * Entry point for privileged modules (e.g. the sync applier) to play the
   * update sweep animation in this window.
   */
  playWindowSweepAnimation() {
    return playWindowSweepAnimation();
  }
}

window.gHarborStartup = new HarborStartup();

window.addEventListener(
  "MozBeforeInitialXULLayout",
  () => {
    gHarborStartup.init();
  },
  { once: true }
);
