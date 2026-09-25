# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Flikar till höger
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompakt läge
harbor-toolbar-context-compact-mode-enable = 
    .label = Aktivera kompakt läge
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Dölj sidofält
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Dölj verktygsfältet
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Dölj båda
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Flytta till mapp...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Ny mapp
    .accesskey = N
sidebar-harbor-expand = 
    .label = Expandera sidofält
sidebar-harbor-create-new = 
    .label = Skapa ny...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Frigör och växla till flik
           *[other] Frigör { $tabCount } flikar och byt till den första
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Återställ och fäst flik
           *[other] Återställ och fäst { $tabCount } flikar
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Tillbaka till den fästa webbadressen
        [harbor-default-pinned-cmd] Separera från den fästa fliken
       *[other] { $tabSubtitle }
    }
