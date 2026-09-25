/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

let initialWorkspace;

function captureShare(action) {
  return new Promise(resolve => {
    const restore = stubMethod(HarborShareClient, "createShare", async doc => {
      restore();
      resolve(doc);
      return {
        id: SHARE_ID,
        expiresAt: null,
        webUrl: `/space/${SHARE_ID}`,
        link: `${SHARE_BASE}/space/${SHARE_ID}`,
      };
    });
    action();
  });
}

add_setup(async function () {
  initialWorkspace = gHarborWorkspaces.activeWorkspace;
  registerCleanupFunction(() => cleanupSpaces(initialWorkspace));
});

add_task(async function test_space_serialization() {
  await gHarborWorkspaces.createAndSaveWorkspace("Serialize Me");
  const uuid = gHarborWorkspaces.activeWorkspace;

  const folderTab = makeLazyTab("https://folder.example.com/", "Folder tab");
  const folder = gHarborFolders.createFolder([folderTab], { label: "Docs" });
  gHarborFolders.setFolderUserIcon(
    folder,
    "chrome://browser/skin/harbor-icons/selectable/star.svg"
  );
  const pinnedTab = makeLazyTab("https://pinned.example.com/", "Pinned");
  gBrowser.pinTab(pinnedTab);
  const splitA = makeLazyTab("https://a.example.com/", "Split A");
  const splitB = makeLazyTab("https://b.example.com/", "Split B");
  gBrowser.pinTab(splitA);
  gBrowser.pinTab(splitB);
  gHarborViewSplitter.splitTabs([splitA, splitB], "grid", -1);
  // Normal section: a plain tab and one that must not be shared.
  makeLazyTab("https://normal.example.com/", "Normal");
  makeLazyTab("about:preferences", "Internal");

  const workspace = gHarborWorkspaces.getActiveWorkspaceFromCache();
  workspace.theme = {
    type: "gradient",
    opacity: 0.7,
    texture: 0.3,
    gradientColors: [
      { c: [10, 20, 30], type: "explicit", isPrimary: true, lightness: "50" },
      { c: "#102030", isCustom: true, type: "custom" },
      { c: "color-mix(in srgb, red, blue)", isCustom: true, type: "custom" },
    ],
  };

  const doc = await captureShare(() => gHarborShareManager.shareSpace(uuid));
  const item = doc.shared;

  Assert.equal(item.type, "space");
  Assert.equal(item.name, "Serialize Me");
  Assert.deepEqual(
    item.items.map(i => i.type),
    ["folder", "tab", "splitView", "tab"],
    "pinned items come first, in strip order; internal urls are dropped"
  );

  const [folderItem, pinnedItem, splitItem, normalItem] = item.items;
  Assert.equal(folderItem.name, "Docs");
  Assert.ok(!("icon" in folderItem), "folder icons are not shared");
  Assert.equal(folderItem.items.length, 1, "folder keeps its tab");
  Assert.ok(pinnedItem.isPinned, "loose pinned tabs carry isPinned");
  Assert.ok(
    splitItem.tabs.every(t => t.isPinned),
    "split members carry their real pinned state"
  );
  Assert.ok(!normalItem.isPinned, "normal tabs carry no pinned flag");

  const theme = item.theme;
  Assert.ok(!("opacity" in theme), "theme opacity is stripped");
  Assert.ok(!("texture" in theme), "theme texture is stripped");
  Assert.equal(
    theme.gradientColors.length,
    2,
    "unparseable custom colors are dropped"
  );
  Assert.deepEqual(
    theme.gradientColors[1].c,
    [16, 32, 48],
    "custom css color strings become [r, g, b]"
  );

  const validation = await HarborShareClient.validateDocument(doc);
  Assert.ok(
    validation.valid,
    "the serialized document passes the schema: " +
      JSON.stringify(validation.errors ?? [])
  );

  await cleanupSpaces(initialWorkspace);
});

add_task(async function test_share_split_view_requires_two_tabs() {
  let created = false;
  const restore = stubMethod(HarborShareClient, "createShare", async () => {
    created = true;
    return { expiresAt: null, webUrl: "/x", link: "x" };
  });
  const restoreToast = stubMethod(gHarborUIManager, "showToast", () => {});
  const tab = makeLazyTab("https://only.example.com/", "Only");
  const fakeGroup = {
    hasAttribute: name => name === "split-view-group",
    tabs: [tab],
  };
  await gHarborShareManager.shareSplitView(fakeGroup);
  Assert.ok(!created, "a split with fewer than two tabs is not shared");
  restore();
  restoreToast();
  BrowserTestUtils.removeTab(tab);
});
