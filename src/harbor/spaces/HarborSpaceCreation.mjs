/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

const lazy = {};

ChromeUtils.defineLazyGetter(lazy, "l10n", () => {
  return new Localization(["browser/harbor-workspaces.ftl"], true);
});

class nsHarborWorkspaceCreation extends MozXULElement {
  #wasInCollapsedMode = false;
  #urlbarDimmed = false;

  promiseInitialized = new Promise(resolve => {
    this.resolveInitialized = resolve;
  });

  #hiddenElements = [];

  static get elementsToDisable() {
    return [
      "cmd_harborOpenWorkspacePanel",
      "cmd_harborOpenWorkspaceCreation",
      "cmd_harborOpenFolderCreation",
      "cmd_harborToggleSidebar",
      "cmd_newNavigatorTab",
      "cmd_newNavigatorTabNoEvent",
    ];
  }

  static get markup() {
    return `
        <vbox class="harbor-workspace-creation" flex="1">
          <form>
            <vbox>
              <html:h1 data-l10n-id="harbor-workspace-creation-header" class="harbor-workspace-creation-title" />
              <html:div>
                <label data-l10n-id="harbor-workspace-creation-label" class="harbor-workspace-creation-label" />
              </html:div>
            </vbox>
            <vbox class="harbor-workspace-creation-form">
              <hbox class="harbor-workspace-creation-name-wrapper">
                <toolbarbutton class="harbor-workspace-creation-icon-label harbor-squircle-before" />
                <html:input
                  class="harbor-workspace-creation-name"
                  type="text"
                  data-l10n-id="harbor-workspace-creation-name" />
              </hbox>
              <hbox class="harbor-workspace-creation-profile-wrapper">
                <label class="harbor-workspace-creation-profile-label" data-l10n-id="harbor-workspace-creation-profile" />
                <button class="harbor-workspace-creation-profile" />
              </hbox>
              <button
                class="harbor-workspace-creation-edit-theme-button"
                data-l10n-id="harbor-workspaces-change-theme"
                command="cmd_harborOpenHarborThemePicker" />
              <menupopup class="harbor-workspace-creation-profiles-popup" />
            </vbox>
            <vbox class="harbor-workspace-creation-buttons">
              <html:div>
                <button class="harbor-workspace-creation-create-button footer-button primary"
                  data-l10n-id="harbor-panel-ui-workspaces-create" disabled="true" />
              </html:div>
              <button class="harbor-workspace-creation-cancel-button footer-button"
                data-l10n-id="harbor-general-cancel-label" />
            </vbox>
          </form>
        </vbox>
      `;
  }

  get workspaceId() {
    return this.getAttribute("workspace-id");
  }

  get previousWorkspaceId() {
    return this.getAttribute("previous-workspace-id");
  }

  get elementsToAnimate() {
    return [
      this.querySelector(".harbor-workspace-creation-title"),
      this.querySelector(".harbor-workspace-creation-label").parentElement,
      this.querySelector(".harbor-workspace-creation-name-wrapper"),
      this.querySelector(".harbor-workspace-creation-profile-wrapper"),
      this.querySelector(".harbor-workspace-creation-edit-theme-button"),
      this.createButton.parentNode,
      this.cancelButton,
    ];
  }

