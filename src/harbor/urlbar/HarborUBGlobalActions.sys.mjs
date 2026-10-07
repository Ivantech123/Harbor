/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import { XPCOMUtils } from "resource://gre/modules/XPCOMUtils.sys.mjs";

const lazy = {};

XPCOMUtils.defineLazyPreferenceGetter(
  lazy,
  "currentTheme",
  "harbor.view.window.scheme",
  2
);

ChromeUtils.defineLazyGetter(lazy, "l10n", () => {
  return new Localization(["browser/harbor-command-palette.ftl"], true);
});

ChromeUtils.defineESModuleGetters(lazy, {
  SessionStore:
    "moz-src:///browser/components/sessionstore/SessionStore.sys.mjs",
});

function isNotEmptyTab(window) {
  return !window.gBrowser.selectedTab.hasAttribute("harbor-empty-tab");
}

const globalActionsTemplate = [
  {
    l10nId: "harbor-action-toggle-compact-mode",
    command: "cmd_harborCompactModeToggle",
    icon: "chrome://browser/skin/harbor-icons/sidebar.svg",
  },
  {
    l10nId: "harbor-action-open-theme-picker",
    command: "cmd_harborOpenHarborThemePicker",
    icon: "chrome://browser/skin/harbor-icons/paintbrush-fill.svg",
  },
  {
    l10nId: "harbor-action-new-split-view",
    command: "cmd_harborNewEmptySplit",
    icon: "chrome://browser/skin/harbor-icons/split.svg",
  },
  {
    l10nId: "harbor-action-unsplit-view",
    command: "cmd_harborSplitViewUnsplit",
    icon: "chrome://browser/skin/harbor-icons/split.svg",
    isAvailable: window => {
      return window.gHarborViewSplitter.splitViewActive;
    },
  },
  {
    l10nId: "harbor-action-new-space",
    command: "cmd_harborOpenWorkspaceCreation",
    icon: "chrome://browser/skin/harbor-icons/plus.svg",
  },
  {
    l10nId: "harbor-action-new-folder",
    command: "cmd_harborOpenFolderCreation",
    icon: "chrome://browser/skin/harbor-icons/folder.svg",
  },
  {
    l10nId: "harbor-action-copy-current-url",
    command: "cmd_harborCopyCurrentURL",
    icon: "chrome://browser/skin/harbor-icons/link.svg",
  },
  {
    l10nId: "harbor-action-settings",
    command: window => window.openPreferences(),
    icon: "chrome://browser/skin/harbor-icons/settings.svg",
  },
  {
    l10nId: "harbor-action-open-private-window",
    command: "Tools:PrivateBrowsing",
    icon: "chrome://browser/skin/harbor-icons/private-window.svg",
  },
  {
    l10nId: "harbor-action-open-new-window",
    command: "cmd_newNavigator",
    icon: "chrome://browser/skin/harbor-icons/window.svg",
  },
  {
    l10nId: "harbor-action-new-blank-window",
    command: "cmd_harborNewNavigatorUnsynced",
    icon: "chrome://browser/skin/harbor-icons/window.svg",
  },
  {
    l10nId: "harbor-action-pin-tab",
    command: "cmd_harborTogglePinTab",
    icon: "chrome://browser/skin/harbor-icons/pin.svg",
    isAvailable: window => {
      const tab = window.gBrowser.selectedTab;
      return !tab.hasAttribute("harbor-empty-tab") && !tab.pinned;
    },
  },
  {
    l10nId: "harbor-action-unpin-tab",
    command: "cmd_harborTogglePinTab",
    icon: "chrome://browser/skin/harbor-icons/unpin.svg",
    isAvailable: window => {
      const tab = window.gBrowser.selectedTab;
      return !tab.hasAttribute("harbor-empty-tab") && tab.pinned;
    },
  },
  {
    l10nId: "harbor-action-open-space-routing",
    command: "cmd_harborOpenSpaceRoutingSettings",
    icon: "chrome://browser/skin/harbor-icons/selectable/airplane.svg",
  },
  {
    l10nId: "harbor-action-new-boost",
    icon: "chrome://browser/skin/harbor-icons/boost.svg",
    isAvailable: window => {
      if (!isNotEmptyTab(window)) {
        return false;
      }

      // Keep this action consistent with the rest of the Boosts UI.
      if (!Services.prefs.getBoolPref("harbor.boosts.enabled", false)) {
        return false;
      }

      const uri = window.gBrowser.currentURI;
      return !!uri?.schemeIs && (uri.schemeIs("http") || uri.schemeIs("https"));
    },
    command: window => {
      const uri = window.gBrowser.currentURI;
      if (!uri?.schemeIs || !(uri.schemeIs("http") || uri.schemeIs("https"))) {
        return;
      }

      let domain = "";
      try {
        domain = uri.host;
      } catch {
        return;
      }

      if (!domain) {
        return;
      }

      const { gHarborBoostsManager } = ChromeUtils.importESModule(
        "resource:///modules/harbor/boosts/HarborBoostsManager.sys.mjs"
      );
      const boost = gHarborBoostsManager.createNewBoost(domain);
      if (!boost) {
        return;
      }
      gHarborBoostsManager.openBoostWindow(window, boost, uri);
    },
  },
  {
    l10nId: "harbor-action-next-space",
    command: "cmd_harborWorkspaceForward",
    icon: "chrome://browser/skin/harbor-icons/forward.svg",
    isAvailable: window => {
      return window.gHarborWorkspaces._workspaceCache.length > 1;
    },
  },
  {
    l10nId: "harbor-action-previous-space",
    command: "cmd_harborWorkspaceBackward",
    icon: "chrome://browser/skin/harbor-icons/back.svg",
    isAvailable: window => {
      // This also covers the case of being in private mode
      return window.gHarborWorkspaces._workspaceCache.length > 1;
    },
  },
  {
    l10nId: "harbor-action-close-tab",
    command: "cmd_close",
    icon: "chrome://browser/skin/harbor-icons/close.svg",
    isAvailable: window => {
      return isNotEmptyTab(window);
    },
  },
  {
    l10nId: "harbor-action-reopen-closed-tab",
    command: "History:RestoreLastClosedTabOrWindowOrSession",
    icon: "chrome://browser/skin/harbor-icons/history.svg",
    isAvailable: window => {
      return lazy.SessionStore.getClosedTabCount(window) > 0;
    },
  },
  {
    l10nId: "harbor-action-duplicate-tab",
    command: "cmd_harborDuplicateTab",
    icon: "chrome://browser/skin/harbor-icons/duplicate-tab.svg",
    isAvailable: window => {
      return isNotEmptyTab(window);
    },
  },
  {
    l10nId: "harbor-action-reset-pinned-tab",
    command: "cmd_harborPinnedTabReset",
    icon: "chrome://browser/skin/harbor-icons/arrow-rotate-anticlockwise.svg",
    isAvailable: window => {
      const tab = window.gBrowser.selectedTab;
      return tab.pinned && tab.hasAttribute("harbor-pinned-changed");
    },
  },
  {
    l10nId: "harbor-action-reload-tab",
    command: "Browser:Reload",
    icon: "chrome://browser/skin/harbor-icons/reload.svg",
  },
  {
    l10nId: "harbor-action-reload-tab-without-cache",
    command: "Browser:ReloadSkipCache",
    icon: "chrome://browser/skin/harbor-icons/reload.svg",
  },
  {
    l10nId: "harbor-action-next-tab",
    command: "Browser:NextTab",
    icon: "chrome://browser/skin/harbor-icons/forward.svg",
  },
  {
    l10nId: "harbor-action-previous-tab",
    command: "Browser:PrevTab",
    icon: "chrome://browser/skin/harbor-icons/back.svg",
  },
  {
    l10nId: "harbor-action-capture-screenshot",
    command: "Browser:Screenshot",
    icon: "chrome://browser/skin/harbor-icons/screenshot.svg",
    isAvailable: window => {
      return isNotEmptyTab(window);
    },
  },
  {
    l10nId: "harbor-action-toggle-tabs-on-right",
    command: "cmd_harborToggleTabsOnRight",
    icon: "chrome://browser/skin/harbor-icons/sidebars-right.svg",
  },
  {
    l10nId: "harbor-action-add-to-essentials",
    command: window =>
      window.gHarborPinnedTabManager.addToEssentials(window.gBrowser.selectedTab),
    isAvailable: window => {
      return (
        window.gHarborPinnedTabManager.canEssentialBeAdded(
          window.gBrowser.selectedTab
        ) && !window.gBrowser.selectedTab.hasAttribute("harbor-essential")
      );
    },
    icon: "chrome://browser/skin/harbor-icons/essential-add.svg",
  },
  {
    l10nId: "harbor-action-remove-from-essentials",
    command: window =>
      window.gHarborPinnedTabManager.removeEssentials(window.gBrowser.selectedTab),
    isAvailable: window =>
      window.gBrowser.selectedTab.hasAttribute("harbor-essential"),
    icon: "chrome://browser/skin/harbor-icons/essential-remove.svg",
  },
  {
    l10nId: "harbor-action-find-in-page",
    command: "cmd_find",
    icon: "chrome://browser/skin/harbor-icons/search-page.svg",
    isAvailable: window => {
      return isNotEmptyTab(window);
    },
  },
  {
    l10nId: "harbor-action-manage-extensions",
    command: "Tools:Addons",
    icon: "chrome://browser/skin/harbor-icons/extension.svg",
  },
  {
    l10nId: "harbor-action-switch-to-automatic-appearance",
    command: () => Services.prefs.setIntPref("harbor.view.window.scheme", 2),
    icon: "chrome://browser/skin/harbor-icons/sparkles.svg",
    isAvailable: () => {
      return lazy.currentTheme !== 2;
    },
  },
  {
    l10nId: "harbor-action-switch-to-light-mode",
    command: () => Services.prefs.setIntPref("harbor.view.window.scheme", 1),
    icon: "chrome://browser/skin/harbor-icons/face-sun.svg",
    isAvailable: () => {
      return lazy.currentTheme !== 1;
    },
  },
  {
    l10nId: "harbor-action-switch-to-dark-mode",
    command: () => Services.prefs.setIntPref("harbor.view.window.scheme", 0),
    icon: "chrome://browser/skin/harbor-icons/moon-stars.svg",
    isAvailable: () => {
      return lazy.currentTheme !== 0;
    },
  },
  {
    l10nId: "harbor-action-print",
    command: "cmd_print",
    icon: "chrome://browser/skin/harbor-icons/print.svg",
    isAvailable: window => {
      return isNotEmptyTab(window);
    },
  },
];

const labelCache = new Map();
let localesObserved = false;

export function formatValueSync(l10nId) {
  const cached = labelCache.get(l10nId);
  if (cached !== undefined) {
    return cached;
  }
  if (!localesObserved) {
    localesObserved = true;
    Services.obs.addObserver(() => {
      labelCache.clear();
    }, "intl:app-locales-changed");
  }
  const value = lazy.l10n.formatValueSync(l10nId);
  labelCache.set(l10nId, value);
  return value;
}

export const globalActions = globalActionsTemplate.map(action => ({
  isAvailable: window => {
    return (
      window.document
        .getElementById(action.command)
        ?.getAttribute("disabled") !== "true"
    );
  },
  commandId:
    typeof action.command === "string"
      ? action.command
      : `harbor:global-action-${action.l10nId.replace("harbor-action-", "")}`,
  extraPayload: {},
  ...action,
  get label() {
    return formatValueSync(action.l10nId);
  },
}));
