// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

document.addEventListener(
  "MozBeforeInitialXULLayout",
  () => {
    // <commandset id="mainCommandSet"> defined in browser-sets.inc
    document
      .getElementById("harborCommandSet")
      // eslint-disable-next-line complexity
      .addEventListener("command", event => {
        switch (event.target.id) {
          case "cmd_harborCompactModeToggle":
            gHarborCompactModeManager.toggle();
            break;
          case "cmd_toggleCompactModeIgnoreHover":
            gHarborCompactModeManager.toggle(true);
            break;
          case "cmd_harborCompactModeShowSidebar":
            gHarborCompactModeManager.toggleSidebar();
            break;
          case "cmd_harborWorkspaceForward":
            gHarborWorkspaces.changeWorkspaceShortcut();
            break;
          case "cmd_harborWorkspaceBackward":
            gHarborWorkspaces.changeWorkspaceShortcut(-1);
            break;
          case "cmd_harborSplitViewGrid":
            gHarborViewSplitter.toggleShortcut("grid");
            break;
          case "cmd_harborSplitViewVertical":
            gHarborViewSplitter.toggleShortcut("vsep");
            break;
          case "cmd_harborSplitViewHorizontal":
            gHarborViewSplitter.toggleShortcut("hsep");
            break;
          case "cmd_harborSplitViewUnsplit":
            gHarborViewSplitter.toggleShortcut("unsplit");
            break;
          case "cmd_harborSplitViewContextMenu":
            gHarborViewSplitter.contextSplitTabs();
            break;
          case "cmd_harborCtxShareSplitView":
            gHarborViewSplitter.contextShareSplitView();
            break;
          case "cmd_harborCopyCurrentURLMarkdown":
            gHarborCommonActions.copyCurrentURLAsMarkdownToClipboard();
            break;
          case "cmd_harborCopyCurrentURL":
            gHarborCommonActions.copyCurrentURLToClipboard();
            break;
          case "cmd_harborPinnedTabReset":
            gHarborPinnedTabManager.resetPinnedTab(gBrowser.selectedTab);
            break;
          case "cmd_harborPinnedTabResetNoTab":
            gHarborPinnedTabManager.resetPinnedTab();
            break;
          case "cmd_harborToggleSidebar":
            gHarborVerticalTabsManager.toggleExpand();
            break;
          case "cmd_harborOpenHarborThemePicker":
            gHarborThemePicker.openThemePicker(event);
            break;
          case "cmd_harborChangeWorkspaceTab":
            gHarborWorkspaces.changeTabWorkspace(
              event.sourceEvent.target.getAttribute("harbor-workspace-id")
            );
            break;
          case "cmd_harborToggleTabsOnRight":
            gHarborVerticalTabsManager.toggleTabsOnRight();
            break;
          case "cmd_harborSplitViewLinkInNewTab":
            gHarborViewSplitter.splitLinkInNewTab();
            break;
          case "cmd_harborNewEmptySplit":
            setTimeout(() => {
              gHarborViewSplitter.createEmptySplit();
            }, 0);
            break;
          case "cmd_harborReplacePinnedUrlWithCurrent":
            gHarborPinnedTabManager.replacePinnedUrlWithCurrent();
            break;
          case "cmd_harborEditPinnedUrl":
            gHarborPinnedTabManager.editPinnedUrl();
            break;
          case "cmd_contextHarborAddToEssentials":
            gHarborPinnedTabManager.addToEssentials();
            break;
          case "cmd_contextHarborRemoveFromEssentials":
            gHarborPinnedTabManager.removeEssentials();
            break;
          case "cmd_harborCtxDeleteWorkspace":
            gHarborWorkspaces.contextDeleteWorkspace(event);
            break;
          case "cmd_harborCtxShareWorkspace":
            gHarborWorkspaces.contextShareWorkspace();
            break;
          case "cmd_harborChangeWorkspaceName":
            gHarborVerticalTabsManager.renameTabStart({
              target: gHarborWorkspaces.activeWorkspaceIndicator.querySelector(
                ".harbor-current-workspace-indicator-name"
              ),
            });
            break;
          case "cmd_harborChangeWorkspaceIcon":
            gHarborWorkspaces.changeWorkspaceIcon();
            break;
          case "cmd_harborSaveDockLayout":
            gHarborWorkspaces.saveDockLayout();
            break;
          case "cmd_harborRestoreDockLayout":
            gHarborWorkspaces.restoreDockLayout();
            break;
          case "cmd_harborClearDockLayout":
            gHarborWorkspaces.clearDockLayout();
            break;
          case "cmd_harborReorderWorkspaces":
            gHarborUIManager.showToast("harbor-workspaces-how-to-reorder-title", {
              timeout: 9000,
              descriptionId: "harbor-workspaces-how-to-reorder-desc",
            });
            break;
          case "cmd_harborOpenWorkspaceCreation":
            gHarborWorkspaces.openWorkspaceCreation(event);
            break;
          case "cmd_harborOpenFolderCreation":
            gHarborFolders.createFolder([], {
              renameFolder: true,
            });
            break;
          case "cmd_harborTogglePinTab": {
            const currentTab = gHarborGlanceManager.getTabOrGlanceParent(
              gBrowser.selectedTab
            );
            if (currentTab && !currentTab.hasAttribute("harbor-empty-tab")) {
              if (currentTab.pinned) {
                gBrowser.unpinTab(currentTab);
              } else {
                gBrowser.pinTab(currentTab);
              }
            }
            break;
          }
          case "cmd_harborCloseUnpinnedTabs":
            gHarborWorkspaces.closeAllUnpinnedTabs();
            break;
          case "cmd_harborUnloadWorkspace": {
            gHarborWorkspaces.unloadWorkspace();
            break;
          }
          case "cmd_harborUnloadAllOtherWorkspace": {
            gHarborWorkspaces.unloadAllOtherWorkspaces();
            break;
          }
          case "cmd_harborOpenSpaceRoutingSettings": {
            gHarborSpaceRoutingManager.openSpaceRoutingDialog(window);
            break;
          }
          case "cmd_harborNewNavigatorUnsynced":
            OpenBrowserWindow({ harborSyncedWindow: false });
            break;
          case "cmd_harborNewLiveFolder": {
            const { HarborLiveFoldersManager } = ChromeUtils.importESModule(
              "resource:///modules/harbor/HarborLiveFoldersManager.sys.mjs"
            );
            HarborLiveFoldersManager.handleEvent(event);
            break;
          }
          case "cmd_harborDuplicateTab": {
            const selectedTabs = gBrowser.selectedTabs;
            let insertAt = selectedTabs.at(-1).index + 1;
            for (const tab of selectedTabs) {
              gBrowser.duplicateTab(tab, true, { tabIndex: insertAt++ });
            }
            break;
          }
          case "cmd_harborToggleLibrary": {
            const { HarborLibrary } = ChromeUtils.importESModule(
              "moz-src:///harbor/library/HarborLibrary.mjs",
              { global: "current" }
            );
            HarborLibrary.toggle();
            break;
          }
          default:
            gHarborGlanceManager.handleMainCommandSet(event);
            if (event.target.id.startsWith("cmd_harborWorkspaceSwitch")) {
              const index =
                parseInt(
                  event.target.id.replace("cmd_harborWorkspaceSwitch", ""),
                  10
                ) - 1;
              gHarborWorkspaces.shortcutSwitchTo(index);
            }
            break;
        }
      });
  },
  { once: true }
);
