/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

ChromeUtils.defineESModuleGetters(this, {
  UrlbarTestUtils: "resource://testing-common/UrlbarTestUtils.sys.mjs",
});

async function openUrlbarSession(closeToken) {
  await UrlbarTestUtils.promisePopupOpen(window, () => {
    ok(
      gHarborUIManager.handleNewTab(false, false, "tab", true, closeToken),
      "The urlbar session should have opened"
    );
  });
  Assert.equal(typeof closeToken.id, "number", "The session minted a token");
  return gURLBar._harborHandleUrlbarClose;
}

function listenerFor(closeToken, seen) {
  return event => {
    if (!gHarborUIManager.matchesCloseToken(closeToken, event)) {
      return;
    }
    seen.push(event.detail.closeSeq);
  };
}

function waitForCloseOf(closeToken) {
  return BrowserTestUtils.waitForEvent(
    window,
    "HarborURLBarClosed",
    false,
    event => gHarborUIManager.matchesCloseToken(closeToken, event)
  );
}

add_task(async function test_matchesCloseToken() {
  ok(
    gHarborUIManager.matchesCloseToken({ id: 7 }, { detail: { closeSeq: 7 } }),
    "Matches correct token"
  );
  ok(
    !gHarborUIManager.matchesCloseToken({ id: 7 }, { detail: { closeSeq: 8 } }),
    "Does not match incorrect token"
  );
  ok(
    !gHarborUIManager.matchesCloseToken({}, { detail: { closeSeq: undefined } }),
    "Bad token doesn't match"
  );
  ok(
    !gHarborUIManager.matchesCloseToken({ id: 7 }, { detail: {} }),
    "An untagged event is rejected"
  );
  ok(
    !gHarborUIManager.matchesCloseToken({ id: 7 }, undefined),
    "A missing event is rejected"
  );
  ok(
    !gHarborUIManager.matchesCloseToken(undefined, { detail: { closeSeq: 7 } }),
    "A missing token is rejected"
  );
});

add_task(async function test_Every_Call_Mints_Its_Own_Token() {
  ok(gHarborUIManager.testingEnabled, "Testing is enabled");

  const seen = new Set();
  for (let i = 0; i < 3; i++) {
    const closeToken = {};
    ok(
      !gHarborUIManager.handleNewTab(false, false, "tab", false, closeToken),
      "Path bails out under harbor.testing.enabled"
    );
    Assert.equal(
      typeof closeToken.id,
      "number",
      "handleNewTab always mints a token"
    );
    ok(!seen.has(closeToken.id), `Token ${closeToken.id} is unique`);
    seen.add(closeToken.id);
  }
});

add_task(async function test_Overlapping_Sessions_Get_Correct_Tokens() {
  await SimpleTest.promiseFocus(window);
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    const seenByA = [];
    const seenByB = [];
    const dispatched = [];
    const collectAll = event => dispatched.push(event.detail.closeSeq);
    window.addEventListener("HarborURLBarClosed", collectAll);

    const tokenA = {};
    const closeA = await openUrlbarSession(tokenA);
    const onA = listenerFor(tokenA, seenByA);
    window.addEventListener("HarborURLBarClosed", onA);
    ok(gURLBar.focused, "Session A focused the urlbar");

    const tokenB = {};
    const onB = listenerFor(tokenB, seenByB);
    window.addEventListener("HarborURLBarClosed", onB);

    const aClosed = waitForCloseOf(tokenA);
    closeA(true);
    ok(!gURLBar._harborHandleUrlbarClose, "A's handler is cleared synchronously");

    const closeB = await openUrlbarSession(tokenB);
    Assert.notEqual(tokenA.id, tokenB.id, "The two sessions differ");
    ok(gHarborUIManager._isOwner(tokenB.id), "Session B owns the urlbar");
    ok(!gHarborUIManager._isOwner(tokenA.id), "Session A no longer owns it");

    await aClosed;

    Assert.deepEqual(
      dispatched,
      [tokenA.id],
      "The superseded session still announced its own close"
    );
    Assert.deepEqual(seenByA, [tokenA.id], "A's listener accepted A's close");
    Assert.deepEqual(seenByB, [], "B's listener rejected the foreign close");

    ok(gURLBar.view.isOpen, "The view is open for session B");
    ok(gURLBar.hasAttribute("harbor-newtab"), "Session B's harbor-newtab is set");
    Assert.equal(
      gURLBar._harborHandleUrlbarClose,
      closeB,
      "Session B's close handler is still installed"
    );

    const bClosed = waitForCloseOf(tokenB);
    closeB(true);
    await bClosed;
    await TestUtils.waitForCondition(
      () => !gURLBar.view.isOpen,
      "Waiting for session B to close"
    );

    Assert.deepEqual(seenByB, [tokenB.id], "B's listener accepted B's close");
    Assert.deepEqual(seenByA, [tokenA.id], "A's listener did not fire again");
    Assert.deepEqual(
      dispatched,
      [tokenA.id, tokenB.id],
      "Both sessions announced their close, in order"
    );
    ok(!gURLBar.hasAttribute("harbor-newtab"), "A live close clears harbor-newtab");
    ok(!gURLBar._harborHandleUrlbarClose, "A live close clears the handler");
    ok(!gHarborUIManager._isOwner(tokenB.id), "Ownership is released at the end");

    window.removeEventListener("HarborURLBarClosed", collectAll);
    window.removeEventListener("HarborURLBarClosed", onA);
    window.removeEventListener("HarborURLBarClosed", onB);
  });
});

