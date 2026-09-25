# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Faner til højre
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompakt tilstand
harbor-toolbar-context-compact-mode-enable = 
    .label = Aktivér kompakt tilstand
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Skjul sidepanel
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Skjul værktøjslinje
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Skjul begge
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Ny mappe
    .accesskey = N
sidebar-harbor-expand = 
    .label = Udvid Sidepanel
sidebar-harbor-create-new = 
    .label = Opret ny...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Stop indlæsning og skift til fane
           *[other] Stop indlæsning af { $tabCount } faner og skift til den første
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Nulstil og fastgør fane
           *[other] Nulstil og fastgør { $tabCount } faner
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Tilbage til fastgjort url
        [harbor-default-pinned-cmd] Adskil fra fastgjort fane
       *[other] { $tabSubtitle }
    }
