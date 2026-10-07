/* eslint-disable no-undef */
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

const { nsHarborMultiWindowFeature } = ChromeUtils.importESModule(
  "chrome://browser/content/harbor-components/HarborCommonUtils.mjs",
  { global: "current" }
);

const { nsKeyShortcutModifiers } = ChromeUtils.importESModule(
  "chrome://browser/content/harbor-components/HarborKeyboardShortcuts.mjs",
  {
    global: "current",
  }
);

var gHarborMarketplaceManager = {
  async init() {
    const checkForUpdates = document.getElementById("harborThemeMarketplaceCheckForUpdates");
    const header = document.getElementById("harborMarketplaceHeader");

    if (!checkForUpdates || !header) {
      return; // We haven't entered the settings page yet.
    }

    if (this.__hasInitializedEvents) {
      return;
    }

    if (!window.gHarborMods) {
      window.gHarborMods = nsHarborMultiWindowFeature.currentBrowser.gHarborMods;
    }

    header.appendChild(this._initDisableAll());

    // The store is a built-in page, open it in a tab of the browser window.
    document.getElementById("harborThemeMarketplaceLink")?.addEventListener("click", (event) => {
      event.preventDefault();
      window.browsingContext.topChromeWindow.openTrustedLinkIn(event.currentTarget.href, "tab");
    });

    this._initImportExport();

    this.__hasInitializedEvents = true;

    Services.prefs.addObserver(gHarborMods.updatePref, this);
    window.addEventListener(
      "unload",
      () => {
        Services.prefs.removeObserver(gHarborMods.updatePref, this);
      },
      { once: true }
    );

    await this._buildModsList();

    const checkForUpdateClick = (event) => {
      if (event.target === checkForUpdates) {
        event.preventDefault();

        this._checkForThemeUpdates(event);
      }
    };

    checkForUpdates.addEventListener("click", checkForUpdateClick);

    document.addEventListener("HarborModsMarketplace:CheckForUpdatesFinished", (event) => {
      checkForUpdates.disabled = false;

      const updates = event.detail.updates;
      const success = document.getElementById("harborThemeMarketplaceUpdatesSuccess");
      const error = document.getElementById("harborThemeMarketplaceUpdatesFailure");

      if (updates) {
        success.hidden = false;
        error.hidden = true;
      } else {
        success.hidden = true;
        error.hidden = false;
      }
    });

    window.addEventListener("unload", () => {
      this.__hasInitializedEvents = false;

      document.removeEventListener("HarborModsMarketplace:CheckForUpdatesFinished", this);
      document.removeEventListener("HarborCheckForModUpdates", this);

      checkForUpdates.removeEventListener("click", checkForUpdateClick);

      this.modsList.innerHTML = "";
      this._doNotRebuildModsList = false;
    });
  },

  _initImportExport() {
    const importButton = document.getElementById("harborThemeMarketplaceImport");
    const exportButton = document.getElementById("harborThemeMarketplaceExport");

    if (importButton) {
      importButton.addEventListener("click", this._importThemes.bind(this));
    }

    if (exportButton) {
      exportButton.addEventListener("click", this._exportThemes.bind(this));
    }
  },

  _initDisableAll() {
    const areModsDisabled = Services.prefs.getBoolPref("harbor.themes.disable-all", false);
    const browser = nsHarborMultiWindowFeature.currentBrowser;
    const mozToggle = document.createElement("moz-toggle");

    mozToggle.className =
      "harborThemeMarketplaceItemPreferenceToggle harborThemeMarketplaceDisableAllToggle";
    mozToggle.pressed = !areModsDisabled;

    browser.document.l10n.setAttributes(
      mozToggle,
      `harbor-theme-disable-all-${!areModsDisabled ? "enabled" : "disabled"}`
    );

    mozToggle.addEventListener("toggle", async (event) => {
      const { pressed = false } = event.target || {};

      this.modsList.style.display = pressed ? "" : "none";
      Services.prefs.setBoolPref("harbor.themes.disable-all", !pressed);
      browser.document.l10n.setAttributes(
        mozToggle,
        `harbor-theme-disable-all-${pressed ? "enabled" : "disabled"}`
      );
    });

    if (areModsDisabled) {
      this.modsList.style.display = "none";
    }

    return mozToggle;
  },

  async observe() {
    await this._buildModsList();
  },

  _checkForThemeUpdates(event) {
    // Send a message to the child to check for theme updates.
    event.target.disabled = true;
    // send an event that will be listened by the child process.
    document.dispatchEvent(new CustomEvent("HarborCheckForModUpdates"));
  },

  get modsList() {
    if (!this._modsList) {
      this._modsList = document.getElementById("harborThemeMarketplaceList");
    }
    return this._modsList;
  },

  _triggerBuildUpdateWithoutRebuild() {
    this._doNotRebuildModsList = true;
    gHarborMods.triggerModsUpdate();
  },

  async removeMod(modId) {
    await gHarborMods.removeMod(modId);

    gHarborMods.triggerModsUpdate();
  },

  async disableMod(modId) {
    await gHarborMods.disableMod(modId);

    this._triggerBuildUpdateWithoutRebuild();
  },

  async enableMod(modId) {
    await gHarborMods.enableMod(modId);

    this._triggerBuildUpdateWithoutRebuild();
  },

  async _importThemes() {
    const errorBox = document.getElementById("harborThemeMarketplaceImportFailure");
    const successBox = document.getElementById("harborThemeMarketplaceImportSuccess");

    successBox.hidden = true;
    errorBox.hidden = true;

    const input = document.createElement("input");

    input.type = "file";
    input.accept = ".json";
    input.style.display = "none";
    input.setAttribute("moz-accept", ".json");
    input.setAttribute("accept", ".json");

    let timeout;

    const filePromise = new Promise((resolve) => {
      input.addEventListener("change", (event) => {
        if (timeout) {
          clearTimeout(timeout);
        }

        const file = event.target.files[0];
        resolve(file);
      });

      timeout = setTimeout(() => {
        console.warn("[HarborSettings:HarborMods]: Import timeout reached, aborting.");
        resolve(null);
      }, 60000);
    });

    input.addEventListener("cancel", () => {
      console.warn("[HarborSettings:HarborMods]: Import cancelled by user.");
      clearTimeout(timeout);
    });

    input.click();

    try {
      const file = await filePromise;

      if (!file) {
        return;
      }

      const content = await file.text();

      const mods = JSON.parse(content);

      for (const mod of Object.values(mods)) {
        mod.modId = mod.id;
        await window.HarborInstallMod(mod);
      }
    } catch (error) {
      console.error("[HarborSettings:HarborMods]: Error while importing mods:", error);
      errorBox.hidden = false;
    }

    if (input) {
      input.remove();
    }
  },

  async _exportThemes() {
    const errorBox = document.getElementById("harborThemeMarketplaceExportFailure");
    const successBox = document.getElementById("harborThemeMarketplaceExportSuccess");

    successBox.hidden = true;
    errorBox.hidden = true;

    let temporalAnchor, temporalUrl;
    try {
      const mods = await gHarborMods.getMods();
      const modsJson = JSON.stringify(mods, null, 2);
      const blob = new Blob([modsJson], { type: "application/json" });

      temporalUrl = URL.createObjectURL(blob);
      // Creating a link to download the JSON file
      temporalAnchor = document.createElement("a");
      temporalAnchor.href = temporalUrl;
      temporalAnchor.download = "harbor-mods-export.json";

      document.body.appendChild(temporalAnchor);
      temporalAnchor.click();
      temporalAnchor.remove();

      successBox.hidden = false;
    } catch (error) {
      console.error("[HarborSettings:HarborMods]: Error while exporting mods:", error);
      errorBox.hidden = false;
    }

    if (temporalAnchor) {
      temporalAnchor.remove();
    }

    if (temporalUrl) {
      URL.revokeObjectURL(temporalUrl);
    }
  },

  async _buildModsList() {
    if (!this.modsList) {
      return;
    }

    if (this._doNotRebuildModsList) {
      this._doNotRebuildModsList = false;
      return;
    }

    const mods = await gHarborMods.getMods();
    const browser = nsHarborMultiWindowFeature.currentBrowser;
    const modList = document.createElement("div");

    for (const mod of Object.values(mods).sort((a, b) => a.name.localeCompare(b.name))) {
      const sanitizedName = gHarborMods.sanitizeModName(mod.name);
      const isModEnabled = mod.enabled === undefined || mod.enabled;
      const fragment = window.MozXULElement.parseXULToFragment(`
        <vbox class="harborThemeMarketplaceItem">
          <vbox class="harborThemeMarketplaceItemContent">
            <hbox flex="1" id="harborThemeMarketplaceItemContentHeader">
              <label><h3 class="harborThemeMarketplaceItemTitle"></h3></label>
            </hbox>
            <description class="description-deemphasized harborThemeMarketplaceItemDescription"></description>
          </vbox>
          <hbox class="harborThemeMarketplaceItemActions">
            ${mod.preferences ? `<button id="harborThemeMarketplaceItemConfigureButton-${sanitizedName}" class="harborThemeMarketplaceItemConfigureButton" hidden="true"></button>` : ""}
            ${mod.homepage ? `<button id="harborThemeMarketplaceItemHomePageLink-${sanitizedName}" class="harborThemeMarketplaceItemHomepageButton" harbor-mod-id="${mod.id}"></button>` : ""}
            <button class="harborThemeMarketplaceItemUninstallButton" data-l10n-id="harbor-theme-marketplace-remove-button" harbor-mod-id="${mod.id}"></button>
          </hbox>
        </vbox>
      `);

      const modName = `${mod.name} (v${mod.version ?? "1.0.0"})`;

      const base = fragment.querySelector(".harborThemeMarketplaceItem");
      const baseHeader = fragment.querySelector("#harborThemeMarketplaceItemContentHeader");

      const dialog = document.createElement("dialog");
      const mainDialogDiv = document.createElement("div");
      const headerDiv = document.createElement("div");
      const headerTitle = document.createElement("h3");
      const closeButton = document.createElement("button");
      const contentDiv = document.createElement("div");
      const mozToggle = document.createElement("moz-toggle");

      mainDialogDiv.className = "harborThemeMarketplaceItemPreferenceDialog";
      headerDiv.className = "harborThemeMarketplaceItemPreferenceDialogTopBar";
      headerTitle.textContent = modName;
      browser.document.l10n.setAttributes(headerTitle, "harbor-theme-marketplace-theme-header-title", {
        name: sanitizedName,
      });
      headerTitle.className = "harborThemeMarketplaceItemTitle";
      closeButton.id = `${sanitizedName}-modal-close`;
      browser.document.l10n.setAttributes(closeButton, "harbor-theme-marketplace-close-modal");
      contentDiv.id = `${sanitizedName}-preferences-content`;
      contentDiv.className = "harborThemeMarketplaceItemPreferenceDialogContent";
      mozToggle.className = "harborThemeMarketplaceItemPreferenceToggle";

      mozToggle.pressed = isModEnabled;
      browser.document.l10n.setAttributes(
        mozToggle,
        `harbor-theme-marketplace-toggle-${isModEnabled ? "enabled" : "disabled"}-button`
      );

      baseHeader.appendChild(mozToggle);

      headerDiv.appendChild(headerTitle);
      headerDiv.appendChild(closeButton);

      mainDialogDiv.appendChild(headerDiv);
      mainDialogDiv.appendChild(contentDiv);
      dialog.appendChild(mainDialogDiv);
      base.appendChild(dialog);

      closeButton.addEventListener("click", () => {
        dialog.close();
      });

      mozToggle.addEventListener("toggle", async (event) => {
        const modId = event.target
          .closest(".harborThemeMarketplaceItem")
          .querySelector(".harborThemeMarketplaceItemUninstallButton")
          .getAttribute("harbor-mod-id");
        event.target.setAttribute("disabled", true);

        if (!event.target.hasAttribute("pressed")) {
          await this.disableMod(modId);

          browser.document.l10n.setAttributes(
            mozToggle,
            "harbor-theme-marketplace-toggle-disabled-button"
          );

          if (mod.preferences) {
            document
              .getElementById(`harborThemeMarketplaceItemConfigureButton-${sanitizedName}`)
              .setAttribute("hidden", true);
          }
        } else {
          await this.enableMod(modId);

          browser.document.l10n.setAttributes(
            mozToggle,
            "harbor-theme-marketplace-toggle-enabled-button"
          );

          if (mod.preferences) {
            document
              .getElementById(`harborThemeMarketplaceItemConfigureButton-${sanitizedName}`)
              .removeAttribute("hidden");
          }
        }
        setTimeout(() => {
          // We use a timeout to make sure the theme list has been updated before re-enabling the button.
          event.target.removeAttribute("disabled");
        }, 400);
      });

      fragment.querySelector(".harborThemeMarketplaceItemTitle").textContent = modName;
      fragment.querySelector(".harborThemeMarketplaceItemDescription").textContent = mod.description;
      fragment
        .querySelector(".harborThemeMarketplaceItemUninstallButton")
        .addEventListener("click", async (event) => {
          const [msg] = await document.l10n.formatValues([
            { id: "harbor-theme-marketplace-remove-confirmation" },
          ]);

          if (!confirm(msg)) {
            return;
          }

          await this.removeMod(event.target.getAttribute("harbor-mod-id"));
        });

      if (mod.homepage) {
        const homepageButton = fragment.querySelector(".harborThemeMarketplaceItemHomepageButton");
        homepageButton.addEventListener("click", () => {
          // open the homepage url in a new tab
          const url = mod.homepage;

          window.open(url, "_blank");
        });
      }

      if (mod.preferences) {
        fragment
          .querySelector(".harborThemeMarketplaceItemConfigureButton")
          .addEventListener("click", () => {
            dialog.showModal();
          });

        if (isModEnabled) {
          fragment
            .querySelector(".harborThemeMarketplaceItemConfigureButton")
            .removeAttribute("hidden");
        }
      }

      const preferences = await gHarborMods.getModPreferences(mod);

      if (preferences.length) {
        const preferencesWrapper = document.createXULElement("vbox");

        preferencesWrapper.setAttribute("flex", "1");

        for (const entry of preferences) {
          const { property, label, type, placeholder, defaultValue } = entry;

          switch (type) {
            case "dropdown": {
              const { options } = entry;

              const container = document.createXULElement("hbox");
              container.classList.add("harborThemeMarketplaceItemPreference");
              container.setAttribute("align", "center");
              container.setAttribute("role", "group");

              const menulist = document.createXULElement("menulist");
              const menupopup = document.createXULElement("menupopup");

              menulist.setAttribute("sizetopopup", "none");
              menulist.setAttribute("id", property + "-popup-menulist");

              const savedValue = Services.prefs.getStringPref(property, defaultValue ?? "none");

              menulist.setAttribute("value", savedValue);
              menulist.setAttribute("tooltiptext", property);

              const defaultItem = document.createXULElement("menuitem");

              defaultItem.setAttribute("value", "none");

              if (placeholder) {
                defaultItem.setAttribute("label", placeholder || "-");
              } else {
                browser.document.l10n.setAttributes(
                  defaultItem,
                  "harbor-theme-marketplace-dropdown-default-label"
                );
              }

              menupopup.appendChild(defaultItem);

              for (const option of options) {
                let { label: optionLabel, value } = option;
                let valueType = typeof value;

                if (!["string", "number"].includes(valueType)) {
                  console.warn(
                    `[HarborSettings:HarborMods]: Warning, invalid data type received (${valueType}), skipping.`
                  );
                  continue;
                }

                let menuitem = document.createXULElement("menuitem");

                menuitem.setAttribute("value", value.toString());
                menuitem.setAttribute("label", optionLabel);

                menupopup.appendChild(menuitem);
              }

              menulist.appendChild(menupopup);

              menulist.addEventListener("command", () => {
                const value = menulist.selectedItem.value;

                let element = browser.document.getElementById(sanitizedName);

                if (!element) {
                  element = browser.document.createElement("div");

                  element.style.display = "none";
                  element.setAttribute("id", sanitizedName);

                  browser.document.body.appendChild(element);
                }

                element.setAttribute(property?.replaceAll(/\./g, "-"), value);

                Services.prefs.setStringPref(property, value === "none" ? "" : value);
                this._triggerBuildUpdateWithoutRebuild();
              });

              const nameLabel = document.createXULElement("label");
              nameLabel.setAttribute("flex", "1");
              nameLabel.setAttribute("class", "harborThemeMarketplaceItemPreferenceLabel");
              nameLabel.setAttribute("value", label);
              nameLabel.setAttribute("tooltiptext", property);

              container.appendChild(nameLabel);
              container.appendChild(menulist);
              container.setAttribute("aria-labelledby", label);

              preferencesWrapper.appendChild(container);
              break;
            }

            case "checkbox": {
              const checkbox = window.MozXULElement.parseXULToFragment(`
                <hbox class="harborThemeMarketplaceItemPreference">
                  <checkbox class="harborThemeMarketplaceItemPreferenceCheckbox"></checkbox>
                </hbox>
              `);

              const checkboxElement = checkbox.querySelector(
                ".harborThemeMarketplaceItemPreferenceCheckbox"
              );
              checkboxElement.setAttribute("label", label);
              checkboxElement.setAttribute("tooltiptext", property);
              checkboxElement.setAttribute("harbor-pref", property);

              // Checkbox only works with "true" and "false" values, it's not like HTML checkboxes.
              if (Services.prefs.getBoolPref(property, defaultValue ?? false)) {
                checkboxElement.setAttribute("checked", "true");
              }

              checkboxElement.addEventListener("click", (event) => {
                const target = event.target.closest(".harborThemeMarketplaceItemPreferenceCheckbox");
                const key = target.getAttribute("harbor-pref");
                const checked = target.hasAttribute("checked");

                if (!checked) {
                  target.removeAttribute("checked");
                } else {
                  target.setAttribute("checked", "true");
                }

                Services.prefs.setBoolPref(key, !checked);
              });

              preferencesWrapper.appendChild(checkbox);
              break;
            }

            case "string": {
              const container = document.createXULElement("hbox");
              container.classList.add("harborThemeMarketplaceItemPreference");
              container.setAttribute("align", "center");
              container.setAttribute("role", "group");

              const savedValue = Services.prefs.getStringPref(property, defaultValue ?? "");
              const sanitizedProperty = property?.replaceAll(/\./g, "-");

              const input = document.createElement("input");
              input.setAttribute("flex", "1");
              input.setAttribute("type", "text");
              input.id = `${sanitizedProperty}-input`;
              input.value = savedValue;

              if (placeholder) {
                input.setAttribute("placeholder", placeholder || "-");
              } else {
                browser.document.l10n.setAttributes(
                  input,
                  "harbor-theme-marketplace-input-default-placeholder"
                );
              }

              input.addEventListener(
                "change",
                gHarborMods.debounce((event) => {
                  const value = event.target.value;

                  Services.prefs.setStringPref(property, value);
                  this._triggerBuildUpdateWithoutRebuild();

                  if (value === "") {
                    browser.document
                      .querySelector(":root")
                      .style.removeProperty(`--${sanitizedProperty}`);
                  } else {
                    browser.document
                      .querySelector(":root")
                      .style.setProperty(`--${sanitizedProperty}`, value);
                  }
                }, 500)
              );

              const nameLabel = document.createXULElement("label");
              nameLabel.setAttribute("flex", "1");
              nameLabel.setAttribute("class", "harborThemeMarketplaceItemPreferenceLabel");
              nameLabel.setAttribute("value", label);
              nameLabel.setAttribute("tooltiptext", property);

              container.appendChild(nameLabel);
              container.appendChild(input);
              container.setAttribute("aria-labelledby", label);

              preferencesWrapper.appendChild(container);
              break;
            }

            default:
              console.warn(
                `[HarborSettings:HarborMods]: Warning, unknown preference type received (${type}), skipping.`
              );
              continue;
          }
        }
        contentDiv.appendChild(preferencesWrapper);
      }
      modList.appendChild(fragment);
    }

    this.modsList.replaceChildren(...modList.children);
    modList.remove();
  },
};

