/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_SimpleLabelChange() {
  let newLabel = "Test Label";
  await withNewTabAndWindow(async (newTab, win) => {
    let otherTab = gHarborWindowSync.getItemFromWindow(win, newTab.id);
    await runSyncAction(
      () => {
        gBrowser._setTabLabel(newTab, newLabel);
        Assert.equal(
          newTab.label,
          newLabel,
          "The original tab label should be changed"
        );
      },
      async () => {
        Assert.equal(
          otherTab.label,
          newLabel,
          "The synced tab label should match the changed label"
        );
      },
      "HarborTabLabelChanged"
    );
  });
});

add_task(async function test_DontChangeBluredTabLabel() {
  let newLabel = "Test Label";
  await withNewTabAndWindow(async (newTab, win) => {
    let otherTab = gHarborWindowSync.getItemFromWindow(win, newTab.id);
    Assert.ok(!otherTab._harborContentsVisible, "The synced tab should be blured");
    gBrowser._setTabLabel(newTab, newLabel);
    Assert.notEqual(
      otherTab.label,
      newLabel,
      "The synced tab label should NOT match the changed label"
    );
  });
});
