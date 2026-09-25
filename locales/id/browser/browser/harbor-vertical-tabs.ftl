# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Tab Di Sisi Kanan
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Mode Ringkas
harbor-toolbar-context-compact-mode-enable = 
    .label = Aktifkan Mode Ringkas
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Sembunyikan bilah sisi
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Sembunyikan bilah alat
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Sembunyikan keduanya
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Folder Baru
    .accesskey = N
sidebar-harbor-expand = 
    .label = Perluas Bilah Sisi
sidebar-harbor-create-new = 
    .label = Buat Baru...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Lepaskan dan pindah ke tab
           *[other] Lepaskan { $tabCount } tab dan pindah ke bawah
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Reset dan sematkan tab
           *[other] Reset dan sematkan { $tabCount } tab
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Kembali ke URL Awal
        [harbor-default-pinned-cmd] Pisahkan dari tab tersemat
       *[other] { $tabSubtitle }
    }
