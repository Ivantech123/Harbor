// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

const lazy = {};
ChromeUtils.defineESModuleGetters(lazy, {
  JSONFile: "resource://gre/modules/JSONFile.sys.mjs",
  setTimeout: "resource://gre/modules/Timer.sys.mjs",
  TabStateCache:
    "moz-src:///browser/components/sessionstore/TabStateCache.sys.mjs",
  HarborWindowSync: "resource:///modules/harbor/HarborWindowSync.sys.mjs",
  FeatureCallout: "resource:///modules/asrouter/FeatureCallout.sys.mjs",
});

ChromeUtils.defineLazyGetter(
  lazy,
  "l10n",
  () => new Localization(["browser/harbor-live-folders.ftl"])
);

const DEFAULT_FETCH_INTERVAL = 30 * 60 * 1000;
const providers = [
  {
    path: "resource:///modules/harbor/RssLiveFolder.sys.mjs",
    module: "nsRssLiveFolderProvider",
  },
  {
    path: "resource:///modules/harbor/GithubLiveFolder.sys.mjs",
    module: "nsGithubLiveFolderProvider",
  },
];

class nsHarborLiveFoldersManager {
  #isInitialized = false;
  #saveFilename = "harbor-live-folders.jsonlz4";
  #file = null;

  #boundHandleEvent = null;
  stateRestored = Promise.withResolvers();

  constructor() {
    this.liveFolders = new Map();
    this.registry = new Map();
    this.dismissedItems = new Set();
  }

  get window() {
    return lazy.HarborWindowSync.firstSyncedWindow;
  }

  async init() {
    if (this.#isInitialized) {
      return;
    }

    for (const provider of providers) {
      const module = ChromeUtils.importESModule(provider.path, {
        global: "current",
      });
      const ProviderClass = module[provider.module];
      this.registry.set(ProviderClass.type, ProviderClass);
    }

    await this.#restoreState();
    this.#initEventListeners();
    this.#isInitialized = true;
  }

  uninit() {
    if (!this.#isInitialized) {
      return;
    }

    Services.obs.removeObserver(this, "wake_notification");
    if (this.#boundHandleEvent) {
      lazy.HarborWindowSync.removeSyncHandler(this.#boundHandleEvent);
      this.#boundHandleEvent = null;
    }

    for (const liveFolder of this.liveFolders.values()) {
      liveFolder.stop();
    }

    this.registry.clear();
    this.liveFolders.clear();
    this.dismissedItems.clear();

    this.#isInitialized = false;
  }

  // Event Handling
  // --------------
  #initEventListeners() {
    Services.obs.addObserver(this, "wake_notification");

    this.#boundHandleEvent = this.handleEvent.bind(this);
    lazy.HarborWindowSync.addSyncHandler(this.#boundHandleEvent);
  }

  observe(_subject, topic, _data) {
    switch (topic) {
      case "wake_notification": {
        // Woke from sleep, re-schedule all fetch
        for (const liveFolder of this.liveFolders.values()) {
          liveFolder.stop();
          liveFolder.start();
        }
        break;
      }
    }
  }

  handleEvent(aEvent) {
    switch (aEvent.type) {
      case "TabUngrouped":
      case "TabClose": {
        this.#onTabDismiss(aEvent);
        break;
      }
      case "TabGroupRemoved": {
        this.#onTabGroupRemoved(aEvent);
        break;
      }
      case "command": {
        this.#onCommand(aEvent);
        break;
      }
      case "click": {
        this.#onActionButtonClick(aEvent);
        break;
      }
    }
  }

  #onCommand(event) {
    switch (event.target.id) {
      case "cmd_harborNewLiveFolder": {
        const target = event.sourceEvent.target;
        switch (target.getAttribute("data-l10n-id")) {
          case "harbor-live-folder-github-pull-requests": {
            this.createFolder("github:pull-requests");
            break;
          }
          case "harbor-live-folder-github-issues": {
            this.createFolder("github:issues");
            break;
          }
          case "harbor-live-folder-type-rss": {
            this.createFolder("rss");
            break;
          }
        }
      }
    }
  }

  #onTabDismiss(event) {
    const itemIdAttr = "harbor-live-folder-item-id";
    const itemId =
      event.target.getAttribute(itemIdAttr) ||
      event.detail?.getAttribute?.(itemIdAttr);

