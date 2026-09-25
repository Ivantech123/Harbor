/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import {
  html,
  nothing,
  repeat,
} from "chrome://global/content/vendor/lit.all.mjs";
import { MozLitElement } from "chrome://global/content/lit-utils.mjs";

const { HarborLibraryWidget } = ChromeUtils.importESModule(
  "moz-src:///zen/library/HarborLibraryWidget.sys.mjs"
);

let lazy = {};

ChromeUtils.defineESModuleGetters(
  lazy,
  {
    HarborLibraryHistorySection:
      "moz-src:///zen/library/sections/HarborLibraryHistorySection.mjs",
    HarborLibraryDownloadsSection:
      "moz-src:///zen/library/sections/HarborLibraryDownloadsSection.mjs",
    HarborLibraryBoostsSection:
      "moz-src:///zen/library/sections/HarborLibraryBoostsSection.mjs",
    HarborLibraryMediaSection:
      "moz-src:///zen/library/sections/HarborLibraryMediaSection.mjs",
    HarborLibrarySpacesSection:
      "moz-src:///zen/library/sections/HarborLibrarySpacesSection.mjs",
  },
  { global: "current" }
);

const LAST_TAB_PREF = "harbor.library.last-tab";
const CLEANUP_DELAY_MS = 30000;

ChromeUtils.defineLazyGetter(lazy, "appContentWrapper", function () {
  return document.getElementById("harbor-appcontent-wrapper");
});

export class HarborLibrary extends MozLitElement {
  static instance = null;
  #contentMounted = true;
  #mounted = new Set();
  #progress = 0;

  #springControls = null;

  #toolboxWidth = 0;

  #originalButtonsNextSibling = null;

