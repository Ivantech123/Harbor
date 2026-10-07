/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

ChromeUtils.defineESModuleGetters(this, {
  UrlbarShared: "chrome://browser/content/urlbar/UrlbarShared.mjs",
  UrlbarTestUtils: "resource://testing-common/UrlbarTestUtils.sys.mjs",
  SessionSaver:
    "moz-src:///browser/components/sessionstore/SessionSaver.sys.mjs",
  TabStateFlusher:
    "moz-src:///browser/components/sessionstore/TabStateFlusher.sys.mjs",
});

const PROVIDER_NAME = "HarborUrlbarProviderSidebar";
const TAB_URL = "https://example.com/";

async function collectSidebarData() {
  await TabStateFlusher.flushWindow(window);
  await SessionSaver.run();
}

async function searchSidebarRows(value) {
  await UrlbarTestUtils.promiseAutocompleteResultPopup({
    window,
    waitForFocus,
    value,
  });
  const rows = [];
  for (let index = 0; index < UrlbarTestUtils.getResultCount(window); index++) {
    const { result } = await UrlbarTestUtils.getRowAt(window, index);
    if (result.providerName == PROVIDER_NAME) {
      rows.push({ index, result });
    }
  }
  return rows;
}

async function addLabelledTab(label) {
  const tab = BrowserTestUtils.addTab(gBrowser, TAB_URL, {
    skipAnimation: true,
  });
  await BrowserTestUtils.browserLoaded(tab.linkedBrowser);
  tab.harborStaticLabel = label;
  gBrowser._setTabLabel(tab, label);
  return tab;
}

async function removeFolder(folder) {
  const removeEvent = BrowserTestUtils.waitForEvent(folder, "TabGroupRemoved");
  folder.delete();
  await removeEvent;
}

add_task(async function test_custom_label_is_searchable() {
  const tab = await addLabelledTab("Quarterly harborinvoices");
  await collectSidebarData();

  const rows = await searchSidebarRows("harborinvoices quarterly");
  Assert.equal(rows.length, 1, "The renamed tab is the only match");
  const { result } = rows[0];
  Assert.equal(result.type, UrlbarShared.RESULT_TYPE.TAB_SWITCH);
  Assert.equal(result.payload.url, TAB_URL);
  Assert.equal(
    result.payload.title,
    "Quarterly harborinvoices",
    "The custom label is shown instead of the page title"
  );

  Assert.deepEqual(
    await searchSidebarRows("harborinvoices yearly"),
    [],
    "Every token needs to be part of the label"
  );

  await UrlbarTestUtils.promisePopupClose(window);
  BrowserTestUtils.removeTab(tab);
});

add_task(async function test_current_tab_is_not_suggested() {
  const tab = await addLabelledTab("harborcurrenttab");
  gBrowser.selectedTab = tab;
  await collectSidebarData();

  Assert.deepEqual(
    await searchSidebarRows("harborcurrenttab"),
    [],
    "There is no point in switching to the tab we are already in"
  );

  await UrlbarTestUtils.promisePopupClose(window);
  BrowserTestUtils.removeTab(tab);
});

add_task(async function test_stale_sidebar_url_is_not_suggested() {
  const tab = await addLabelledTab("harborstaletab");
  await collectSidebarData();

  BrowserTestUtils.startLoadingURIString(
    tab.linkedBrowser,
    "https://example.org/"
  );
  await BrowserTestUtils.browserLoaded(tab.linkedBrowser);

  Assert.deepEqual(
    await searchSidebarRows("harborstaletab"),
    [],
    "A url that is not open anymore must not be offered as switch to tab"
  );

  await UrlbarTestUtils.promisePopupClose(window);
  BrowserTestUtils.removeTab(tab);
});

