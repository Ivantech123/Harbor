/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

function fakeTab(workspaceId) {
  return {
    getAttribute(name) {
      return name === "harbor-workspace-id" ? workspaceId : null;
    },
    hasAttribute(name) {
      return this.getAttribute(name) !== null;
    },
  };
}

function withRecordedSwitch(fn) {
  const calls = [];
  gHarborWorkspaces.changeWorkspaceWithID = id => {
    calls.push(id);
  };
  try {
    fn(calls);
  } finally {
    // Remove the own property so the prototype method shows through again.
    delete gHarborWorkspaces.changeWorkspaceWithID;
  }
}

add_task(function test_switches_when_tab_in_other_space() {
  withRecordedSwitch(calls => {
    const otherSpace = gHarborWorkspaces.activeWorkspace + "-different";
    gHarborWorkspaces.onBeforeTabSelect(fakeTab(otherSpace));
    Assert.deepEqual(
      calls,
      [otherSpace],
      "Selecting a tab from another space switches to that space"
    );
  });
});

add_task(function test_no_switch_when_tab_in_active_space() {
  withRecordedSwitch(calls => {
    const active = gHarborWorkspaces.activeWorkspace;
    Assert.ok(active, "Test relies on a non-empty active workspace");
    gHarborWorkspaces.onBeforeTabSelect(fakeTab(active));
    Assert.deepEqual(
      calls,
      [],
      "Selecting a tab already in the active space does not switch"
    );
  });
});

add_task(function test_no_switch_when_tab_has_no_space() {
  withRecordedSwitch(calls => {
    gHarborWorkspaces.onBeforeTabSelect(fakeTab(null));
    Assert.deepEqual(
      calls,
      [],
      "A tab with no harbor-workspace-id does not switch spaces"
    );
  });
});

add_task(function test_handles_missing_tab() {
  withRecordedSwitch(calls => {
    gHarborWorkspaces.onBeforeTabSelect(null);
    gHarborWorkspaces.onBeforeTabSelect(undefined);
    Assert.deepEqual(calls, [], "A missing tab is ignored without throwing");
  });
});
