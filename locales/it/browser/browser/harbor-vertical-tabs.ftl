# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Schede a destra
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Modalità compatta
harbor-toolbar-context-compact-mode-enable = 
    .label = Abilita modalità compatta
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Nascondi barra laterale
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Nascondi barra degli strumenti
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Nascondi entrambi
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nuova cartella
    .accesskey = N
sidebar-harbor-expand = 
    .label = Espandi barra laterale
sidebar-harbor-create-new = 
    .label = Crea nuova...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Scarica e passa alla scheda
           *[other] Scarica le { $tabCount } schede e passa alla prima
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Reimposta e fissa la scheda
           *[other] Reimposta e fissa le { $tabCount } schede
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Torna all'url bloccato
        [harbor-default-pinned-cmd] Separa dalla scheda bloccata
       *[other] { $tabSubtitle }
    }
