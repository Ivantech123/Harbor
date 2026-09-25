/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_Basic_Split_View() {
  await basicSplitNTabs(() => {
    ok(
      gBrowser.tabpanels.hasAttribute("harbor-split-view"),
      "The split view should not have crashed with two tabs in it"
    );
  });
  ok(
    !gBrowser.tabpanels.hasAttribute("harbor-split-view"),
    "Unsplit view should not have crashed with two tabs in it"
  );
});

add_task(async function test_Browser_Elements_Attributes() {
  await basicSplitNTabs(() => {
    Assert.equal(
      document.querySelectorAll('.browserSidebarContainer[harbor-split="true"]')
        .length,
      2,
      "There should be two split browser sidebars"
    );
  });
  ok(
    !document.querySelector('.browserSidebarContainer[harbor-split="true"]'),
    "There should be no split browser sidebars in unsplit view"
  );
});
