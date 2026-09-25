// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

export class HarborModsMarketplaceParent extends JSWindowActorParent {
  constructor() {
    super();
  }

  get modsManager() {
    return this.browsingContext.topChromeWindow.gHarborMods;
  }

  async receiveMessage(message) {
    switch (message.name) {
      case "HarborModsMarketplace:InstallMod": {
        const modId = message.data.modId;
        const mod = await this.modsManager.requestMod(modId);

        console.warn(`[HarborModsMarketplaceParent]: Installing mod ${mod.id}`);

        mod.enabled = true;

        const mods = await this.modsManager.getMods();
        mods[mod.id] = mod;

        await this.modsManager.updateMods(mods);
        await this.updateChildProcesses(mod.id);

        break;
      }
      case "HarborModsMarketplace:UninstallMod": {
        const modId = message.data.modId;
        console.warn(`[HarborModsMarketplaceParent]: Uninstalling mod ${modId}`);

        const mods = await this.modsManager.getMods();

        delete mods[modId];

        await this.modsManager.removeMod(modId);
        await this.modsManager.updateMods(mods);

        await this.updateChildProcesses(modId);

        break;
      }
      case "HarborModsMarketplace:CheckForUpdates": {
        const updates = await this.modsManager.checkForModsUpdates();
        this.sendAsyncMessage("HarborModsMarketplace:CheckForUpdatesFinished", {
          updates,
        });
        break;
      }

      case "HarborModsMarketplace:IsModInstalled": {
        const themeId = message.data.themeId;
        const themes = await this.modsManager.getMods();

        return Boolean(themes?.[themeId]);
      }
    }
    return undefined;
  }

  async updateChildProcesses(modId) {
    this.sendAsyncMessage("HarborModsMarketplace:ModChanged", { modId });
  }
}