  get #hasAdoptedButtons() {
    return this.#originalButtonsNextSibling !== null;
  }

  #canSwipe = false;
  #isOpen = false;

  #wrapperGestureControl = null;
  #gestureControl = null;

  #resizeObserver = new ResizeObserver(() => {
    this.openProgress = this.#progress;
  });

  static queries = {
    _content: "#harbor-library-content",
    _header: "#harbor-library-header",
    _footer: "#harbor-library-footer",
  };

  static properties = {
    _activeTab: { type: String },
  };

  constructor() {
    super();
    this.harborLibrarySections = {
      media: lazy.HarborLibraryMediaSection,
      downloads: lazy.HarborLibraryDownloadsSection,
      boosts: lazy.HarborLibraryBoostsSection,
      ...(!window.gHarborWorkspaces.privateWindowOrDisabled
        ? {
            spaces: lazy.HarborLibrarySpacesSection,
          }
        : {}),
      history: lazy.HarborLibraryHistorySection,
    };
    const lastTab = Services.prefs.getStringPref(LAST_TAB_PREF, "history");
    this.activeTab = lastTab in this.harborLibrarySections ? lastTab : "history";
    this.#mounted.add(this.activeTab);
    this.#hijackFirefoxCommands();
  }

  static get isLibraryOpen() {
    const lib = this.getInstance();
    return lib.#isOpen;
  }

  static get isLibrarySlightlyOpen() {
    const lib = this.getInstance(/* createIfMissing = */ false);
    if (!lib) {
      return false;
    }
    // Due to calculation inaccuracies assume
    // that openProgress never goes back to 0
    return lib.openProgress > 0.001;
  }

  set isHidden(value) {
    this.requestUpdate();
    this.hidden = value;
  }

  set activeTab(value) {
    if (this._activeTab === value) {
      return;
    }
    this._activeTab = value;
    this.#mounted.add(value);
    Services.prefs.setStringPref(LAST_TAB_PREF, value);
  }

  get activeTab() {
    return this._activeTab;
  }

  get activeSection() {
    return this.harborLibrarySections[this.activeTab];
  }

  set openProgress(value) {
    const p = value;
    const stealWindowButtonsPastPoint = 0.6;
    const wasOpen = this.#progress > 0.001;
    this.#progress = p;
    const isPastWindowButtonSwitchPoint = p > stealWindowButtonsPastPoint;
    const isOpen = p > 0.001;

    if (this.#stylesLoaded) {
      let libraryWidth =
        window.windowUtils.getBoundsWithoutFlushing(this).width;
      const compactModeOffsetDirection = this.#libraryOnRight
        ? -this.#toolboxWidth + HarborThemeModifier.elementSeparation
        : this.#toolboxWidth - HarborThemeModifier.elementSeparation;
      const compactModeOffset = this.#isCompactMode
        ? compactModeOffsetDirection
        : 0;

      const leftAligned = this.#libraryOnRight ? -1 : 1;
      let webOffset =
        leftAligned * (libraryWidth - this.#toolboxWidth) + compactModeOffset;

      this.style.setProperty(
        "transform",
        `translateX(calc(${leftAligned} * -100% * (1 - ${value})))`
      );
      lazy.appContentWrapper?.style.setProperty(
        "transform",
        `translateX(${value * webOffset}px)`
      );

      const toolboxProgress = Math.min(1, value * 1.5);
      if (this.#isCompactMode) {
        if (this.#libraryOnRight) {
          gNavToolbox.style.setProperty(
            "transform",
            `translateX(calc(100% * ${toolboxProgress}))`
          );
        } else {
          gNavToolbox.style.setProperty(
            "transform",
            `translateX(calc(-100% * ${toolboxProgress}))`
          );
        }
      } else {
        const toolboxScale = 1 - toolboxProgress * 0.04;
        const toolboxOpacity = 1 - toolboxProgress;
        gNavToolbox?.style.setProperty("transform", `scale(${toolboxScale})`);
        gNavToolbox?.style.setProperty("opacity", `${toolboxOpacity}`);
      }
    }

    if (isOpen && !wasOpen) {
      this.#init();
    } else if (!isOpen && wasOpen) {
      this.#cleanup();
    }

    if (isPastWindowButtonSwitchPoint && this.#coversWindowButtons) {
      this.#adoptWindowButtons();
    } else if (!isPastWindowButtonSwitchPoint) {
      this.#restoreWindowButtons();
    }
  }

  /**
   * Whether the window buttons sit in the sidebar column the library covers.
   */
  get #coversWindowButtons() {
    if (!gHarborVerticalTabsManager.isWindowsStyledButtons) {
      return !this.#libraryOnRight;
    }
    return this.#libraryOnRight && !this.#isCompactMode;
  }

  get openProgress() {
    return this.#progress;
  }

  #hijackFirefoxCommands() {
    document
      .getElementById("Browser:ShowAllHistory")
      .addEventListener("command", event => {
        event.stopPropagation();
        event.stopImmediatePropagation();

        HarborLibrary.toggle("history");
      });
  }

  #adoptWindowButtons() {
    if (this.#hasAdoptedButtons) {
      return;
    }

    const realButtons = gHarborVerticalTabsManager.actualWindowButtons;
    if (!this.#originalButtonsNextSibling) {
      this.#originalButtonsNextSibling = {
        isNext: realButtons.nextSibling,
        sibling: realButtons.nextSibling || realButtons.previousSibling,
        clone: realButtons.cloneNode(true),
      };

      this.#originalButtonsNextSibling.clone.classList.add(
        "harbor-library-window-buttons-clone"
      );
      if (this.#originalButtonsNextSibling.isNext) {
        this.#originalButtonsNextSibling.sibling.before(
          this.#originalButtonsNextSibling.clone
        );
      } else {
        this.#originalButtonsNextSibling.sibling.after(
          this.#originalButtonsNextSibling.clone
        );
      }

      this._header.appendChild(realButtons);
    }
  }

  #restoreWindowButtons() {
    if (!this.#hasAdoptedButtons) {
      return;
    }

    const realButtons = gHarborVerticalTabsManager.actualWindowButtons;
    if (this.#originalButtonsNextSibling) {
      this.#originalButtonsNextSibling.clone.remove();
      if (this.#originalButtonsNextSibling.isNext) {
        this.#originalButtonsNextSibling.sibling.before(realButtons);
      } else {
        this.#originalButtonsNextSibling.sibling.after(realButtons);
      }
      this.#originalButtonsNextSibling = null;
    }
  }

  #stylesLoaded = null;

  #whenStylesLoaded() {
    this.#stylesLoaded ??= this.updateComplete.then(() => {
      const link = this.querySelector("link[rel='stylesheet']");
      if (!link || link.sheet) {
        return undefined;
      }
      return new Promise(resolve => {
        link.addEventListener("load", resolve, { once: true });
        link.addEventListener("error", resolve, { once: true });
      });
    });
    return this.#stylesLoaded;
  }

  #cleanupTimer = null;
  #idleCleanup = null;

  #scheduleIdleCleanup() {
    this.#cancelIdleCleanup();
    this.#cleanupTimer = window.setTimeout(() => {
      this.#cleanupTimer = null;
      this.#idleCleanup = window.requestIdleCallback(() => {
        this.#idleCleanup = null;
        this.#stylesLoaded = null;

        this.#contentMounted = false;
        this.#mounted = new Set([this.activeTab]);
        this.requestUpdate();
      });
    }, CLEANUP_DELAY_MS);
  }

  #cancelIdleCleanup() {
    if (this.#cleanupTimer) {
      window.clearTimeout(this.#cleanupTimer);
      this.#cleanupTimer = null;
    }
    if (this.#idleCleanup) {
      window.cancelIdleCallback(this.#idleCleanup);
      this.#idleCleanup = null;
    }
  }

  /**
   * Opens or closes the library. With a tab id, opens the library on that
   * tab, switches to it if already open on another, or closes if it is
   * already the open one. Without one, plainly toggles open and closed.
   *
   * @param {string?} [tab] - A section id to open on
   */
  static toggle(tab = undefined) {
    if (!Services.prefs.getBoolPref("harbor.library.enabled")) {
      return;
    }

    const lib = this.getInstance();
    if (tab && tab in lib.harborLibrarySections) {
      if (lib.#isOpen && lib.activeTab === tab) {
        this.animateProgress(0);
      } else if (lib.#isOpen) {
        lib.activeTab = tab;
      } else {
        lib.activeTab = tab;
        this.animateProgress(1);
      }
      return;
    }
    this.animateProgress(lib.#isOpen ? 0 : 1);
  }

  static async animateProgress(target) {
    const lib = this.getInstance();
    lib.#cancelIdleCleanup();
    await lib.#whenStylesLoaded();
    lib.style.visibility = "";
    await window.promiseDocumentFlushed(() => {});

    if (lib.#springControls) {
      lib.#springControls.stop();
      lib.#springControls = null;
    }

    if (target === 1) {
      lib.#onOpenLibrary();
      lib.#isOpen = true;
    } else if (target === 0) {
      lib.#isOpen = false;
      lib.#canSwipe = false;
    }

    lib.setAttribute("transitioning", "true");
    lib.#springControls = gHarborUIManager.motion.animate(
      lib.openProgress,
      target,
      {
        type: "spring",
        stiffness: 720,
        damping: 47,
        mass: 1.2,
        onUpdate: latest => {
          lib.openProgress = latest;
        },
        onComplete: () => {
          lib.openProgress = target;
          lib.#springControls = null;
          lib.removeAttribute("transitioning");
        },
      }
    );
  }

  static async startSwipe() {
    const lib = this.getInstance();
    lib.#cancelIdleCleanup();
    lib.#canSwipe = true;
    await lib.#whenStylesLoaded();
    lib.style.visibility = "";
    await window.promiseDocumentFlushed(() => {});

    lib.#onOpenLibrary();

    if (lib.#springControls) {
      lib.#springControls.stop();
      lib.#springControls = null;
    }

    lib.style.pointerEvents = "none";
  }

  static stopSwipe(direction) {
    const lib = this.getInstance();
    lib.style.pointerEvents = "";
    lib.#canSwipe = false;

    if (lib.#libraryOnRight) {
      direction = direction * -1;
    }

    if (direction) {
      const target = Math.max(-direction, 0);
      this.animateProgress(target);
    }

    return lib.#isOpen;
  }

  static swipeProgress(target) {
    const lib = this.getInstance();
    if (!lib.#canSwipe) {
      return;
    }

    lib.openProgress = target;
  }

  #attachWrapperToSwipe() {
    if (!this.#wrapperGestureControl) {
      const appWrapper = document.getElementById("harbor-main-app-wrapper");
      this.#wrapperGestureControl =
        window.gHarborWorkspaces._swipeManager?.attachWorkspaceSwipeGestures(
          appWrapper
        );
    }
  }

  #detachWrapperOfSwipe() {
    if (this.#wrapperGestureControl) {
      const appWrapper = document.getElementById("harbor-main-app-wrapper");
      window.gHarborWorkspaces._swipeManager?.detachWorkspaceSwipeGestures(
        appWrapper,
        this.#wrapperGestureControl
      );
      this.#wrapperGestureControl = null;
    }
  }

  #onOpenLibrary() {
    this.#cancelIdleCleanup();
    if (!this.#contentMounted) {
      this.#contentMounted = true;
      this.requestUpdate();
    }

    gURLBar.view.close();
    // Get the width from the css property,
    // getBoundsWithoutFlushing will fail as it takes the
    // toolbox transformation during the animation into account
    this.#toolboxWidth = parseFloat(
      gNavToolbox.style
        .getPropertyValue("--actual-harbor-sidebar-width")
        .replace("/\D/g", "")
    );
    if (document.documentElement.hasAttribute("harbor-sidebar-expanded")) {
      const splitterWidth = window.windowUtils.getBoundsWithoutFlushing(
        document.getElementById("harbor-sidebar-splitter")
      ).width;
      this.#toolboxWidth += splitterWidth;
    }
  }

  static getInstance(createIfMissing = true) {
    if (!this.instance && createIfMissing) {
      this.instance = new HarborLibrary();
      this.instance.style.visibility = "collapse";
      const mountAfter = document.getElementById("navigator-toolbox");
      mountAfter.after(this.instance);
    }
    return this.instance;
  }

  get #libraryOnRight() {
    return gHarborVerticalTabsManager._prefsRightSide;
  }

  static get libraryOnRight() {
    const lib = this.getInstance();
    return lib.#libraryOnRight;
  }

  createRenderRoot() {
    return this;
  }

  #init() {
    this.#cancelIdleCleanup();
    if (!this.#contentMounted) {
      this.#contentMounted = true;
      this.requestUpdate();
    }
    this.setAttribute("open", "true");
    document
      .getElementById("harbor-sidebar-splitter")
      .setAttribute("harbor-library-open", "true");
    document.addEventListener("keydown", this, true);
    window.addEventListener("TabOpen", this);

    this.#attachWrapperToSwipe();
    this.#gestureControl =
      window.gHarborWorkspaces._swipeManager.attachWorkspaceSwipeGestures(this);
    this.#resizeObserver.observe(this);
    HarborLibraryWidget.attachLibrary(this);
    this.isHidden = false;
  }

  #cleanup() {
    this.removeAttribute("open");
    this.#mounted = new Set([this.activeTab]);
    this.requestUpdate();
    document
      .getElementById("harbor-sidebar-splitter")
      .removeAttribute("harbor-library-open");

    if (this.#springControls) {
      this.#springControls.stop();
      this.#springControls = null;
    }
    this.removeAttribute("transitioning");

    this.#detachWrapperOfSwipe();
    if (this.#gestureControl) {
      window.gHarborWorkspaces._swipeManager.detachWorkspaceSwipeGestures(
        this,
        this.#gestureControl
      );
    }

    this.#restoreWindowButtons();
    HarborLibraryWidget.detachLibrary(this);
    this.#resizeObserver.disconnect();
    document.removeEventListener("keydown", this, true);
    window.removeEventListener("TabOpen", this);
    this.isHidden = true;
    this.#scheduleIdleCleanup();
  }

  get #isCompactMode() {
    return (
      window.gHarborCompactModeManager.preference &&
      (Services.prefs.getBoolPref("harbor.view.compact.hide-tabbar") ||
        Services.prefs.getBoolPref("harbor.view.use-single-toolbar"))
    );
  }

  handleEvent(e) {
    switch (e.type) {
      case "TabOpen":
        this.onTabOpen();
        break;
      case "keydown":
        this.onKeyDown(e);
        break;
    }
  }

  onTabOpen() {
    if (this.#isOpen) {
      HarborLibrary.animateProgress(0);
    }
  }

  onKeyDown(e) {
    if (!this.hasAttribute("open")) {
      return;
    }
    if (e.key === "Escape") {
      HarborLibrary.animateProgress(0);
    }
  }

  firstUpdated() {
    if (super.firstUpdated) {
      super.firstUpdated();
    }
    this.#buildFooterButtons();
  }

  #buildFooterButtons() {
    const footer = this.querySelector("#harbor-library-footer");

    const buttons = [
      {
        image: "chrome://browser/skin/harbor-icons/back.svg",
        l10nId: "library-footer-close-button",
        command: () => HarborLibrary.animateProgress(0),
      },
      {
        image: "chrome://browser/skin/harbor-icons/heart-circle-fill.svg",
        l10nId: "library-footer-donate-button",
        command: () => {
          window.openTrustedLinkIn("https://www.zen-browser.app/donate", "tab");
          HarborLibrary.animateProgress(0);
        },
      },
    ];

    for (const { image, l10nId, command } of buttons) {
      const button = document.createXULElement("toolbarbutton");
      button.className = "toolbarbutton-1";
      button.setAttribute("image", image);
      button.setAttribute("data-l10n-id", l10nId);
      button.addEventListener("command", command);
      footer.appendChild(button);
    }
  }

  updated(changedProperties) {
    super.updated?.(changedProperties);
    this.#updateMountedSections();
  }

  /**
   * Shows the section being looked at and puts the others out of sight. A
   * section is told which it is, so one that reaches outside itself, such as
   * spaces setting the library's width, only does so while it is on show.
   */
  #updateMountedSections() {
    for (const section of this._content?.children ?? []) {
      const id = section.dataset?.section;
      if (!id) {
        continue;
      }
      const showing = id === this.activeTab;
      const wasShowing = section.hasAttribute("showing");
      section.hidden = !showing;
      section.toggleAttribute("showing", showing);
      if (showing !== wasShowing) {
        (showing ? section.onShown : section.onHidden)?.call(section);
      }
    }
  }

  render() {
    return html`
      <link
        rel="stylesheet"
        href="chrome://browser/content/harbor-styles/harbor-library.css"
      />
      <hbox id="harbor-library-panel">
        <vbox id="harbor-library-side">
          <vbox id="harbor-library-header"></vbox>
          <vbox id="harbor-library-sidebar-tabs">
            ${Object.values(this.harborLibrarySections).map(
              Section => html`
                <vbox
                  class="harbor-library-tab"
                  ?active=${this.activeTab === Section.id}
                  data-section=${Section.id}
                  @click=${event => {
                    if (this.activeTab !== Section.id) {
                      this.activeTab = Section.id;
                      const previousTab =
                        event.currentTarget.parentNode.querySelector(
                          `.harbor-library-tab[animate="true"]`
                        );
                      if (previousTab) {
                        previousTab.removeAttribute("animate");
                      }
                      event.currentTarget.setAttribute("animate", "true");
                    }
                  }}
                >
                  <div class="harbor-library-tab-icon">
                    <div class="harbor-library-tab-icon-image"></div>
                  </div>
                  <label data-l10n-id=${Section.label}></label>
                </vbox>
              `
            )}
          </vbox>
          <toolbar
            id="harbor-library-footer"
            class="chromeclass-location"
            mode="icons"
            fullscreentoolbar="true"
          ></toolbar>
        </vbox>
        <vbox id="harbor-library-content">
          ${
            this.#contentMounted
              ? repeat(
                  [...this.#mounted],
                  id => id,
                  id => this.harborLibrarySections[id].render(this)
                )
              : nothing
          }
        </vbox>
      </hbox>
    `;
  }
}

customElements.define("harbor-library", HarborLibrary);