const kHarborExtendedSidebar = "harbor.view.sidebar-expanded";
const kHarborSingleToolbar = "harbor.view.use-single-toolbar";

var gHarborLooksAndFeel = {
  init() {
    if (this.__hasInitialized) {
      return;
    }
    this.__hasInitialized = true;
    gHarborMarketplaceManager.init();
    for (const pref of [kHarborExtendedSidebar, kHarborSingleToolbar]) {
      Services.prefs.addObserver(pref, this);
    }
    window.addEventListener("unload", () => {
      for (const pref of [kHarborExtendedSidebar, kHarborSingleToolbar]) {
        Services.prefs.removeObserver(pref, this);
      }
    });
    this.applySidebarLayout();
  },

  observe() {
    this.applySidebarLayout();
  },

  applySidebarLayout() {
    const isSingleToolbar = Services.prefs.getBoolPref(kHarborSingleToolbar);
    const isExtendedSidebar = Services.prefs.getBoolPref(kHarborExtendedSidebar);
    for (const layout of document.getElementById("harborLayoutList").children) {
      layout.classList.remove("selected");
      if (layout.getAttribute("layout") == "single" && isSingleToolbar) {
        layout.classList.add("selected");
      } else if (
        layout.getAttribute("layout") == "multiple" &&
        !isSingleToolbar &&
        isExtendedSidebar
      ) {
        layout.classList.add("selected");
      } else if (layout.getAttribute("layout") == "collapsed" && !isExtendedSidebar) {
        layout.classList.add("selected");
      }
    }
    if (this.__hasInitializedLayout) {
      return;
    }
    this.__hasInitializedLayout = true;
    for (const layout of document.getElementById("harborLayoutList").children) {
      layout.addEventListener("click", () => {
        if (layout.hasAttribute("disabled")) {
          return;
        }

        for (const el of document.getElementById("harborLayoutList").children) {
          el.classList.remove("selected");
        }

        layout.classList.add("selected");

        Services.prefs.setBoolPref(
          kHarborExtendedSidebar,
          layout.getAttribute("layout") != "collapsed"
        );
        Services.prefs.setBoolPref(kHarborSingleToolbar, layout.getAttribute("layout") == "single");
      });
    }
  },
};

