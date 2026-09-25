# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Karty po prawej
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Tryb kompaktowy
harbor-toolbar-context-compact-mode-enable = 
    .label = Włącz tryb kompaktowy
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Ukryj panel boczny
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Ukryj pasek narzędzi
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Ukryj oba
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Przenieś do folderu...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nowy folder
    .accesskey = N
sidebar-harbor-expand = 
    .label = Rozwiń panel boczny
sidebar-harbor-create-new = 
    .label = Utwórz nową...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Wyładuj i przełącz na kartę
            [few] Wyładuj { $tabCount } karty i przełącz na pierwszą
           *[other] Wyładuj { $tabCount } kart i przełącz na pierwszą
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Zresetuj i przypnij kartę
            [few] Zresetuj i przypnij { $tabCount } karty
           *[other] Zresetuj i przypnij { $tabCount } kart
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Cofnij do przypiętego adresu URL
        [harbor-default-pinned-cmd] Oddziel od przypiętej karty
       *[other] { $tabSubtitle }
    }
