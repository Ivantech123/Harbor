# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Kaardid paremal
    .accesskey = p
harbor-toolbar-context-compact-mode = 
    .label = Kompaktne režiim
harbor-toolbar-context-compact-mode-enable = 
    .label = Luba kompaktne režiim
    .accesskey = r
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Peida külgriba
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Peida tööriistariba
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Peida mõlemad
    .accesskey = P
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Uus kaust
    .accesskey = U
sidebar-harbor-expand = 
    .label = Laienda külgriba
sidebar-harbor-create-new = 
    .label = Loo uus...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Eemalda mälust ning vaheta kaarti
           *[other] Eemalda mälust { $tabCount } kaarti ning vaheta esimesele kaardile
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Lähtesta ja tee püsikaardiks
           *[other] Lähtesta ja tee püsikaardiks { $tabCount } kaarti
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
       *[other] { $tabSubtitle }
    }
