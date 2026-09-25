# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Tabs rechts anzeigen
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompaktmodus
harbor-toolbar-context-compact-mode-enable = 
    .label = Kompaktmodus einschalten
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Nur Seitenleiste ausblenden
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Nur Symbolleiste ausblenden
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Beides ausblenden
    .accesskey = B
harbor-toolbar-context-move-to-folder = 
    .label = In Ordner verschieben...
    .accesskey = O
harbor-toolbar-context-new-folder = 
    .label = Neuer Ordner
    .accesskey = N
sidebar-harbor-expand = 
    .label = Seitenleiste ausklappen
sidebar-harbor-create-new = 
    .label = Neu erstellen...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Tab entladen und wechseln
           *[other] { $tabCount } Tabs entladen und zum ersten wechseln
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Tab zurücksetzen und anheften
           *[other] { $tabCount } Tabs zurücksetzen und anheften
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Zurück zur angehefteten URL
        [harbor-default-pinned-cmd] Vom angehefteten Tab lösen
       *[other] { $tabSubtitle }
    }
