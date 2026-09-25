/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

async function withNewSyncedWindow(action) {
  await gHarborWorkspaces.promiseInitialized;
  const win = await BrowserTestUtils.openNewBrowserWindow();
  await win.gHarborWorkspaces.promiseInitialized;
  await action(win);
  await BrowserTestUtils.closeWindow(win);
}

async function runSyncAction(action, callback, type) {
  await new Promise(resolve => {
    window.gHarborWindowSync.addSyncHandler(async function handler(aEvent) {
      if (aEvent.type === type) {
        window.gHarborWindowSync.removeSyncHandler(handler);
        await callback(aEvent);
        resolve();
      }
    });
    action();
  });
}

function getTabState(tab) {
  return JSON.parse(SessionStore.getTabState(tab));
}

async function withNewTabAndWindow(action) {
  let newTab = null;
  await withNewSyncedWindow(async win => {
    await runSyncAction(
      () => {
        newTab = gBrowser.addTrustedTab("https://example.com/", {
          inBackground: true,
        });
      },
      async aEvent => {
        Assert.equal(aEvent.type, "TabOpen", "Event type should be TabOpen");
        await action(newTab, win);
      },
      "TabOpen"
    );
  });
  let portalTabClosing = BrowserTestUtils.waitForTabClosing(newTab);
  BrowserTestUtils.removeTab(newTab);
  await portalTabClosing;
}
