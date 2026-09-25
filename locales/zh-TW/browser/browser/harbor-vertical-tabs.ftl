# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = 右側分頁欄
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = 緊湊模式
harbor-toolbar-context-compact-mode-enable = 
    .label = 開啟緊湊模式
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = 隱藏側邊欄
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = 隱藏工具列
harbor-toolbar-context-compact-mode-hide-both = 
    .label = 兩者皆隱藏
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = 移至分頁夾...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = 新增分頁夾
    .accesskey = N
sidebar-harbor-expand = 
    .label = 展開側邊欄
sidebar-harbor-create-new = 
    .label = 新增...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] 關閉並切換到此分頁
           *[other] 關閉 { $tabCount } 個分頁並切換到第一個分頁
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] 重設並釘選分頁
           *[other] 重設並釘選 { $tabCount } 個分頁
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] 回歸為原釘選網址
        [harbor-default-pinned-cmd] 劃分為另一分頁
       *[other] { $tabSubtitle }
    }
