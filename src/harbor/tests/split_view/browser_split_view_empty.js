/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const { UrlbarTestUtils } = ChromeUtils.importESModule(
  "resource://testing-common/UrlbarTestUtils.sys.mjs"
);

/**
 * @param {object} [staleToken] - Token of a session the pane will supersede.
 */
async function stageEmptySplit(staleToken = null) {
  let staleClosed = null;

  if (staleToken) {
    staleClosed = BrowserTestUtils.waitForEvent(
      window,
      "HarborURLBarClosed",
      false,
      event => gHarborUIManager.matchesCloseToken(staleToken, event)
    );
  }
  const staleClose = gURLBar._harborHandleUrlbarClose;
  document.getElementById("cmd_harborNewEmptySplit").doCommand();
  await TestUtils.waitForCondition(
    () =>
      gURLBar._harborHandleUrlbarClose &&
      gURLBar._harborHandleUrlbarClose !== staleClose,
    "Waiting for the staged pane to open its own urlbar session"
  );
  await UrlbarTestUtils.promisePopupOpen(window, () => {});

  if (staleClosed) {
    await staleClosed;
  }

  ok(gURLBar.view.isOpen, "The staged pane's urlbar is still open");
  Assert.equal(
    gBrowser.selectedTab,
    gHarborWorkspaces._emptyTab,
    "The empty pane should be staged and selected"
  );
}

/**
 * Stages an empty split and commits it by picking the first urlbar result.
 *
 * @param {Tab} originalTab - The tab the split is being created from.
 * @param {object} [staleToken] - Token of a session the pane will supersede.
 */
async function createEmptySplitAndCheck(originalTab, staleToken = null) {
  await stageEmptySplit(staleToken);

  await UrlbarTestUtils.promiseAutocompleteResultPopup({
    window,
    waitForFocus,
    value: "https://example.com",
  });
  const waitForActivationPromise = BrowserTestUtils.waitForEvent(
    window,
    "HarborViewSplitter:SplitViewActivated"
  );
  let result = await UrlbarTestUtils.getDetailsOfResultAt(window, 0);
  EventUtils.synthesizeMouseAtCenter(result.element.row, {});
  await waitForActivationPromise;
  await new Promise(resolve => {
    /* eslint-disable mozilla/no-arbitrary-setTimeout */
    setTimeout(async () => {
      resolve();
    }, 100);
  });
  const selectedTab = gBrowser.selectedTab;
  ok(
    gBrowser.tabpanels.hasAttribute("harbor-split-view"),
    "The split view should not have crashed with two tabs in it"
  );
  ok(
    !gHarborWorkspaces._emptyTab.splitView,
    "The empty tab should not be in split view"
  );
  ok(!gHarborWorkspaces._emptyTab.group, "The empty tab should not be in a group");
  ok(selectedTab.splitView, "The selected tab should be in split view");
  ok(originalTab.splitView, "The original tab should be in split view");
  Assert.equal(
    gBrowser.tabpanels.querySelectorAll('[harbor-split="true"]').length,
    2,
    "There should be two split views present"
  );
  await BrowserTestUtils.removeTab(selectedTab);
}

/**
 * @returns {Promise<object>} The session's close token.
 */
async function openUrlbarSession() {
  const closeToken = {};
  await UrlbarTestUtils.promisePopupOpen(window, () => {
    ok(
      gHarborUIManager.handleNewTab(false, false, "tab", true, closeToken),
      "The urlbar session should have opened"
    );
  });
  ok(gURLBar.hasAttribute("harbor-newtab"), "The session owns the urlbar");
  return closeToken;
}

add_task(async function test_Split_View_Empty() {
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    await createEmptySplitAndCheck(gBrowser.selectedTab);
  });
});

add_task(async function test_Split_View_Empty_With_Urlbar_Already_Open() {
  await SimpleTest.promiseFocus(window);
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    const staleToken = await openUrlbarSession();
    await createEmptySplitAndCheck(gBrowser.selectedTab, staleToken);
  });
});

add_task(async function test_Split_View_Empty_Cancelled_With_Urlbar_Open() {
  await SimpleTest.promiseFocus(window);
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    const originalTab = gBrowser.selectedTab;
    const command = document.getElementById("cmd_harborNewEmptySplit");
    const staleToken = await openUrlbarSession();
    await stageEmptySplit(staleToken);

    EventUtils.synthesizeKey("KEY_Escape");
    await TestUtils.waitForCondition(
      () =>
        !gHarborWorkspaces._emptyTab.splitView &&
        gBrowser.selectedTab === originalTab,
      "Waiting for the staged pane to be discarded"
    );

    ok(
      !gHarborWorkspaces._emptyTab.group,
      "The empty tab should not be left in a group"
    );
    Assert.equal(
      gHarborViewSplitter._data.findIndex(group =>
        group.tabs.includes(gHarborWorkspaces._emptyTab)
      ),
      -1,
      "No split group should still hold the empty tab"
    );
    ok(
      !command.hasAttribute("disabled"),
      "New Empty Split View should be usable again"
    );
    ok(!originalTab.splitView, "The original tab should not be in split view");
  });
});
