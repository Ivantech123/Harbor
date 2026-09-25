# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Kortelės dešinėje
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Kompaktinis režimas
harbor-toolbar-context-compact-mode-enable = 
    .label = Įjungti kompaktinį režimą
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Slėpti šoninę juostą
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Slėpti įrankių juostą
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Slėpti abi
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Perkelti į aplanką...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Naujas aplankas
    .accesskey = N
sidebar-harbor-expand = 
    .label = Išskleisti šoninę juostą
sidebar-harbor-create-new = 
    .label = Kurti naują...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Iškelti { $tabCount } kortelę ir perjungti į pirmąją
            [few] Iškelti { $tabCount } korteles ir perjungti į pirmąją
            [many] Iškelti { $tabCount } kortelės ir perjungti į pirmąją
           *[other] Iškelti { $tabCount } kortelių ir perjungti į pirmąją
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Atkurti ir prisegti { $tabCount } kortelę
            [few] Atkurti ir prisegti { $tabCount } korteles
            [many] Atkurti ir prisegti { $tabCount } kortelės
           *[other] Atkurti ir prisegti { $tabCount } kortelių
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Atgal į prisegtą URL
        [harbor-default-pinned-cmd] Atskirti nuo prisegtos kortelės
       *[other] { $tabSubtitle }
    }
