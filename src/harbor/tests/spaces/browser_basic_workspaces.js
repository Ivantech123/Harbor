/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_setup(async function () {});

add_task(async function test_Check_Creation() {
  const currentWorkspaceUUID = gHarborWorkspaces.activeWorkspace;
  await gHarborWorkspaces.createAndSaveWorkspace("Test Workspace 2");
  const workspaces = gHarborWorkspaces.getWorkspaces();
  Assert.strictEqual(workspaces.length, 2, "Two workspaces should exist.");
  Assert.notStrictEqual(
    currentWorkspaceUUID,
    workspaces[1].uuid,
    "The new workspace should be different from the current one."
  );

  let newTab = BrowserTestUtils.addTab(gBrowser, "about:blank", {
    skipAnimation: true,
  });
  ok(newTab, "New tab should be opened.");
  Assert.strictEqual(gBrowser.tabs.length, 2, "There should be two tabs.");
  BrowserTestUtils.removeTab(newTab);

  await gHarborWorkspaces.removeWorkspace(gHarborWorkspaces.activeWorkspace);
  const workspacesAfterRemove = gHarborWorkspaces.getWorkspaces();
  Assert.strictEqual(
    workspacesAfterRemove.length,
    1,
    "One workspace should exist."
  );
  Assert.strictEqual(
    workspacesAfterRemove[0].uuid,
    currentWorkspaceUUID,
    "The workspace should be the one we started with."
  );
  Assert.strictEqual(gBrowser.tabs.length, 2, "There should be one tab.");
});
