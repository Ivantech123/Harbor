# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right =
    .label = Tabs on the right
    .accesskey = R

harbor-toolbar-context-compact-mode =
    .label = Compact Mode
harbor-toolbar-context-compact-mode-enable =
    .label = Enable compact mode
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs =
    .label = Hide sidebar
harbor-toolbar-context-compact-mode-just-toolbar =
    .label = Hide toolbar
harbor-toolbar-context-compact-mode-hide-both =
    .label = Hide both
    .accesskey = H

harbor-toolbar-context-move-to-folder =
    .label = Move to Folder
    .accesskey = M

harbor-toolbar-context-new-folder =
    .label = New Folder
    .accesskey = N

sidebar-harbor-expand =
  .label = Expand Sidebar

sidebar-harbor-create-new =
  .label = Create New

tabbrowser-unload-tab-button =
.tooltiptext =
    { $tabCount ->
        [one] Unload and switch to tab
        *[other] Unload { $tabCount } tabs and switch to the first
    }

tabbrowser-reset-pin-button =
.tooltiptext =
    { $tabCount ->
        [one] Reset and pin tab
        *[other] Reset and pin { $tabCount } tabs
    }

harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
        *[other] { $tabSubtitle }
    }
