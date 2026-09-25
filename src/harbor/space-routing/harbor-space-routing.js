/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

const { nsHarborSpaceRoutingDialog } = ChromeUtils.importESModule(
  "resource:///modules/harbor/spacerouting/HarborSpaceRoutingDialog.mjs"
);

const args = window.arguments?.[0] || {};
window.spaceroutingDialog = new nsHarborSpaceRoutingDialog(
  document,
  window,
  args.parentWindow
);
