# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Karty vpravo
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompaktný Režim
harbor-toolbar-context-compact-mode-enable = 
    .label = Povoliť kompaktný režim
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Skryť bočný panel
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Skryť panel nástrojov
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Skryť oboje
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nový Priečinok
    .accesskey = N
sidebar-harbor-expand = 
    .label = Rozšíriť Bočný Panel
sidebar-harbor-create-new = 
    .label = Vytvoriť nové...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Uvoľniť z pamäte a prepnúť na kartu
            [few] Uvoľniť { $tabCount } karty z pamäte a prepnúť na prvú
           *[other] Uvoľniť { $tabCount } kariet z pamäte a prepnúť na prvú
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Resetovať a pripnúť kartu
            [few] Resetovať a pripnúť { $tabCount } karty
           *[other] Resetovať a pripnúť { $tabCount } kariet
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
       *[other] { $tabSubtitle }
    }
