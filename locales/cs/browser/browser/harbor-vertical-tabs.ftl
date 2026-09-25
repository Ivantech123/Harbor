# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Panely napravo
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompaktní režim
harbor-toolbar-context-compact-mode-enable = 
    .label = Povolit kompaktní režim
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Skrýt boční panel
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Skrýt panel nástrojů
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Skrýt obojí
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Přesunout do složky...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nová složka
    .accesskey = N
sidebar-harbor-expand = 
    .label = Zvětšit boční panel
sidebar-harbor-create-new = 
    .label = Vytvořit nový...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Uspat a přepnout na panel
            [few] Uspat { $tabCount } panely a přepnout na první
           *[other] Uspat { $tabCount } panelů a přepnout na první
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Resetovat a připnout kartu
            [few] Resetovat a připnout { $tabCount } panely
           *[other] Resetovat a připnout { $tabCount } panelů
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
       *[other] { $tabSubtitle }
    }
