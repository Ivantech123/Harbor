/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_Issue_10455() {
  await SpecialPowers.pushPrefEnv({
    set: [
      ["browser.tabs.closeWindowWithLastTab", true],
      ["harbor.testing.enabled", false],
      ["harbor.window-sync.enabled", false],
    ],
  });

  let newWindow = await BrowserTestUtils.openNewBrowserWindow();
  await newWindow.gHarborWorkspaces.promiseInitialized;

  const unloadEvent = BrowserTestUtils.waitForEvent(newWindow, "unload");
  Assert.equal(
    newWindow.gBrowser.tabs.length,
    3,
    "New window should have three tabs"
  );
  newWindow.BrowserCommands.closeTabOrWindow();
  newWindow.BrowserCommands.closeTabOrWindow();
  await unloadEvent;

  ok(newWindow.closed, "Window should be closing");
  await SpecialPowers.popPrefEnv();
});

add_task(async function test_Issue_10455_Dont_Close() {
  await SpecialPowers.pushPrefEnv({
    set: [
      ["browser.tabs.closeWindowWithLastTab", false],
      ["harbor.testing.enabled", false],
      ["harbor.window-sync.enabled", false],
    ],
  });

  let newWindow = await BrowserTestUtils.openNewBrowserWindow();
  await newWindow.gHarborWorkspaces.promiseInitialized;

  Assert.equal(
    newWindow.gBrowser.tabs.length,
    3,
    "New window should have three tabs"
  );
  newWindow.BrowserCommands.closeTabOrWindow();
  newWindow.BrowserCommands.closeTabOrWindow();
  Assert.strictEqual(
    newWindow.gBrowser.tabs.length,
    1,
    "Window should still have one tab"
  );
  ok(
    newWindow.gBrowser.selectedTab.hasAttribute("harbor-empty-tab"),
    "Tab should be a harbor empty tab"
  );
  ok(!newWindow.closing, "Window should be closing");

  await BrowserTestUtils.closeWindow(newWindow);
  await SpecialPowers.popPrefEnv();
});