var gHarborWorkspacesSettings = {
  init() {
    var tabsUnloaderPrefListener = {
      async observe() {
        let buttonIndex = await confirmRestartPrompt(true, 1, true, true);
        if (buttonIndex == CONFIRM_RESTART_PROMPT_RESTART_NOW) {
          Services.startup.quit(Ci.nsIAppStartup.eAttemptQuit | Ci.nsIAppStartup.eRestart);
        }
      },
    };

    let toggleHarborCycleByAttrWarning = {
      observe() {
        const warning = document.getElementById("harborTabsCycleByAttributeWarning");
        warning.hidden = !(
          Services.prefs.getBoolPref("harbor.tabs.ctrl-tab.ignore-essential-tabs", false) &&
          Services.prefs.getBoolPref("browser.ctrlTab.sortByRecentlyUsed", false)
        );
      },
    };

    toggleHarborCycleByAttrWarning.observe(); // call it once on initial load

    Services.prefs.addObserver("harbor.glance.enabled", tabsUnloaderPrefListener); // We can use the same listener for both prefs
    Services.prefs.addObserver("harbor.workspaces.separate-essentials", tabsUnloaderPrefListener);
    Services.prefs.addObserver("harbor.window-sync.sync-only-pinned-tabs", tabsUnloaderPrefListener);
    Services.prefs.addObserver(
      "harbor.tabs.ctrl-tab.ignore-essential-tabs",
      toggleHarborCycleByAttrWarning
    );
    Services.prefs.addObserver("browser.ctrlTab.sortByRecentlyUsed", toggleHarborCycleByAttrWarning);
    window.addEventListener("unload", () => {
      Services.prefs.removeObserver("harbor.glance.enabled", tabsUnloaderPrefListener);
      Services.prefs.removeObserver("harbor.workspaces.separate-essentials", tabsUnloaderPrefListener);
      Services.prefs.removeObserver(
        "harbor.window-sync.sync-only-pinned-tabs",
        tabsUnloaderPrefListener
      );
      Services.prefs.removeObserver(
        "harbor.tabs.ctrl-tab.ignore-essential-tabs",
        toggleHarborCycleByAttrWarning
      );
      Services.prefs.removeObserver(
        "browser.ctrlTab.sortByRecentlyUsed",
        toggleHarborCycleByAttrWarning
      );
    });
  },
};