    if (itemId) {
      if (event.type === "TabUngrouped") {
        const target = event.detail;
        target.removeAttribute("harbor-live-folder-item-id");

        const showSublabel = target.hasAttribute("harbor-show-sublabel");
        if (showSublabel) {
          target.removeAttribute("harbor-show-sublabel");

          const label = target.querySelector(".harbor-tab-sublabel");
          this.window.document.l10n.setArgs(label, {
            tabSubtitle: "harbor-default-pinned",
          });
        }
      }

      this.dismissedItems.add(itemId);
      this.saveState();
    }
  }

  #onActionButtonClick(event) {
    const liveFolderId = event.target.getAttribute("live-folder-action");
    this.getFolder(liveFolderId)?.onActionButtonClick(
      event.target.getAttribute("data-l10n-id")
    );
  }

  #onTabGroupRemoved(event) {
    const tabGroup = event.target;
    if (tabGroup.isLiveFolder) {
      this.deleteFolder(tabGroup.id, false);
    }
  }

  // Public API
  // ----------
  getFolder(id) {
    return this.liveFolders.get(id);
  }

  /**
   * Returns the provider config needed to recreate this live folder on
   * another device, or null for non-live folders. Fetch bookkeeping fields
   * are stripped since they are device-local.
   *
   * @param {string} id - The folder ID.
   */
  getSyncableFolderData(id) {
    const liveFolder = this.liveFolders.get(id);
    if (!liveFolder) {
      return null;
    }
    const state = { ...liveFolder.serialize().state };
    delete state.lastFetched;
    delete state.lastErrorId;
    return { type: liveFolder.constructor.type, state };
  }

  /**
   * Registers a live folder provider for a folder that arrived from
   * Firefox Sync. The folder element must already exist.
   *
   * @param {string} id - The folder ID.
   * @param {{ type: string, state: object }} config - Synced provider config.
   */
  async adoptSyncedFolder(id, { type, state } = {}) {
    await this.stateRestored.promise;
    if (this.liveFolders.has(id)) {
      return;
    }
    const ProviderClass = this.registry.get(type);
    if (!ProviderClass || !state) {
      return;
    }
    const liveFolder = new ProviderClass({
      id,
      state: this.#applyDefaultStateValues({ ...state }),
      manager: this,
    });
    this.liveFolders.set(id, liveFolder);
    liveFolder.start();
    this.saveState();
  }

  async createFolder(type) {
    const [provider, providerType] = type.split(":");
    let ProviderClass = this.registry.get(provider);
    if (!ProviderClass) {
      return -1;
    }

    let url;
    let label;
    let icon;

    switch (provider) {
      case "rss": {
        url = await ProviderClass.promptForFeedUrl(this.window);
        if (!url) {
          return -1;
        }

        const metadata = await ProviderClass.getMetadata(url, this.window);
        label = metadata.label;
        icon = metadata.icon;

        break;
      }
      case "github": {
        const [message] = await lazy.l10n.formatMessages([
          { id: `harbor-live-folder-github-${providerType}` },
        ]);

        label = message.attributes[0].value;
        icon = "chrome://browser/skin/harbor-icons/selectable/logo-github.svg";
        break;
      }
    }

    const folder = this.window.gHarborFolders.createFolder([], {
      label,
      isLiveFolder: true,
      collapsed: true,
    });

    this.#maybeShowPromotion(folder, icon);

    if (icon) {
      this.window.gHarborFolders.setFolderUserIcon(folder, icon);
    }

    const config = {
      state: this.#applyDefaultStateValues({
        url,
        type: providerType,
      }),
    };

    let liveFolder = new ProviderClass({
      state: config.state,
      manager: this,
      id: folder.id,
    });

    this.liveFolders.set(folder.id, liveFolder);

    liveFolder.start();
    this.saveState();

    return folder.id;
  }

  #maybeShowPromotion(folder, icon) {
    let labelElement = folder.labelElement;
    labelElement.setAttribute("live-folder-animation", "true");
    labelElement.style.backgroundPositionX = "0%";
    folder.documentGlobal.gHarborUIManager.motion
      .animate(
        labelElement,
        {
          backgroundPositionX: ["0%", "-50%"],
        },
        {
          duration: 1,
        }
      )
      .then(() => {
        labelElement.style.backgroundPositionX = "";
        labelElement.removeAttribute("live-folder-animation");
      });

    if (Services.prefs.getBoolPref("harbor.live-folders.promotion.shown", false)) {
      return;
    }
    Services.prefs.setBoolPref("harbor.live-folders.promotion.shown", true);
    let window = this.window;
    let gBrowser = window.gBrowser;
    let isRightSide = window.gHarborVerticalTabsManager._prefsRightSide;
    const callout = new lazy.FeatureCallout({
      win: this.window,
      location: "chrome",
      context: "chrome",
      browser: gBrowser.selectedBrowser,
      theme: { preset: "chrome" },
    });
    callout.showFeatureCallout({
      id: "HARBOR_LIVE_FOLDERS_CALLOUT",
      template: "feature_callout",
      groups: ["cfr"],
      content: {
        id: "HARBOR_LIVE_FOLDERS_CALLOUT",
        template: "spotlight",
        backdrop: "transparent",
        transitions: true,
        autohide: true,
        screens: [
          {
            id: "HARBOR_LIVE_FOLDERS_CALLOUT",
            anchors: [
              {
                selector: `[id="${folder.id}"] > .tab-group-label-container`,
                panel_position: {
                  anchor_attachment: isRightSide ? "leftcenter" : "rightcenter",
                  callout_attachment: isRightSide ? "topright" : "topleft",
                },
              },
            ],
            content: {
              width: "312px",
              position: "callout",
              title_logo: {
                imageURL: icon,
                width: "18px",
                height: "18px",
                marginInline: "0 8px",
              },
              title: {
                string_id: "harbor-live-folders-promotion-title",
              },
              subtitle: {
                string_id: "harbor-live-folders-promotion-description",
              },
            },
          },
        ],
      },
    });
  }

  deleteFolder(id, deleteFolder = true) {
    const liveFolder = this.liveFolders.get(id);
    if (!liveFolder) {
      return false;
    }

    liveFolder.stop();
    this.liveFolders.delete(id);

    const prefix = `${id}:`;

    // Remove the dismissed items associated with the folder from the set
    this.dismissedItems = new Set(
      Array.from(this.dismissedItems).filter(
        itemId => !itemId.startsWith(prefix)
      )
    );

    if (deleteFolder) {
      const folder = this.getFolderForLiveFolder(liveFolder);
      if (folder) {
        folder.delete();
      }
    }

    this.saveState();
    return true;
  }

  // Live Folder Updates
  // -------------------
  onLiveFolderFetch(liveFolder, items) {
    const folder = this.getFolderForLiveFolder(liveFolder);
    if (!folder) {
      return;
    }

    const errorId = typeof items === "string" ? items : null;
    liveFolder.state.lastErrorId = errorId;

    // Display on error on the folder, null reset the error status.
    this.#applyLiveFolderError(liveFolder, errorId);

    if (errorId) {
      liveFolder.requestSave();
      return;
    }

    // itemid -> id:itemid
    const itemIds = new Set(
      items.map(item => this.#makeCompositeId(liveFolder.id, item.id))
    );

    const outdatedTabs = [];
    const existingItemIds = new Set();

    for (const tab of folder.tabs) {
      const itemId = tab.getAttribute("harbor-live-folder-item-id");
      if (!itemId) {
        continue;
      }

      if (!itemIds.has(itemId)) {
        outdatedTabs.push(tab);
        continue;
      }

      existingItemIds.add(itemId);
    }

    this.window.gBrowser.removeTabs(outdatedTabs, {
      skipSessionStore: true,
      animate: !folder.collapsed,
    });

    // Remove the dismissed items that are no longer in the given list.
    // Only do this when the fetch returned results — an empty list may
    // indicate a transient failure (e.g. auth expired, HTML changed)
    // and we must not wipe all dismissals in that case.
    if (itemIds.size > 0) {
      for (const dismissedItemId of this.dismissedItems) {
        if (
          dismissedItemId.startsWith(`${liveFolder.id}:`) &&
          !itemIds.has(dismissedItemId)
        ) {
          this.dismissedItems.delete(dismissedItemId);
        }
      }
    }

    let userContextId = 0;
    let space = folder.documentGlobal.gHarborWorkspaces.getWorkspaceFromId(
      folder.getAttribute("harbor-workspace-id")
    );
    if (space) {
      userContextId = space.containerTabId || 0;
    }

    // Only add the items that are not already in the folder and was not dismissed by the user
    const newItems = items
      .filter(item => {
        const compositeId = this.#makeCompositeId(liveFolder.id, item.id);
        return (
          !existingItemIds.has(compositeId) &&
          !this.dismissedItems.has(compositeId)
        );
      })
      .map(item => {
        try {
          const tab = this.window.gBrowser.addTrustedTab(item.url, {
            createLazyBrowser: true,
            inBackground: true,
            skipAnimation: true,
            noInitialLabel: true,
            lazyTabTitle: item.title,
            userContextId,
          });
          // createLazyBrowser can't be pinned by default
          this.window.gBrowser.pinTab(tab);
          if (userContextId) {
            tab.setAttribute("harborDefaultUserContextId", "true");
          }
          if (item.icon) {
            this.window.gBrowser.setIcon(tab, item.icon);
            if (tab.linkedBrowser) {
              lazy.TabStateCache.update(tab.linkedBrowser.permanentKey, {
                image: null,
              });
            }
          }
          tab.setAttribute(
            "harbor-live-folder-item-id",
            this.#makeCompositeId(liveFolder.id, item.id)
          );
          if (item.subtitle) {
            tab.setAttribute("harbor-show-sublabel", item.subtitle);
            const tabLabel = tab.querySelector(".harbor-tab-sublabel");
            this.window.document.l10n.setArgs(tabLabel, {
              tabSubtitle: item.subtitle,
            });
          }

          return tab;
        } catch (e) {
          console.error(
            "HarborLiveFoldersManager: Failed to add tab for item",
            item.url,
            e
          );
          return null;
        }
      })
      .filter(tab => tab);

    // Wait for tabs to (hopefully) be initialized on all windows
    lazy.setTimeout(() => {
      folder.addTabs(newItems);
      this.saveState();
    }, 0);
  }

  // Helpers
  // -------
  #applyDefaultStateValues(state) {
    state.interval ||= DEFAULT_FETCH_INTERVAL;
    state.lastFetched ||= 0;
    state.options ||= {};

    return state;
  }

  #applyLiveFolderError(liveFolder, errorId = null) {
    const folder = this.getFolderForLiveFolder(liveFolder);
    if (!folder?.isLiveFolder) {
      return;
    }

    const btn = folder.resetButton;
    if (!btn) {
      return;
    }

    if (errorId) {
      btn.setAttribute("data-l10n-id", errorId);
      btn.setAttribute("live-folder-action", liveFolder.id);
    } else {
      btn.setAttribute("data-l10n-id", "harbor-folders-unload-all-tooltip");
      btn.removeAttribute("live-folder-action");
    }
  }

  getFolderForLiveFolder(liveFolder) {
    if (!this.window) {
      return null;
    }
    const folder = lazy.HarborWindowSync.getItemFromWindow(
      this.window,
      liveFolder.id
    );
    if (folder?.isHarborFolder) {
      return folder;
    }
    return null;
  }

  #makeCompositeId(folderId, itemId) {
    return `${folderId}:${itemId}`;
  }

  // Persistence
  // -----------
  get #storePath() {
    const profilePath = this.window.PathUtils.profileDir;
    return this.window.PathUtils.join(profilePath, this.#saveFilename);
  }

  async #readStateFromDisk() {
    this.#file = new lazy.JSONFile({
      path: this.#storePath,
      compression: "lz4",
    });

    await this.#file.load();
    return this.#file.data;
  }

  #writeStateToDisk(data, soon = true) {
    this.#file.data = data;
    if (soon) {
      this.#file.saveSoon();
    } else {
      this.#file._save();
    }
  }

  saveState(soon = true) {
    if (!this.#isInitialized) {
      return;
    }

    let data = [];
    for (let [id, liveFolder] of this.liveFolders) {
      const prefix = `${id}:`;
      const dismissedItems = Array.from(this.dismissedItems).filter(itemId =>
        itemId.startsWith(prefix)
      );

      const folder = this.getFolderForLiveFolder(liveFolder);
      if (!folder) {
        // Assume browser is quitting.
        return;
      }

      const tabsState = [];
      for (const tab of folder.tabs) {
        const itemId = tab.getAttribute("harbor-live-folder-item-id");
        if (!itemId) {
          continue;
        }

        tabsState.push({
          itemId,
          label: tab.getAttribute("harbor-show-sublabel"),
        });
      }

      // For UI manager to restore tabs state
      liveFolder.tabsState = tabsState;

      data.push({
        id,
        type: liveFolder.constructor.type,
        data: liveFolder.serialize(),
        dismissedItems,
        tabsState,
      });
    }

    this.#writeStateToDisk(data, soon);
  }

  async #restoreState() {
    let data = await this.#readStateFromDisk();
    if (!Array.isArray(data)) {
      this.stateRestored.resolve();
      return;
    }

    await this.window.gHarborWorkspaces.promiseInitialized;
    const folders = this.window.gHarborWorkspaces.allTabGroups;
    for (let entry of data) {
      let ProviderClass = this.registry.get(entry.type);
      if (!ProviderClass) {
        continue;
      }

      const folder = folders.find(x => x.id === entry.id);
      if (!folder) {
        // No point restore if the live folder can't find its folder
        continue;
      }

      entry.data.state = this.#applyDefaultStateValues(entry.data.state);
      let liveFolder = new ProviderClass({
        id: entry.id,
        state: entry.data.state,
        manager: this,
      });

      this.liveFolders.set(entry.id, liveFolder);
      liveFolder.tabsState = entry.tabsState || [];
      liveFolder.state.lastErrorId = entry.data.state.lastErrorId;
      if (entry.dismissedItems && Array.isArray(entry.dismissedItems)) {
        entry.dismissedItems.forEach(id => this.dismissedItems.add(id));
      }

      liveFolder.start();
    }

    this.stateRestored.resolve();
  }
}

export const HarborLiveFoldersManager = new nsHarborLiveFoldersManager();
