// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

/* eslint-disable consistent-return */

export class HarborGlanceParent extends JSWindowActorParent {
  constructor() {
    super();
  }

  async receiveMessage(message) {
    switch (message.name) {
      case "HarborGlance:OpenGlance": {
        this.openGlance(this.browsingContext.topChromeWindow, message.data);
        break;
      }
      case "HarborGlance:CloseGlance": {
        // Explicitly allowlist fields from content; never forward
        // skipPermitUnload or other privileged flags.
        const { noAnimation, setNewID, hasFocused } = message.data ?? {};
        this.browsingContext.topChromeWindow.gHarborGlanceManager.closeGlance({
          onTabClose: true,
          noAnimation: !!noAnimation,
          setNewID: typeof setNewID === "string" ? setNewID : null,
          hasFocused: !!hasFocused,
        });
        break;
      }
      case "HarborGlance:RecordLinkClickData": {
        this.browsingContext.topChromeWindow.gHarborGlanceManager.lastLinkClickData =
          message.data;
        break;
      }
      default:
        console.warn(`[glance]: Unknown message: ${message.name}`);
    }
  }

  openGlance(window, data) {
    return window.gHarborGlanceManager.openGlance(data);
  }
}
