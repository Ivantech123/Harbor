// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
// Utility to register JSWindowActors

import { ActorManagerParent } from "resource://gre/modules/ActorManagerParent.sys.mjs";

/**
 * Fission-compatible JSProcess implementations.
 * Each actor options object takes the form of a ProcessActorOptions dictionary.
 * Detailed documentation of these options is in dom/docs/ipc/jsactors.rst,
 * available at https://firefox-source-docs.mozilla.org/dom/ipc/jsactors.html
 */
let JSPROCESSACTORS = {};

/**
 * Fission-compatible JSWindowActor implementations.
 * Detailed documentation of these options is in dom/docs/ipc/jsactors.rst,
 * available at https://firefox-source-docs.mozilla.org/dom/ipc/jsactors.html
 */
let JSWINDOWACTORS = {
  HarborModsMarketplace: {
    parent: {
      esModuleURI: "resource:///actors/HarborModsMarketplaceParent.sys.mjs",
    },
    child: {
      esModuleURI: "resource:///actors/HarborModsMarketplaceChild.sys.mjs",
      events: {
        DOMContentLoaded: {},
      },
    },
    safeForUntrustedWebProcess: true,
    matches: [
      ...Services.prefs
        .getStringPref("harbor.injections.match-urls", "")
        .split(",")
        .filter(Boolean),
      "about:preferences",
    ],
  },
  HarborGlance: {
    parent: {
      esModuleURI: "resource:///actors/HarborGlanceParent.sys.mjs",
    },
    child: {
      esModuleURI: "resource:///actors/HarborGlanceChild.sys.mjs",
      events: {
        mousedown: {
          capture: true,
        },
        keydown: {
          capture: true,
        },
        click: {
          capture: true,
        },
      },
    },
    allFrames: true,
    remoteTypes: ["web", "file"],
    safeForUntrustedWebProcess: true,
    enablePreference: "harbor.glance.enabled",
  },
  HarborWindowDrag: {
    parent: {
      esModuleURI: "resource:///actors/HarborWindowDragParent.sys.mjs",
    },
    child: {
      esModuleURI: "resource:///actors/HarborWindowDragChild.sys.mjs",
      events: {
        mousedown: {
          mozSystemGroup: true,
        },
      },
    },
    messageManagerGroups: ["browsers"],
    remoteTypes: ["web", "file"],
    safeForUntrustedWebProcess: true,
    enablePreference: "harbor.view.drag-window-from-content",
  },
};

if (!Services.appinfo.inSafeMode) {
  JSWINDOWACTORS.HarborBoosts = {
    parent: {
      esModuleURI: "resource:///actors/HarborBoostsParent.sys.mjs",
    },
    child: {
      esModuleURI: "resource:///actors/HarborBoostsChild.sys.mjs",
      events: {
        DOMDocElementInserted: {},
      },
    },
    safeForUntrustedWebProcess: true,
    allFrames: true,
    remoteTypes: ["web", "file"],
    enablePreference: "harbor.boosts.enabled",
  };
}

export let gHarborActorsManager = {
  init() {
    ActorManagerParent.addJSProcessActors(JSPROCESSACTORS);
    ActorManagerParent.addJSWindowActors(JSWINDOWACTORS);
  },
};
