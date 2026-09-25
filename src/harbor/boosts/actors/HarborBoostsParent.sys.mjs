// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

const lazy = {};

ChromeUtils.defineESModuleGetters(lazy, {
  gHarborBoostsManager: "resource:///modules/harbor/boosts/HarborBoostsManager.sys.mjs",
});

export class HarborBoostsParent extends JSWindowActorParent {
  static OBSERVERS = [
    "harbor-boosts-update",
    "harbor-space-gradient-update",
    "harbor-boosts-disable-zap",
    "harbor-boosts-disable-picker",
  ];

  // Topics the content child is allowed to forward to the observer service.
  // Anything outside this set is rejected to prevent content-triggered
  // notifications on unrelated chrome observers.
  static ALLOWED_NOTIFY_TOPICS = new Set([
    "zap-state-update",
    "zap-list-update",
    "selector-picker-state-update",
    "selector-picker-picked",
  ]);

  /**
   * Creates a new HarborBoostsParent actor instance and sets up an observer
   * for boost update notifications.
   */
  constructor() {
    super();

    this._observe = this.observe.bind(this);
    HarborBoostsParent.OBSERVERS.forEach(observe => {
      Services.obs.addObserver(this._observe, observe);
    });
  }

  /**
   * Called when the actor is destroyed. Cleans up the observer.
   */
  didDestroy() {
    HarborBoostsParent.OBSERVERS.forEach(observe => {
      Services.obs.removeObserver(this._observe, observe);
    });
  }

  /**
   * Observer callback that handles boost update notifications.
   * Sends a message to child actors when boosts are updated.
   *
   * @param {object} subject - The subject of the notification.
   * @param {string} topic - The topic of the notification.
   */
  observe(subject, topic) {
    switch (topic) {
      case "harbor-boosts-update":
      case "harbor-space-gradient-update":
        this.sendAsyncMessage("HarborBoost:BoostDataUpdated", {
          unloadStyles: true,
        });
        break;
      case "harbor-boosts-disable-zap":
        this.sendAsyncMessage("HarborBoost:DisableZapMode");
        break;
      case "harbor-boosts-disable-picker":
        this.sendAsyncMessage("HarborBoost:DisablePickerMode");
        break;
    }
  }

  /**
   * Updates the boost size override on webpage
   *
   * @param {number} sizeOverride - The size to apply on the webpage as a override
   * @param {boolean} disable - Whether to disable the override (sets override to the default 1)
   */
  updateBoostSizeOverride(sizeOverride, disable = false) {
    if (
      sizeOverride &&
      isFinite(sizeOverride) &&
      (sizeOverride !== 1 || disable)
    ) {
      const fullZoom = this.browsingContext.topChromeWindow.FullZoom;
      fullZoom.setZoom(sizeOverride, this.browsingContext.top.embedderElement);
    }
  }

  /**
   * Handles messages received from child actors.
   * Retrieves boost data for a domain when requested.
   *
   * @param {object} message - The message object containing name and data.
   * @returns {Promise<object | null>} A promise that resolves to the boost data or null.
   */
  async receiveMessage(message) {
    switch (message.name) {
      case "HarborBoost:OpenInspector": {
        const { require } = ChromeUtils.importESModule(
          "resource://devtools/shared/loader/Loader.sys.mjs"
        );

        const { gDevTools } = require("devtools/client/framework/devtools");

        let win = Services.wm.getMostRecentWindow("navigator:browser");
        let tab = win.gBrowser.selectedTab;

        let toolbox = gDevTools.getToolboxForTab(tab);

        if (toolbox) {
          await gDevTools.closeToolboxForTab(tab);
        } else {
          await gDevTools.showToolboxForTab(tab, "inspector");
        }
        break;
      }
      case "HarborBoost:Notify": {
        const { topic, msg } = message.data ?? {};
        if (!HarborBoostsParent.ALLOWED_NOTIFY_TOPICS.has(topic)) {
          console.warn(
            `[HarborBoostsParent]: Rejected notify for disallowed topic: ${topic}`
          );
          break;
        }
        Services.obs.notifyObservers(null, topic, msg);
        break;
      }
      case "HarborBoost:ZapSelector": {
        const data = message.data;

        if (!data.action) {
          break;
        }
        if (!data.selector) {
          break;
        }
        if (!data.domain) {
          break;
        }

        if (data.action == "add") {
          lazy.gHarborBoostsManager.addZapSelectorToActive(
            data.selector,
            data.domain
          );
        } else if (data.action == "remove") {
          lazy.gHarborBoostsManager.removeZapSelectorToActive(
            data.selector,
            data.domain
          );
        } else if (data.action == "clear") {
          lazy.gHarborBoostsManager.clearZapSelectorsForActive(data.domain);
        }
        break;
      }
      case "HarborBoost:GetBoostForDomain": {
        const domain = message.data;
        const embedder = this.browsingContext.top.embedderElement;

        if (!embedder || !domain) {
          break;
        }

        const exists = lazy.gHarborBoostsManager.registeredBoostForDomain(domain);
        if (!exists) {
          break;
        }

        const boost = lazy.gHarborBoostsManager.loadActiveBoostFromStore(domain);
        let workspaceGradient = [];
        if (boost.boostEntry.boostData.autoTheme) {
          const currentWorkspace =
            await this.browsingContext.topChromeWindow.gHarborWorkspaces.getActiveWorkspace();
          workspaceGradient = currentWorkspace.theme.gradientColors;
        }

        const styleData =
          await lazy.gHarborBoostsManager.getStyleSheetForBoost(domain);

        return {
          ...boost,
          workspaceGradient,
          styleSheet: styleData
            ? {
                uuid: styleData.uuid,
                uri: styleData.uri.spec,
              }
            : null,
        };
      }
      case "HarborBoost:UpdateBoostSize": {
        const { sizeOverride } = message.data;
        this.updateBoostSizeOverride(sizeOverride);
        break;
      }
      default: {
        console.warn(`[HarborBoostsParent]: Unknown message: ${message.name}`);
        break;
      }
    }

    return null;
  }
}
