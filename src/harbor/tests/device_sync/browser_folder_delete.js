/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

async function applyFolderWithMembers(fid, memberIds) {
  const failed = await HarborSpacesSyncApplier.applyBatch([
    folderRecord(fid),
    ...memberIds.map(id => tabRecord(id, { pinned: true, folderId: fid })),
  ]);
  Assert.deepEqual(failed, [], "The folder batch should apply cleanly");
  const folder = document.getElementById(fid);
  Assert.ok(folder?.isHarborFolder, "The folder should materialize");
  for (const id of memberIds) {
    Assert.equal(
      document.getElementById(id)?.group,
      folder,
      `member ${id} should live in the folder`
    );
  }
}

add_task(async function test_FolderTombstoneWithMemberTombstones() {
  await gHarborWorkspaces.promiseInitialized;
  const fid = "test-sync-del-a-folder";
  const members = ["test-sync-del-a-1", "test-sync-del-a-2"];
  await applyFolderWithMembers(fid, members);

  const failed = await HarborSpacesSyncApplier.applyBatch([
    tombstone(fid),
    ...members.map(tombstone),
  ]);
  Assert.deepEqual(failed, [], "The tombstone batch should apply cleanly");
  await TestUtils.waitForCondition(
    () => !document.getElementById(fid),
    "waiting for the folder to be removed"
  );
  for (const id of members) {
    Assert.ok(!document.getElementById(id), `member ${id} should be gone`);
  }

  for (const id of [fid, ...members]) {
    HarborSpacesSyncModel.noteApplied(id, null);
  }
});

add_task(async function test_FolderTombstoneAloneDeletesMembers() {
  await gHarborWorkspaces.promiseInitialized;
  const fid = "test-sync-del-b-folder";
  const members = ["test-sync-del-b-1", "test-sync-del-b-2"];
  await applyFolderWithMembers(fid, members);

  const failed = await HarborSpacesSyncApplier.applyBatch([tombstone(fid)]);
  Assert.deepEqual(failed, [], "The tombstone batch should apply cleanly");
  await TestUtils.waitForCondition(
    () => !document.getElementById(fid),
    "waiting for the folder to be removed"
  );
  for (const id of members) {
    const tab = document.getElementById(id);
    Assert.ok(!tab, `member ${id} should be deleted, not orphaned as pinned`);
  }

  for (const id of [fid, ...members]) {
    HarborSpacesSyncModel.noteApplied(id, null);
  }
});

add_task(async function test_MemberMovedOutSurvivesFolderTombstone() {
  await gHarborWorkspaces.promiseInitialized;
  const fid = "test-sync-del-c-folder";
  const stays = "test-sync-del-c-stays";
  const moved = "test-sync-del-c-moved";
  await applyFolderWithMembers(fid, [stays, moved]);

  const failed = await HarborSpacesSyncApplier.applyBatch([
    tabRecord(moved, { pinned: true, folderId: null }),
    tombstone(fid),
  ]);
  Assert.deepEqual(failed, [], "The batch should apply cleanly");
  await TestUtils.waitForCondition(
    () => !document.getElementById(fid),
    "waiting for the folder to be removed"
  );
  const movedTab = document.getElementById(moved);
  Assert.ok(movedTab, "the moved-out member should survive");
  Assert.ok(!movedTab.group?.isHarborFolder, "and no longer be in a folder");
  Assert.ok(
    !document.getElementById(stays),
    "the member with no surviving record should be deleted"
  );

  HarborSpacesSyncModel.noteApplied(moved, null);
  for (const id of [fid, stays]) {
    HarborSpacesSyncModel.noteApplied(id, null);
  }
  if (movedTab) {
    BrowserTestUtils.removeTab(movedTab);
  }
});
