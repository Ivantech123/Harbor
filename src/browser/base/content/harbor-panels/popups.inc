# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

<menupopup id="harborCreateNewPopup">
  <menuitem data-l10n-id="harbor-panel-ui-workspaces-create" command="cmd_harborOpenWorkspaceCreation" image="chrome://browser/skin/harbor-icons/duplicate-tab.svg" />
  <menuitem data-l10n-id="harbor-panel-ui-folder-create" command="cmd_harborOpenFolderCreation" image="chrome://browser/skin/harbor-icons/folder.svg" />
  <menuseparator/>
  <menuitem data-l10n-id="harbor-panel-ui-new-empty-split" command="cmd_harborNewEmptySplit" image="chrome://browser/skin/harbor-icons/split.svg" />
  <menuitem data-l10n-id="tabs-toolbar-new-tab" command="cmd_newNavigatorTab" image="chrome://browser/skin/harbor-icons/plus.svg" />
</menupopup>

<menupopup id="harborWorkspaceMoreActions">
  <menuitem id="context_harborEditWorkspace" data-l10n-id="harbor-workspaces-panel-change-name" command="cmd_harborChangeWorkspaceName"/>
  <menuitem id="context_harborEditWorkspaceIcon" data-l10n-id="harbor-workspaces-panel-change-icon" command="cmd_harborChangeWorkspaceIcon"/>
  <menuitem class="harborToolbarThemePicker"
          id="context_harborChangeWorkspaceTheme"
          data-l10n-id="harbor-workspaces-change-theme"
          command="cmd_harborOpenHarborThemePicker"/>
  <menuseparator/>
  <menuitem id="context_harborSaveDockLayout" data-l10n-id="harbor-dock-layout-save" command="cmd_harborSaveDockLayout"/>
  <menuitem id="context_harborRestoreDockLayout" data-l10n-id="harbor-dock-layout-restore" command="cmd_harborRestoreDockLayout"/>
  <menuitem id="context_harborClearDockLayout" data-l10n-id="harbor-dock-layout-clear" command="cmd_harborClearDockLayout"/>
  <menu id="context_harborWorkspacesOpenInContainerTab"
    data-l10n-id="harbor-workspaces-panel-context-default-profile"
    selection-type="single"
    node-type="link"
    hide-if-private-browsing="true"
    hide-if-usercontext-disabled="true">
    <menupopup />
  </menu>
  <menuseparator id="context_harborWorkspacesSeparator"/>
  <menuseparator/>
  <menuitem id="context_harborReorderWorkspaces" data-l10n-id="harbor-workspaces-panel-context-reorder" command="cmd_harborReorderWorkspaces"/>
  <menuitem id="context_harborUnloadWorkspace" data-l10n-id="harbor-workspaces-panel-unload" command="cmd_harborUnloadWorkspace"/>
  <menuitem id="context_harborUnloadAllOtherWorkspace" data-l10n-id="harbor-workspaces-panel-unload-others" command="cmd_harborUnloadAllOtherWorkspace"/>
  <menuseparator/>
  <menuitem data-l10n-id="harbor-panel-ui-workspaces-create" command="cmd_harborOpenWorkspaceCreation"/>
  <menuitem id="context_harborShareWorkspace" data-l10n-id="harbor-share-space" command="cmd_harborCtxShareWorkspace"/>
  <menuitem id="context_harborDeleteWorkspace" data-l10n-id="harbor-workspaces-panel-context-delete" command="cmd_harborCtxDeleteWorkspace"/>
  <menuseparator/>
  <menuitem id="context_harborSpaceRoutingSettings" data-l10n-id="harbor-space-routing-settings" command="cmd_harborOpenSpaceRoutingSettings"/>
</menupopup>

<menupopup id="harborFolderActions">
  <menu id="context_harborLiveFolderOptions"
    data-l10n-id="harbor-live-folder-options"
    hidden="true">
    <menupopup />
  </menu>
  <menuseparator id="live-folder-separator" hidden="true"/>
  <menuitem id="context_harborFolderRename" data-l10n-id="harbor-folders-panel-rename-folder"/>
  <menuitem id="context_harborFolderChangeIcon" data-l10n-id="tab-context-harbor-edit-icon"/>
  <menuseparator />
  <menuitem id="context_harborFolderUnloadAll" data-l10n-id="harbor-folders-unload-folder"/>
  <menuitem id="context_harborFolderNewSubfolder" data-l10n-id="harbor-folders-new-subfolder"/>
  <menuseparator />
  <menu id="context_harborChangeFolderSpace"
    data-l10n-id="harbor-folders-panel-change-folder-space">
    <menupopup />
  </menu>
  <menuitem id="context_harborFolderToSpace" data-l10n-id="harbor-folders-panel-convert-folder-to-space" />
  <menuitem id="context_harborShareFolder" data-l10n-id="harbor-share-folder"/>
  <menuseparator />
  <menuitem id="context_harborFolderUnpack" data-l10n-id="harbor-folders-panel-unpack-folder"/>
  <menuitem id="context_harborFolderDelete" data-l10n-id="harbor-folders-panel-delete-folder"/>
</menupopup>

<menupopup id="harborSiteDataActions">
  <menuitem id="context_harborClearSiteData" data-l10n-id="identity-clear-site-data"/>
  <menuseparator />
  <menuitem command="Tools:Addons" data-l10n-id="harbor-site-data-manage-addons"/>
  <menuitem id="context_harborOpenGetAddons" data-l10n-id="harbor-site-data-get-addons"/>
  <menuseparator />
  <menuitem id="context_harborOpenSiteSettings" data-l10n-id="harbor-site-data-site-settings"/>
</menupopup>

<menupopup id="harborMoveTabsToSyncedWorkspacePopup">
# Popup to move tabs to a synced workspace.
# This would be automatically populated with the list of available synced workspaces.
</menupopup>
