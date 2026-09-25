/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

const { nsHarborBoostEditor } = ChromeUtils.importESModule(
  "resource:///modules/harbor/boosts/HarborBoostsEditor.mjs"
);

window.boostEditor = new nsHarborBoostEditor(
  document,
  window.domain,
  window,
  window.openerWindow
);