add_task(async function test_Superseded_Before_Its_Teardown_Runs() {
  await SimpleTest.promiseFocus(window);
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    const seenByA = [];
    const seenByB = [];
    const tokenA = {};
    const closeA = await openUrlbarSession(tokenA);
    const onA = listenerFor(tokenA, seenByA);
    window.addEventListener("HarborURLBarClosed", onA);

    const tokenB = {};
    const onB = listenerFor(tokenB, seenByB);
    window.addEventListener("HarborURLBarClosed", onB);

    const aClosed = waitForCloseOf(tokenA);
    closeA(true);
    ok(
      gHarborUIManager.handleNewTab(false, false, "tab", true, tokenB),
      "Session B opened before A's teardown ran"
    );
    const closeB = gURLBar._harborHandleUrlbarClose;

    await aClosed;

    Assert.deepEqual(
      seenByA,
      [tokenA.id],
      "The superseded session still announced its close"
    );
    Assert.deepEqual(seenByB, [], "B's listener rejected the foreign close");
    ok(
      gURLBar.hasAttribute("harbor-newtab"),
      "A's skipped teardown did not strip the attribute B had just set"
    );
    Assert.equal(
      gURLBar._harborHandleUrlbarClose,
      closeB,
      "A's skipped teardown left B's close handler installed"
    );
    ok(gHarborUIManager._isOwner(tokenB.id), "Session B still owns the urlbar");

    window.removeEventListener("HarborURLBarClosed", onA);
    window.removeEventListener("HarborURLBarClosed", onB);
    closeB(true);
    await TestUtils.waitForCondition(
      () => !gURLBar.hasAttribute("harbor-newtab") && !gURLBar.view.isOpen,
      "Waiting for session B to close"
    );
  });
});

add_task(async function test_Interleaved_Resolves_Correctly() {
  await SimpleTest.promiseFocus(window);
  await BrowserTestUtils.withNewTab("https://example.com", async function () {
    const seenByA = [];
    const tokenA = {};
    const closeA = await openUrlbarSession(tokenA);
    const onA = listenerFor(tokenA, seenByA);
    window.addEventListener("HarborURLBarClosed", onA);

    const tokenB = {};
    let closeB = null;
    const openBDuringClose = event => {
      ok(
        gHarborUIManager.matchesCloseToken(tokenA, event),
        "Event token matches session A token"
      );

      window.removeEventListener("HarborURLBarClosed", openBDuringClose);
      ok(
        !gURLBar.hasAttribute("harbor-newtab"),
        "A's teardown ran before session B claimed the urlbar"
      );
      ok(
        gHarborUIManager.handleNewTab(false, false, "tab", true, tokenB),
        "Session B opened before A checked its ownership"
      );

      closeB = gURLBar._harborHandleUrlbarClose;
      ok(closeB, "Global close handler installed.");
    };
    window.addEventListener("HarborURLBarClosed", openBDuringClose);

    const aClosed = waitForCloseOf(tokenA);
    closeA(true);

    await aClosed;

    Assert.equal(typeof tokenB.id, "number", "Session B really opened");
    Assert.deepEqual(seenByA, [tokenA.id], "A announced its own close");
    ok(gURLBar.view.isOpen, "A did not close the view B had just claimed");
    ok(
      gURLBar.hasAttribute("harbor-newtab"),
      "Session B's bar has harbor-newtab restored"
    );
    Assert.equal(
      gURLBar._harborHandleUrlbarClose,
      closeB,
      "Session B's close handler survived"
    );
    ok(gHarborUIManager._isOwner(tokenB.id), "Session B still owns the urlbar");

    window.removeEventListener("HarborURLBarClosed", onA);
    closeB(true);
    await TestUtils.waitForCondition(
      () => !gURLBar.hasAttribute("harbor-newtab") && !gURLBar.view.isOpen,
      "Waiting for session B to close"
    );
  });
});
