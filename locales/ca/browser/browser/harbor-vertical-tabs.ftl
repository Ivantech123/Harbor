# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Pestanyes a la dreta
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Mode compacte
harbor-toolbar-context-compact-mode-enable = 
    .label = Habilita el mode compacte
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Amaga la barra lateral
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Amaga la barra d'eines
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Amaga les dues
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Mou a la carpeta...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Carpeta nova
    .accesskey = N
sidebar-harbor-expand = 
    .label = Expandeix la barra lateral
sidebar-harbor-create-new = 
    .label = Crea una nova...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Hiberna i canvia a la pestanya
           *[other] Hiberna { $tabCount } pestanyes i canvia a la primera
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Restableix i fixa la pestanya
           *[other] Restableix i fixa les { $tabCount } pestanyes
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Torna a l'URL fixat
        [harbor-default-pinned-cmd] Separa de la pestanya fixada
       *[other] { $tabSubtitle }
    }
