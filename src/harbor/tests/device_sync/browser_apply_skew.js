/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

add_task(async function test_AppliedCreateNotTombstonedBeforeCollection() {
  await gHarborWorkspaces.promiseInitialized;
  await collectProjections();

  const id = "test-skew-create";
  HarborSpacesSyncModel.noteApplied(id, tabRecord(id, { pinned: true }).cleartext);
  Assert.ok(
    !HarborSpacesSyncModel.itemExists(id),
    "the id is acknowledged but not yet projected (the skew window)"
  );

  const changes = HarborSpacesSyncModel.computeChangedIDs();
  Assert.ok(
    !(id in changes),
    "a just-applied create is not tombstoned before the projection catches up"
  );

  HarborSpacesSyncModel.noteApplied(id, null);
});

add_task(async function test_AppliedDeletionNotResurrectedBeforeCollection() {
  await gHarborWorkspaces.promiseInitialized;

  const tab = await openSyncableTab("https://example.com/?skew-delete", {
    pinned: true,
  });
  const id = tab.id;
  await collectProjections();
  HarborSpacesSyncModel.markUploaded([id]);
  Assert.ok(
    !(id in HarborSpacesSyncModel.computeChangedIDs()),
    "the uploaded tab is clean before the deletion"
  );

  const failed = await HarborSpacesSyncApplier.applyBatch([tombstone(id)]);
  Assert.deepEqual(failed, [], "the tombstone applies cleanly");
  Assert.ok(!document.getElementById(id), "the tab is removed");

  const changes = HarborSpacesSyncModel.computeChangedIDs();
  Assert.ok(
    !(id in changes),
    "a just-applied deletion is not re-uploaded before the projection catches up"
  );

  HarborSpacesSyncModel.noteApplied(id, null);
});
