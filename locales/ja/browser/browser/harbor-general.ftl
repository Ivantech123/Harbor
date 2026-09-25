# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = 使用中のプロファイル
unified-extensions-description = 拡張機能は{ -brand-short-name }に多く追加機能をもたらすために使用されます。
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Essentialタブの遷移をリセット
           *[false] ピン留めされたタブの遷移をリセット
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Essentialsに追加
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }スロットがいっぱいです
tab-context-harbor-remove-essential = 
    .label = Essentialsから削除
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edit Essential URL
           *[false] Edit Pinned URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Replace with Current URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Edit…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = ラベルを変更する...
tab-context-harbor-edit-icon = 
    .label = アイコンを変更する...
harbor-themes-corrupted = { -brand-short-name }モッドファイルが文字化けしています。デフォルトのテーマにリセットされました。
harbor-shortcuts-corrupted = { -brand-short-name }ショートカットファイルが文字化けしています。デフォルトのショートカットにリセットされました。
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    新しいURLバーが有効になり、新しいタブページの必要性がなくなりました。<br/><br/>
    新しいタブを開いて、新しいURLバーを表示してみてください！
harbor-disable = 無効
pictureinpicture-minimize-btn = 
    .aria-label = 最小化
    .tooltip = 最小化
harbor-panel-ui-gradient-generator-custom-color = カスタムカラー
harbor-copy-current-url-confirmation = URLをクリップボードにコピーしました！
harbor-copy-current-url-as-markdown-confirmation = URLをMarkdownとしてコピーしました！
harbor-general-cancel-label = 
    .label = キャンセル
harbor-general-confirm = 
    .label = 確定
harbor-pinned-tab-replaced = 固定したタブのURLが現在のURLに置き換えられました！
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = タブの名前は無事に変更されました！
harbor-background-tab-opened-toast = 新しい背景タブが開きました！
harbor-workspace-renamed-toast = ワークスペースの名前が変更されました！
harbor-split-view-limit-toast = 分割ビューにこれ以上パネルを追加できません！
harbor-toggle-compact-mode-button = 
    .label = コンパクトモード
    .tooltiptext = コンパクトモードの切り替え

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = もっと詳しく知る
harbor-close-label = 閉じる
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = 検索…
harbor-icons-picker-emoji = 
    .label = 絵文字
harbor-icons-picker-svg = 
    .label = アイコン
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = アクション
harbor-site-data-settings = 設定
harbor-generic-manage = 管理
harbor-generic-more = その他
harbor-generic-next = 次へ
harbor-essentials-promo-label = Essentialsに追加
harbor-essentials-promo-sublabel = お気に入りのタブをワンクリックで表示
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = 許可済み
harbor-site-data-setting-block = ブロック済み
harbor-site-data-protections-enabled = 有効
harbor-site-data-protections-disabled = 無効
harbor-site-data-setting-cross-site = クロスサイトクッキー
harbor-site-data-security-info-extension = 
    .label = 拡張機能
harbor-site-data-security-info-secure = 
    .label = 保護されています
harbor-site-data-security-info-not-secure = 
    .label = 保護されていません
harbor-site-data-manage-addons = 
    .label = 拡張機能を管理
harbor-site-data-get-addons = 
    .label = 拡張機能を追加
harbor-site-data-site-settings = 
    .label = すべてのサイト設定
harbor-site-data-header-share = 
    .tooltiptext = このページをシェアする
harbor-site-data-header-reader-mode = 
    .tooltiptext = リーダーモードにする
harbor-site-data-header-screenshot = 
    .tooltiptext = スクリーンショットを撮る
harbor-site-data-header-bookmark = 
    .tooltiptext = このページをブックマークに登録する
harbor-urlbar-copy-url-button = 
    .tooltiptext = URLをコピーする
harbor-site-data-setting-site-protection = トラッキング保護

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = アドオン、権限などの新しいホーム
harbor-site-data-panel-feature-callout-subtitle = アイコンをクリックすると、サイト設定の管理、セキュリティ情報の表示、拡張機能へのアクセス、一般的なアクションが行えます。
harbor-open-link-in-glance = 
    .label = Glanceでリンクを開く
    .accesskey = G
harbor-sidebar-notification-updated-heading = アップデートが完了しました！

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = { -brand-short-name }の新機能
harbor-sidebar-notification-updated-tooltip = 
    .title = リリースノートを表示する
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = 何か壊れましたか？
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = セーフモードで再起動する
harbor-window-sync-migration-dialog-title = Windowsとの同期を維持
harbor-window-sync-migration-dialog-message = Harborは同一デバイス内のウィンドウを同期するようになり、１つのウィンドウでの操作が、他のウィンドウに、即座に反映されます。
harbor-window-sync-migration-dialog-learn-more = もっと詳しく
harbor-window-sync-migration-dialog-accept = わかりました
harbor-appmenu-new-blank-window = 
    .label = 新しい空のウィンドウ
