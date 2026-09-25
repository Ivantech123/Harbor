# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = タブバーを右側に表示する
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = コンパクトモード
harbor-toolbar-context-compact-mode-enable = 
    .label = コンパクトモードを有効にする
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = サイドバーを隠す
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = ツールバーを隠す
harbor-toolbar-context-compact-mode-hide-both = 
    .label = サイドバーとツールバーを隠す
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = フォルダに移動する…
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = 新しいフォルダ
    .accesskey = N
sidebar-harbor-expand = 
    .label = サイドバーを展開する
sidebar-harbor-create-new = 
    .label = 新しく作成する…
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] タブをアンロードして切り替える
           *[other] { $tabCount }つタブをアンロードして最初タブに切り替える
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] タブをリセットして固定する
           *[other] タブをリセットして{ $tabCount }つのタブをピン留めする
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] ピン留めされた URL に戻る
        [harbor-default-pinned-cmd] ピン留めされたタブから切り離す
       *[other] { $tabSubtitle }
    }