add_task(async function test_only_active_space_tabs() {
  const originalSpace = gHarborWorkspaces.activeWorkspace;
  const tab = await addLabelledTab("harborotherspace");
  await gHarborWorkspaces.createAndSaveWorkspace("Sidebar Provider Space");
  Assert.notEqual(
    gHarborWorkspaces.activeWorkspace,
    originalSpace,
    "The new space is the active one"
  );
  await collectSidebarData();

  Assert.deepEqual(
    await searchSidebarRows("harborotherspace"),
    [],
    "Tabs from other spaces are not matched"
  );
  await UrlbarTestUtils.promisePopupClose(window);

  await gHarborWorkspaces.removeWorkspace(gHarborWorkspaces.activeWorkspace);
  Assert.equal(gHarborWorkspaces.activeWorkspace, originalSpace);
  await collectSidebarData();

  const rows = await searchSidebarRows("harborotherspace");
  Assert.equal(rows.length, 1, "The tab is matched again in its own space");

  await UrlbarTestUtils.promisePopupClose(window);
  BrowserTestUtils.removeTab(tab);
});

add_task(async function test_folders_path_and_ranking() {
  const tab = BrowserTestUtils.addTab(gBrowser, "data:text/html,tab1");
  const tab2 = BrowserTestUtils.addTab(gBrowser, "data:text/html,tab2");
  const subfolder = await gHarborFolders.createFolder([tab], {
    renameFolder: false,
    label: "harborfold archive notes",
  });
  const parent = await gHarborFolders.createFolder([tab2], {
    renameFolder: false,
    label: "harborfold",
  });
  parent.tabs[0].after(subfolder);
  await collectSidebarData();

  const rows = await searchSidebarRows("harborfold");
  Assert.equal(rows.length, 2, "Both folders are matched");
  for (const { result } of rows) {
    Assert.equal(result.type, UrlbarShared.RESULT_TYPE.DYNAMIC);
  }
  const [best, worst] = rows;
  const space = gHarborWorkspaces.getWorkspaceFromId(
    gHarborWorkspaces.activeWorkspace
  );
  Assert.equal(best.result.payload.harborFolderId, parent.id);
  Assert.equal(
    best.result.payload.path,
    [space.name, "harborfold"].join(" / "),
    "A root folder only shows its space and name"
  );
  Assert.equal(best.index, 1, "A full match sits right below the heuristic");
  Assert.equal(worst.result.payload.harborFolderId, subfolder.id);
  Assert.equal(
    worst.result.payload.path,
    [space.name, "harborfold", "harborfold archive notes"].join(" / "),
    "A subfolder shows every parent folder"
  );
  Assert.greater(
    worst.index,
    best.index,
    "The weaker the match, the further down the folder goes"
  );

  await UrlbarTestUtils.promisePopupClose(window);
  await removeFolder(subfolder);
  await removeFolder(parent);
});

add_task(async function test_picking_a_folder_reveals_it() {
  const tab = BrowserTestUtils.addTab(gBrowser, "data:text/html,tab1");
  const tab2 = BrowserTestUtils.addTab(gBrowser, "data:text/html,tab2");
  const subfolder = await gHarborFolders.createFolder([tab], {
    renameFolder: false,
    label: "harborreveal",
  });
  const parent = await gHarborFolders.createFolder([tab2], {
    renameFolder: false,
    label: "parent",
  });
  parent.tabs[0].after(subfolder);
  subfolder.collapsed = true;
  parent.collapsed = true;
  await collectSidebarData();

  const rows = await searchSidebarRows("harborreveal");
  Assert.equal(rows.length, 1, "The subfolder is matched");
  UrlbarTestUtils.setSelectedRowIndex(window, rows[0].index);
  await UrlbarTestUtils.promisePopupClose(window, () =>
    EventUtils.synthesizeKey("KEY_Enter")
  );

  await TestUtils.waitForCondition(
    () => !parent.collapsed && !subfolder.collapsed,
    "The folder and its parent get expanded"
  );

  await removeFolder(subfolder);
  await removeFolder(parent);
});
