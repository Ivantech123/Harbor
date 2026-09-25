# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

tab-harbor-split-tabs = 
    .label =
        { $tabCount ->
            [-1] 分割タブ
            [1] 分割ビューを追加...
           *[other] { $tabCount } 個のタブを結合するs
        }
    .accesskey = S
harbor-split-link = 
    .label = リンクを新しいタブに分割する
    .accesskey = S
harbor-split-view-modifier-header = 分割表示
harbor-split-view-modifier-activate-reallocation = 
    .label = 再配置を有効にする
