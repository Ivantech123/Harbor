# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Välilehdet oikealla puolella
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompakti tila
harbor-toolbar-context-compact-mode-enable = 
    .label = Ota kompakti tila käyttöön
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Piilota sivupalkki
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Piilota työkalupalkki
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Piilota molemmat
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Uusi kansio
    .accesskey = N
sidebar-harbor-expand = 
    .label = Laajenna sivupalkkia
sidebar-harbor-create-new = 
    .label = Luo uusi...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Pura ja vaihda välilehteen
           *[other] Pura { $tabCount } välilehdet ja vaihda ensimmäiseen
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Nollaa ja kiinnitä välilehti
           *[other] Nollaa ja kiinnitä { $tabCount } välilehdet
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
       *[other] { $tabSubtitle }
    }