const HARBOR_CKS_CLASS_BASE = "harborCKSOption";
const HARBOR_CKS_INPUT_FIELD_CLASS = `${HARBOR_CKS_CLASS_BASE}-input`;
const HARBOR_CKS_LABEL_CLASS = `${HARBOR_CKS_CLASS_BASE}-label`;
const HARBOR_CKS_WRAPPER_ID = `${HARBOR_CKS_CLASS_BASE}-wrapper`;
const HARBOR_CKS_GROUP_PREFIX = `${HARBOR_CKS_CLASS_BASE}-group`;
const KEYBIND_ATTRIBUTE_KEY = "key";

const harborMissingKeyboardShortcutL10n = {
  key_quickRestart: "harbor-key-quick-restart",
  key_delete: "harbor-key-delete",
  goBackKb: "harbor-key-go-back",
  goForwardKb: "harbor-key-go-forward",
  key_enterFullScreen: "harbor-key-enter-full-screen",
  key_exitFullScreen: "harbor-key-exit-full-screen",
  key_aboutProcesses: "harbor-key-about-processes",
  key_sanitize: "harbor-key-sanitize",
  key_wrCaptureCmd: "harbor-key-wr-capture-cmd",
  key_wrToggleCaptureSequenceCmd: "harbor-key-wr-toggle-capture-sequence-cmd",
  key_undoCloseWindow: "harbor-key-undo-close-window",

  "harbor-glance-expand": "harbor-glance-expand",

  key_selectTab1: "harbor-key-select-tab-1",
  key_selectTab2: "harbor-key-select-tab-2",
  key_selectTab3: "harbor-key-select-tab-3",
  key_selectTab4: "harbor-key-select-tab-4",
  key_selectTab5: "harbor-key-select-tab-5",
  key_selectTab6: "harbor-key-select-tab-6",
  key_selectTab7: "harbor-key-select-tab-7",
  key_selectTab8: "harbor-key-select-tab-8",
  key_selectLastTab: "harbor-key-select-tab-last",
  key_duplicateTab: "customkeys-file-duplicate-tab",

  key_showAllTabs: "harbor-key-show-all-tabs",
  key_gotoHistory: "harbor-key-goto-history",

  goHome: "harbor-key-go-home",
  key_redo: "harbor-key-redo",

  key_inspectorMac: "harbor-key-inspector-mac",
  key_findSelection: "harbor-key-find-selection",
  key_findPrevious2: "harbor-search-find-again-shortcut-prev-alt",

  // Devtools
  key_toggleToolbox: "harbor-devtools-toggle-shortcut",
  key_browserToolbox: "harbor-devtools-toggle-browser-toolbox-shortcut",
  key_browserConsole: "harbor-devtools-toggle-browser-console-shortcut",
  key_responsiveDesignMode: "harbor-devtools-toggle-responsive-design-mode-shortcut",
  key_inspector: "harbor-devtools-toggle-inspector-shortcut",
  key_webconsole: "harbor-devtools-toggle-web-console-shortcut",
  key_jsdebugger: "harbor-devtools-toggle-js-debugger-shortcut",
  key_netmonitor: "harbor-devtools-toggle-net-monitor-shortcut",
  key_styleeditor: "harbor-devtools-toggle-style-editor-shortcut",
  key_performance: "harbor-devtools-toggle-performance-shortcut",
  key_storage: "harbor-devtools-toggle-storage-shortcut",
  key_dom: "harbor-devtools-toggle-dom-shortcut",
  key_accessibility: "harbor-devtools-toggle-accessibility-shortcut",
};

