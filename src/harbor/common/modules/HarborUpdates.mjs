// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import createSidebarNotification from "chrome://browser/content/harbor-components/HarborSidebarNotification.mjs";

const HARBOR_UPDATE_PREF = "harbor.updates.last-version";
const HARBOR_BUILD_ID_PREF = "harbor.updates.last-build-id";
const HARBOR_UPDATE_SHOW = "harbor.updates.show-update-notification";
const HARBOR_UPDATE_NOTIFICATION_TIMEOUT_MS = 15000;

export default function checkForHarborUpdates() {
  const version = Services.appinfo.version;
  const lastVersion = Services.prefs.getStringPref(HARBOR_UPDATE_PREF, "");
  Services.prefs.setStringPref(HARBOR_UPDATE_PREF, version);
  if (
    version === lastVersion ||
    gHarborUIManager.testingEnabled ||
    !Services.prefs.getBoolPref(HARBOR_UPDATE_SHOW, true)
  ) {
    return;
  }
  const updateUrl = Services.prefs.getStringPref(
    "app.releaseNotesURL.prompt",
    ""
  );
  createSidebarNotification({
    headingL10nId: "harbor-sidebar-notification-updated-heading",
    autoHideMs: HARBOR_UPDATE_NOTIFICATION_TIMEOUT_MS,
    links: [
      {
        url: Services.urlFormatter.formatURL(
          updateUrl.replace("%VERSION%", version)
        ),
        l10nId: "harbor-sidebar-notification-updated",
        special: true,
        icon: "chrome://browser/skin/harbor-icons/sparkles.svg",
      },
      {
        url: "https://www.zen-browser.app/donate",
        l10nId: "harbor-sidebar-notification-donate",
        icon: "chrome://browser/skin/harbor-icons/heart-circle-fill.svg",
      },
      {
        action: () => {
          Services.obs.notifyObservers(window, "restart-in-safe-mode");
        },
        l10nId: "harbor-sidebar-notification-restart-safe-mode",
        icon: "chrome://browser/skin/harbor-icons/security-broken.svg",
      },
    ],
  });
}

export async function createWindowUpdateAnimation() {
  const appID = Services.appinfo.appBuildID;
  if (
    Services.prefs.getStringPref(HARBOR_BUILD_ID_PREF, "") === appID ||
    gHarborUIManager.testingEnabled
  ) {
    return;
  }
  Services.prefs.setStringPref(HARBOR_BUILD_ID_PREF, appID);
  await playWindowSweepAnimation();
}

/**
 * Plays the full-window sweep shown after updates. Also used the first
 * time incoming sync data is applied on this profile.
 */
export async function playWindowSweepAnimation() {
  await gHarborWorkspaces.promiseInitialized;
  const appWrapper = document.getElementById("harbor-main-app-wrapper");
  const element = document.createElement("div");
  element.id = "harbor-update-animation";
  const elementBorder = document.createElement("div");
  elementBorder.id = "harbor-update-animation-border";
  requestIdleCallback(() => {
    if (gReduceMotion) {
      return;
    }
    appWrapper.appendChild(element);
    appWrapper.appendChild(elementBorder);
    Promise.all([
      gHarborUIManager.motion.animate(
        "#harbor-update-animation",
        {
          top: ["100%", "-50%"],
          opacity: [0.5, 1],
        },
        {
          duration: 0.35,
        }
      ),
      gHarborUIManager.motion.animate(
        "#harbor-update-animation-border",
        {
          "--background-top": ["150%", "-50%"],
        },
        {
          duration: 0.35,
          delay: 0.08,
        }
      ),
    ]).then(() => {
      element.remove();
      elementBorder.remove();
    });
  });
}
