/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_setup(async function () {
  await SpecialPowers.pushPrefEnv({
    set: [["harbor.urlbar.replace-newtab", false]],
  });
  registerCleanupFunction(async () => {
    await SpecialPowers.popPrefEnv();
  });
});

add_task(
  async function test_focuses_urlbar_on_startup_without_replace_newtab() {
    await gHarborWorkspaces.promiseInitialized;
    Assert.ok(
      !gHarborVerticalTabsManager._canReplaceNewTab,
      "Precondition: harbor.urlbar.replace-newtab is disabled"
    );

    const originalTab = gBrowser.selectedTab;
    const originalOpenLocation = window.openLocation;
    const originalTestingEnabled = gHarborUIManager.testingEnabled;

    let openLocationCalls = 0;
    window.openLocation = () => {
      openLocationCalls++;
    };

    // selectStartPage() and selectEmptyTab() are both no-ops while testing mode
    // is enabled; temporarily disable it to exercise the real startup path.
    gHarborUIManager.testingEnabled = false;

    // The tab the startup page leaves selected, which Harbor wants to replace.
    const tabToRemove = BrowserTestUtils.addTab(gBrowser, "about:blank", {
      skipAnimation: true,
    });
    gBrowser.selectedTab = tabToRemove;
    gHarborWorkspaces._tabToRemoveForEmpty = tabToRemove;
    delete gHarborWorkspaces._tabToSelect;
    delete gHarborWorkspaces._shouldOverrideTabs;
    delete gHarborWorkspaces._initialTab;

    try {
      await gHarborWorkspaces.selectStartPage();

      await TestUtils.waitForCondition(
        () => openLocationCalls > 0,
        "openLocation() should be called to focus the address bar"
      );

      Assert.equal(
        openLocationCalls,
        1,
        "The address bar was focused via openLocation()"
      );
      Assert.ok(
        !gBrowser.selectedTab.hasAttribute("harbor-empty-tab"),
        "A fallback homepage tab is selected (no harbor-empty-tab attribute), so " +
          "the focus decision came from initialTabWasEmpty, not shownEmptyTab"
      );
      Assert.ok(
        !gBrowser.tabs.includes(tabToRemove),
        "The empty tab added by the startup page was removed"
      );
    } finally {
      window.openLocation = originalOpenLocation;
      gHarborUIManager.testingEnabled = originalTestingEnabled;
      delete gHarborWorkspaces._tabToRemoveForEmpty;

      // Remove any tab created by the startup path, then restore the original.
      for (const tab of [...gBrowser.tabs]) {
        if (tab !== originalTab && !tab.hasAttribute("harbor-empty-tab")) {
          BrowserTestUtils.removeTab(tab);
        }
      }
      if (!originalTab.closing) {
        gBrowser.selectedTab = originalTab;
      }
    }
  }
);