var harborIgnoreKeyboardShortcutIDs = [
  "key_enterFullScreen_old",
  "key_enterFullScreen_compat",
  "key_exitFullScreen_old",
  "key_exitFullScreen_compat",
  "key_duplicateTab",
  "key_addTabSplitView",
  "key_separateTabSplitView",
  "viewOpenTabsSidebarKb",
];

var harborIgnoreKeyboardShortcutL10n = [
  "harbor-full-zoom-reduce-shortcut-alt-b",
  "harbor-full-zoom-reduce-shortcut-alt-a",
];

var gHarborCKSSettings = {
  async init() {
    await this._initializeCKS();
    if (this.__hasInitialized) {
      return;
    }
    this.__hasInitialized = true;
    this._currentActionID = null;
    this._initializeEvents();
    window.addEventListener("unload", () => {
      this.__hasInitialized = false;
      document.getElementById(HARBOR_CKS_WRAPPER_ID).innerHTML = "";
    });
  },

  _initializeEvents() {
    const resetAllListener = this.resetAllShortcuts.bind(this);
    const handleKeyDown = this._handleKeyDown.bind(this);
    window.addEventListener("keydown", handleKeyDown);
    const button = document.getElementById("harborCKSResetButton");
    button.addEventListener("click", resetAllListener);
    window.addEventListener("unload", () => {
      window.removeEventListener("keydown", handleKeyDown);
      button.removeEventListener("click", resetAllListener);
    });
  },

  async resetAllShortcuts() {
    let buttonIndex = await confirmRestartPrompt(true, 1, true, false);
    if (buttonIndex == CONFIRM_RESTART_PROMPT_RESTART_NOW) {
      await gHarborKeyboardShortcutsManager.resetAllShortcuts();
      Services.startup.quit(Ci.nsIAppStartup.eAttemptQuit | Ci.nsIAppStartup.eRestart);
    }
  },

  async _initializeCKS() {
    let wrapper = document.getElementById(HARBOR_CKS_WRAPPER_ID);
    wrapper.innerHTML = "";

    let shortcuts = await gHarborKeyboardShortcutsManager.getModifiableShortcuts();

    if (!shortcuts) {
      throw Error("No shortcuts defined!");
    }

    // Generate section per each group
    for (let group of VALID_SHORTCUT_GROUPS) {
      let groupClass = `${HARBOR_CKS_GROUP_PREFIX}-${group}`;
      if (!wrapper.querySelector(`[data-group="${groupClass}"]`)) {
        let groupElem = document.createElement("h2");
        groupElem.setAttribute("data-group", groupClass);
        document.l10n.setAttributes(groupElem, groupClass);
        wrapper.appendChild(groupElem);
      }
    }

    for (let shortcut of shortcuts) {
      const keyID = shortcut.getID();
      const action = shortcut.getAction();
      const l10nID = shortcut.getL10NID();
      const group = shortcut.getGroup();
      const keyInString = shortcut.toDisplayString();

      const labelValue = harborMissingKeyboardShortcutL10n[keyID] ?? l10nID;

      if (
        harborIgnoreKeyboardShortcutIDs.includes(keyID) ||
        harborIgnoreKeyboardShortcutL10n.includes(labelValue) ||
        shortcut.shouldBeEmpty
      ) {
        continue;
      }

      let fragment = window.MozXULElement.parseXULToFragment(`
        <hbox class="${HARBOR_CKS_CLASS_BASE}">
          <label class="${HARBOR_CKS_LABEL_CLASS}" for="${HARBOR_CKS_CLASS_BASE}-${keyID}"></label>
          <vbox flex="1">
            <html:input readonly="1" class="${HARBOR_CKS_INPUT_FIELD_CLASS}" id="${HARBOR_CKS_INPUT_FIELD_CLASS}-${keyID}" />
          </vbox>
        </hbox>
      `);

      const label = fragment.querySelector(`.${HARBOR_CKS_LABEL_CLASS}`);
      if (!labelValue) {
        label.textContent = action; // Just in case
      } else {
        document.l10n.setAttributes(label, labelValue);
      }

      let input = fragment.querySelector(`.${HARBOR_CKS_INPUT_FIELD_CLASS}`);
      if (keyInString && !shortcut.isEmpty()) {
        input.value = keyInString;
      } else {
        this._resetShortcut(input);
      }

      input.setAttribute(KEYBIND_ATTRIBUTE_KEY, keyID);
      input.setAttribute("data-group", group);
      input.setAttribute("data-id", keyID);

      input.addEventListener("focus", (event) => {
        this._currentActionID = event.target.getAttribute("data-id");
        event.target.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);
        this._hasSafed = true;
      });

      input.addEventListener("editDone", (event) => {
        const target = event.target;
        target.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);
      });

      input.addEventListener("blur", (event) => {
        this._currentActionID = null;
        const target = event.target;
        target.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);
        if (!this._hasSafed) {
          target.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-unsafed`);
          if (!target.nextElementSibling) {
            target.after(
              window.MozXULElement.parseXULToFragment(`
              <label class="${HARBOR_CKS_CLASS_BASE}-unsafed" data-l10n-id="harbor-key-unsaved"></label>
            `)
            );
            target.value = "Not set";
          }
        } else {
          target.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-unsafed`);
          const sibling = target.nextElementSibling;
          if (sibling && sibling.classList.contains(`${HARBOR_CKS_CLASS_BASE}-unsafed`)) {
            sibling.remove();
          }
        }
        if (target.classList.contains(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`)) {
          target.label = "Not set";
        }
      });

      const groupElem = wrapper.querySelector(`[data-group="${HARBOR_CKS_GROUP_PREFIX}-${group}"]`);
      groupElem.after(fragment);
    }
  },

  async _resetShortcut(input) {
    input.value = "Not set";
    input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-invalid`);
    input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);
    input.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`);

    if (this._currentActionID) {
      this._editDone();
      await gHarborKeyboardShortcutsManager.setShortcut(this._currentActionID, null, null);
    }
  },

  _editDone(shortcut, modifiers) {
    // Check if we have a valid key
    if (!shortcut || !modifiers) {
      return;
    }
    gHarborKeyboardShortcutsManager.setShortcut(this._currentActionID, shortcut, modifiers);
    this._currentActionID = null;
  },

  //TODO Check for duplicates
  async _handleKeyDown(event) {
    if (!this._currentActionID || document.hidden) {
      return;
    }

    event.preventDefault();

    let input = document.querySelector(
      `.${HARBOR_CKS_INPUT_FIELD_CLASS}[${KEYBIND_ATTRIBUTE_KEY}="${this._currentActionID}"]`
    );
    const modifiers = new nsKeyShortcutModifiers(
      event.ctrlKey,
      event.altKey,
      event.shiftKey,
      event.metaKey,
      false
    );
    const modifiersActive = modifiers.areAnyActive();

    input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`);

    // First, try to read the *physical* key via event.code.
    // If event.code is like "KeyS", "KeyA", ..., strip off "Key" → "S".
    // Otherwise, fall back to event.key (e.g. "F5", "Enter", etc.).
    let shortcut;
    if (event.code && event.code.startsWith("Key")) {
      shortcut = event.code.slice(3);
    } else if (event.code && event.code.startsWith("Digit")) {
      shortcut = event.code.slice(5);
    } else {
      // Use physical key mapping for common symbols
      const CODE_TO_KEY_MAP = {
        Comma: ",",
        Period: ".",
        Slash: "/",
        Semicolon: ";",
        Quote: "'",
        BracketLeft: "[",
        BracketRight: "]",
        Backslash: "\\",
        Backquote: "`",
        Minus: "-",
        Equal: "=",
      };
      shortcut = CODE_TO_KEY_MAP[event.code] || event.key;
    }

    shortcut = shortcut.replace(/Ctrl|Control|Shift|Alt|Option|Cmd|Meta/, ""); // Remove all modifiers

    if (shortcut == "Tab" && !modifiersActive) {
      input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`);
      input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);
      this._latestValidKey = null;
      this._currentActionID = null;
      return;
    } else if (shortcut == "Escape" && !modifiersActive) {
      const { hasConflicts, conflictShortcut } = gHarborKeyboardShortcutsManager.checkForConflicts(
        this._latestValidKey ? this._latestValidKey : shortcut,
        this._latestModifier ? this._latestModifier : modifiers,
        this._currentActionID
      );

      if (!this._latestValidKey && !this._latestModifier) {
        // todo(lint): This is a bit weird, we need to remove this empty block
      } else if (!this._latestValidKey || hasConflicts) {
        if (!input.classList.contains(`${HARBOR_CKS_INPUT_FIELD_CLASS}-invalid`)) {
          input.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-invalid`);
        }
        input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-unsafed`);

        if (hasConflicts) {
          const shortcutL10nKey =
            harborMissingKeyboardShortcutL10n[conflictShortcut.getID()] ??
            conflictShortcut.getL10NID();

          const [group, conflictName] = await document.l10n.formatValues([
            { id: `${HARBOR_CKS_GROUP_PREFIX}-${conflictShortcut.getGroup()}` },
            { id: shortcutL10nKey },
          ]);

          if (!input.nextElementSibling) {
            input.after(
              window.MozXULElement.parseXULToFragment(`
                <label class="${HARBOR_CKS_CLASS_BASE}-conflict" data-l10n-id="harbor-key-conflict"></label>
              `)
            );
          }

          document.l10n.setAttributes(input.nextElementSibling, "harbor-key-conflict", {
            group: group ?? "",
            shortcut: conflictName ?? shortcut ?? "",
          });
        }
      } else {
        input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-editing`);

        this._editDone(this._latestValidKey, this._latestModifier);
        if (this.name == "Not set") {
          input.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`);
        }
        this._latestValidKey = null;
        this._latestModifier = null;
        input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-invalid`);
        input.classList.add(`${HARBOR_CKS_INPUT_FIELD_CLASS}-valid`);
        setTimeout(() => {
          input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-valid`);
        }, 1000);
        const sibling = input.nextElementSibling;
        if (sibling && sibling.classList.contains(`${HARBOR_CKS_CLASS_BASE}-conflict`)) {
          sibling.remove();
        }
      }
      this._hasSafed = true;
      input.blur();
      this._currentActionID = null;
      return;
    } else if (shortcut == "Backspace" && !modifiersActive) {
      this._resetShortcut(input);
      this._latestValidKey = null;
      this._latestModifier = null;
      this._hasSafed = true;
      const sibling = input.nextElementSibling;
      if (sibling && sibling.classList.contains(`${HARBOR_CKS_CLASS_BASE}-conflict`)) {
        sibling.remove();
      }
      return;
    }

    this._latestModifier = modifiers;
    this._hasSafed = false;
    input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-invalid`);
    input.classList.remove(`${HARBOR_CKS_INPUT_FIELD_CLASS}-not-set`);
    input.value = modifiers.toDisplayString() + gHarborKeyboardShortcutsManager.getKeyDisplay(shortcut);
    this._latestValidKey = shortcut;
  },
};

