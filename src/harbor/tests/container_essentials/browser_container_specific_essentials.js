/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_Check_Creation() {
  await gHarborWorkspaces.createAndSaveWorkspace(
    "Container Profile 1",
    undefined,
    false,
    1
  );
  const workspaces = gHarborWorkspaces.getWorkspaces();
  Assert.strictEqual(workspaces.length, 2, "Two workspaces should exist.");

  await gHarborWorkspaces.changeWorkspace(workspaces[1]);
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

  // Change to the original workspace, there should be no essential tabs
  await gHarborWorkspaces.changeWorkspace(workspaces[0]);
  ok(
    !gBrowser.tabs.find(
      t =>
        t.hasAttribute("harbor-essential") && t.getAttribute("usercontextid") == 1
    ),
    "No essential tabs should be found in the original workspace."
  );

  await gHarborWorkspaces.removeWorkspace(newWorkspaceUUID);
});

add_task(async function test_Essentials_Hidden_Workspace_Creation() {
  const originalWorkspace = gHarborWorkspaces.getActiveWorkspace();

  const essentialTab = BrowserTestUtils.addTab(gBrowser, "about:blank", {
    skipAnimation: true,
    userContextId: 0,
  });
  gHarborPinnedTabManager.addToEssentials(essentialTab);
  const essentialsContainer = essentialTab.parentNode;

  await gHarborWorkspaces.createAndSaveWorkspace(
    "Empty Container Workspace",
    undefined,
    false,
    1
  );
  const emptyWorkspace = gHarborWorkspaces.getActiveWorkspace();

  // The temporary creation workspace uses container 0, which previously
  // caused the container 0 Essentials to reappear over the form.
  await gHarborWorkspaces.openWorkspaceCreation();

  const creationForm = document.querySelector("harbor-workspace-creation");
  ok(creationForm, "Workspace creation form is shown");
  ok(
    BrowserTestUtils.isHidden(essentialsContainer),
    "Essentials remain hidden while creating a workspace"
  );

  await creationForm.onCancelButtonCommand();
  await gHarborWorkspaces.changeWorkspace(originalWorkspace);
  await gHarborWorkspaces.removeWorkspace(emptyWorkspace.uuid);
  await BrowserTestUtils.removeTab(essentialTab);
});
