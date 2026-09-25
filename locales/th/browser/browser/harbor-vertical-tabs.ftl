# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = แท็บทางด้านขวา
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = โหมดกะทัดรัด
harbor-toolbar-context-compact-mode-enable = 
    .label = เปิดใช้โหมดกะทัดรัด
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = ซ่อนแถบด้านข้าง
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = ซ่อนแถบเครื่องมือ
harbor-toolbar-context-compact-mode-hide-both = 
    .label = ซ่อนทั้งคู่
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Move to Folder...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = สร้างโฟลเดอร์ใหม่
    .accesskey = N
sidebar-harbor-expand = 
    .label = ขยายแถบด้านข้าง
sidebar-harbor-create-new = 
    .label = สร้างใหม่...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Unload and switch to tab
           *[other] Unload { $tabCount } tabs and switch to the first
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Reset and pin tab
           *[other] Reset and pin { $tabCount } tabs
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Back to pinned url
        [harbor-default-pinned-cmd] Separate from pinned tab
       *[other] { $tabSubtitle }
    }
