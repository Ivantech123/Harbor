/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_Container_Essentials_Auto_Swithc() {
  await gHarborWorkspaces.createAndSaveWorkspace(
    "Container Profile 1",
    undefined,
    false,
    1
  );
  const workspaces = gHarborWorkspaces.getWorkspaces();
  Assert.strictEqual(workspaces.length, 2, "Two workspaces should exist.");

  let newTab = BrowserTestUtils.addTab(gBrowser, "about:blank", {
    skipAnimation: true,
    userContextId: 1,
  });
  ok(newTab, "New tab should be opened.");
  gHarborPinnedTabManager.addToEssentials(newTab);
  ok(
    newTab.hasAttribute("harbor-essential") &&
      newTab.parentNode.getAttribute("container") == "1",
    "New tab should be marked as essential."
  );
  ok(
    gBrowser.tabs.find(
      t =>
        t.hasAttribute("harbor-essential") && t.getAttribute("usercontextid") == 1
    ),
    "New tab should be marked as essential."
  );
  const newWorkspaceUUID = gHarborWorkspaces.activeWorkspace;
  Assert.equal(
    gHarborWorkspaces.activeWorkspace,
    workspaces[1].uuid,
    "The new workspace should be active."
  );

  // Change to the original workspace, there should be no essential tabs
  await gHarborWorkspaces.changeWorkspace(workspaces[0]);
  await gHarborWorkspaces.removeWorkspace(newWorkspaceUUID);
});
