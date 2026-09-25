# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Καρτέλες στα δεξιά
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Συμπαγής λειτουργία
harbor-toolbar-context-compact-mode-enable = 
    .label = Ενεργοποίηση συμπαγούς λειτουργίας
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Απόκρυψη πλαϊνής γραμμής
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Απόκρυψη γραμμής εργαλείων
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Απόκρυψη όλων
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Δημιουργία Φακέλου
    .accesskey = N
sidebar-harbor-expand = 
    .label = Επέκταση Πλαϊνής στήλης
sidebar-harbor-create-new = 
    .label = Δημιουργία Νέας...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Εκφόρτωση και μετάβαση στην καρτέλα
           *[other] Εκφόρτωση { $tabCount } καρτελών και μετάβαση στην πρώτη
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Επαναφορά και καρφίτσωμα καρτέλας
           *[other] Επαναφορά και καρφίτσωμα { $tabCount } καρτελών
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Πίσω στην καρφιτσωμένη διεύθυνσή
        [harbor-default-pinned-cmd] Διαχωρισμός από την καρφιτσωμένη καρτέλα
       *[other] { $tabSubtitle }
    }
