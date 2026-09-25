# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

tab-harbor-split-tabs = 
    .label =
        { $tabCount ->
            [-1] Išskaidyti kortelę
            [1] Įtraukti skaidymo rodinį
            [one] Sujungti { $tabCount } kortelę
            [few] Sujungti { $tabCount } korteles
            [many] Sujungti { $tabCount } kortelės
           *[other] Sujungti { $tabCount } kortelių
        }
    .accesskey = S
harbor-split-link = 
    .label = Skaidyti nuorodą į naują kortelę
    .accesskey = S
harbor-split-view-modifier-header = Skaidymo rodinys
harbor-split-view-modifier-activate-reallocation = 
    .label = Aktyvuoti perskyrimą