  get #spaceSwitchDuration() {
    return (
      Services.prefs.getIntPref("harbor.workspaces.switch-animation-duration") /
      1000
    );
  }

  #dimUrlbar() {
    if (this.#urlbarDimmed || !gHarborVerticalTabsManager._hasSetSingleToolbar) {
      return;
    }
    this.#urlbarDimmed = true;
    const animation = gHarborUIManager.motion.animate(
      gURLBar,
      {
        opacity: [1, 0],
      },
      {
        duration: this.#spaceSwitchDuration,
        type: "spring",
        bounce: 0,
      }
    );
    if (gReduceMotion) {
      animation.complete();
    }
  }

  #restoreUrlbar() {
    if (!this.#urlbarDimmed) {
      return;
    }
    this.#urlbarDimmed = false;
    const animation = gHarborUIManager.motion.animate(
      gURLBar,
      {
        opacity: [0, 1],
      },
      {
        duration: this.#spaceSwitchDuration,
        type: "spring",
        bounce: 0,
      }
    );
    if (gReduceMotion) {
      animation.complete();
    }
    animation.then(() => {
      gURLBar.style.removeProperty("opacity");
    });
  }

  connectedCallback() {
    if (this.delayConnectedCallback()) {
      // If we are not ready yet, or if we have already connected, we
      // don't need to do anything.
      return;
    }

    this.appendChild(this.constructor.fragment);
    this.initializeAttributeInheritance();

    this.inputName = this.querySelector(".harbor-workspace-creation-name");
    this.inputIcon = this.querySelector(".harbor-workspace-creation-icon-label");
    this.inputProfile = this.querySelector(".harbor-workspace-creation-profile");
    this.createButton = this.querySelector(
      ".harbor-workspace-creation-create-button"
    );
    this.cancelButton = this.querySelector(
      ".harbor-workspace-creation-cancel-button"
    );

    this.#wasInCollapsedMode =
      document.documentElement.getAttribute("harbor-sidebar-expanded") !== "true";

    gNavToolbox.setAttribute("harbor-sidebar-expanded", "true");
    document.documentElement.setAttribute("harbor-sidebar-expanded", "true");

    window.docShell.treeOwner
      .QueryInterface(Ci.nsIInterfaceRequestor)
      .getInterface(Ci.nsIAppWindow)
      .rollupAllPopups();

    gURLBar.view.close();
    gURLBar.handleRevert();
    gURLBar.blur();

    this.handleHarborWorkspacesChangeBind =
      this.handleHarborWorkspacesChange.bind(this);

    for (const element of this.parentElement.children) {
      if (element !== this && !element.hidden) {
        element.hidden = true;
        this.#hiddenElements.push(element);
      }
    }

    for (const element of nsHarborWorkspaceCreation.elementsToDisable) {
      const el = document.getElementById(element);
      if (el) {
        el.setAttribute("disabled", "true");
      }
    }

    this.createButton.addEventListener(
      "command",
      this.onCreateButtonCommand.bind(this)
    );
    this.cancelButton.addEventListener(
      "command",
      this.onCancelButtonCommand.bind(this)
    );

    this.inputName.addEventListener("input", () => {
      this.createButton.disabled = !this.inputName.value.trim();
    });

    this.inputName.addEventListener("keydown", event => {
      if (event.key === "Enter") {
        event.preventDefault();
        event.stopPropagation();
        if (!this.createButton.disabled) {
          this.createButton.doCommand();
        }
      }
    });

    // Bound on the root so Esc works regardless of which child has focus
    // (name input, icon picker trigger, profile button, primary button).
    // Open popups consume Esc before it reaches us, so the emoji/profile
    // pickers still close as expected.
    this.addEventListener("keydown", event => {
      if (event.key === "Escape") {
        event.preventDefault();
        event.stopPropagation();
        this.cancelButton.doCommand();
      }
    });

    this.inputIcon.addEventListener("command", this.onIconCommand.bind(this));

    this.profilesPopup = this.querySelector(
      ".harbor-workspace-creation-profiles-popup"
    );

    if (gHarborWorkspaces.shouldShowContainers) {
      this.inputProfile.addEventListener(
        "command",
        this.onProfileCommand.bind(this)
      );
      this.profilesPopup.addEventListener(
        "popupshowing",
        this.onProfilePopupShowing.bind(this)
      );
      this.profilesPopup.addEventListener(
        "command",
        this.onProfilePopupCommand.bind(this)
      );

      this.currentProfile = {
        id: 0,
        name: lazy.l10n.formatValueSync("harbor-workspace-default-profile"),
      };
    } else {
      this.inputProfile.parentNode.hidden = true;
    }

    document.getElementById("harbor-sidebar-splitter").style.pointerEvents =
      "none";

    gHarborCompactModeManager.getAndApplySidebarWidth({});
    this.#dimUrlbar();
    this.resolveInitialized();
  }

  disconnectedCallback() {
    if (gHarborWorkspaces.creatingWorkspaceId === this.workspaceId) {
      gHarborWorkspaces.creatingWorkspaceId = null;
    }
  }

  async onCreateButtonCommand() {
    const workspace = gHarborWorkspaces.getActiveWorkspace();
    workspace.name = this.inputName.value.trim();
    workspace.icon = this.inputIcon.image || this.inputIcon.label || undefined;
    workspace.containerTabId = this.currentProfile;
    await gHarborWorkspaces.saveWorkspace(workspace);

    await this.#cleanup();

    gHarborWorkspaces._organizeWorkspaceStripLocations(workspace, true);
    gHarborWorkspaces.updateTabsContainers();

    gBrowser.tabContainer._invalidateCachedTabs();
  }

  async onCancelButtonCommand() {
    document.documentElement.removeAttribute("harbor-creating-workspace");
    this.#restoreUrlbar();
    await gHarborWorkspaces.changeWorkspaceWithID(this.previousWorkspaceId);
  }

  onIconCommand(event) {
    gHarborEmojiPicker.open(event.target, {
      closeOnSelect: false,
      onSelect: async icon => {
        const isSvg = icon && icon.endsWith(".svg");
        if (isSvg) {
          this.inputIcon.label = "";
          this.inputIcon.image = icon;
          this.inputIcon.setAttribute("has-svg-icon", "true");
        } else {
          this.inputIcon.image = "";
          this.inputIcon.label = icon || "";
          this.inputIcon.removeAttribute("has-svg-icon");
        }
      },
    });
  }

  set currentProfile(profile) {
    this.inputProfile.label = profile.name;
    this._profileId = profile.id;
  }

  get currentProfile() {
    return this._profileId;
  }

  onProfileCommand(event) {
    this.profilesPopup.openPopup(event.target, "after_start");
  }

  onProfilePopupShowing(event) {
    window.createUserContextMenu(event, {
      isContextMenu: true,
      showDefaultTab: true,
      showManageContainers: false,
    });

    const defaultItem = event.target.querySelector('[data-usercontextid="0"]');
    if (defaultItem) {
      defaultItem.removeAttribute("data-l10n-id");
      defaultItem.label = lazy.l10n.formatValueSync(
        "harbor-workspace-default-profile"
      );
    }
  }

  onProfilePopupCommand(event) {
    let userContextId = parseInt(
      event.target.getAttribute("data-usercontextid")
    );
    if (isNaN(userContextId)) {
      return;
    }
    this.currentProfile = {
      id: userContextId,
      name: event.target.label,
    };
  }

  finishSetup() {
    this.inputName.focus();
    gHarborWorkspaces.addChangeListeners(this.handleHarborWorkspacesChangeBind, {
      once: true,
    });
  }

  async handleHarborWorkspacesChange() {
    // The space we were living in has already slid away, no need to animate
    // ourselves out of it.
    await this.#cleanup({ animateOut: false });
    await gHarborWorkspaces.removeWorkspace(this.workspaceId);
  }

  async #cleanup({ animateOut = true } = {}) {
    if (animateOut && !gReduceMotion && this.isConnected) {
      await gHarborUIManager.motion.animate(
        this.elementsToAnimate.reverse(),
        {
          y: [0, 20],
          opacity: [1, 0],
          filter: ["blur(0)", "blur(2px)"],
        },
        {
          duration: 0.3,
          type: "spring",
          bounce: 0,
          delay: gHarborUIManager.motion.stagger(0.03),
        }
      );
    }

    document.getElementById("harbor-sidebar-splitter").style.pointerEvents = "";

    gHarborWorkspaces.removeChangeListeners(this.handleHarborWorkspacesChangeBind);
    for (const element of this.constructor.elementsToDisable) {
      const el = document.getElementById(element);
      if (el) {
        el.removeAttribute("disabled");
      }
    }

    if (this.#wasInCollapsedMode) {
      gNavToolbox.removeAttribute("harbor-sidebar-expanded");
      document.documentElement.removeAttribute("harbor-sidebar-expanded");
    }

    document.documentElement.removeAttribute("harbor-creating-workspace");

    this.remove();
    this.#restoreUrlbar();

    // Give the space back its own contents.
    const revealedElements = this.#hiddenElements;
    this.#hiddenElements = [];
    for (const element of revealedElements) {
      element.hidden = false;
    }

    // Now that the form is gone the space owns its essentials again, so let
    // it lay itself out before we fade everything back in.
    const workspace = gHarborWorkspaces.getActiveWorkspace();
    gHarborWorkspaces._organizeWorkspaceStripLocations(workspace);
    gHarborWorkspaces.updateTabsContainers();
    // The essentials were parked off screen while we were up, put them back.
    gHarborWorkspaces.resetEssentialsPosition();

    if (animateOut && !gReduceMotion) {
      const elementsToReveal = revealedElements.filter(
        element => element?.isConnected
      );
      if (elementsToReveal.length) {
        gHarborUIManager.motion
          .animate(
            elementsToReveal,
            {
              opacity: [0, 1],
            },
            {
              duration: 0.3,
              type: "spring",
              bounce: 0,
            }
          )
          .then(() => {
            for (const element of elementsToReveal) {
              element.style.removeProperty("opacity");
            }
          });
      }
    }

    gHarborUIManager.updateTabsToolbar();
  }
}

customElements.define("harbor-workspace-creation", nsHarborWorkspaceCreation);