Preferences.addAll([
  {
    id: "harbor.view.compact.toolbar-flash-popup",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.workspaces.hide-default-container-indicator",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.tab-unloader.timeout-minutes",
    type: "int",
    default: 10,
  },
  {
    id: "harbor.pinned-tab-manager.restore-pinned-tabs-to-pinned-url",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.pinned-tab-manager.close-shortcut-behavior",
    type: "string",
    default: "switch",
  },
  {
    id: "harbor.workspaces.force-container-workspace",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.workspaces.open-new-tab-if-last-unpinned-tab-is-closed",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.glance.activation-method",
    type: "string",
    default: "ctrl",
  },
  {
    id: "harbor.glance.enabled",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.view.drag-window-from-content",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.urlbar.behavior",
    type: "string",
    default: "float",
  },
  {
    id: "harbor.workspaces.separate-essentials",
    type: "bool",
    default: false,
  },
  {
    id: "harbor.tabs.show-newtab-vertical",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.view.show-newtab-button-top",
    type: "bool",
    default: true,
  },
  {
    id: "media.videocontrols.picture-in-picture.enabled",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.workspaces.continue-where-left-off",
    type: "bool",
    default: false,
  },
  {
    id: "harbor.mods.auto-update",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.tabs.ctrl-tab.ignore-essential-tabs",
    type: "bool",
    default: false,
  },
  {
    id: "harbor.tabs.ctrl-tab.ignore-pending-tabs",
    type: "bool",
    default: false,
  },
  {
    id: "harbor.tabs.close-on-back-with-no-history",
    type: "bool",
    default: false,
  },
  {
    id: "harbor.tabs.select-recently-used-on-close",
    type: "bool",
    default: true,
  },
  {
    id: "harbor.window-sync.sync-only-pinned-tabs",
    type: "bool",
    default: false,
  },
]);

Preferences.addSetting({
  id: "harborWorkspaceContinueWhereLeftOff",
  pref: "harbor.workspaces.continue-where-left-off",
});
