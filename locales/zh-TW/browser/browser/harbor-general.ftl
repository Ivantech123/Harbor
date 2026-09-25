# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = 當前設定檔
unified-extensions-description = 擴充功能可為 { -brand-short-name } 帶來更多額外功能。
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] 重置Essentials
           *[false] 重置釘選分頁
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = 新增至 Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = 從 Essentials 中移除
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
    .label = 重新命名
tab-context-harbor-edit-icon = 
    .label = 變更圖示
harbor-themes-corrupted = 你的 { -brand-short-name } 模組文件已損壞，它們已重設為預設主題。
harbor-shortcuts-corrupted = 你的 { -brand-short-name } 快捷鍵文件已損壞。已被重設為預設值。
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification = 新的 URL 欄已啟用，你不再需要新增新分頁。<br/><br/>馬上打開新分頁來看看新的 URL 欄！
harbor-disable = 停用
pictureinpicture-minimize-btn = 
    .aria-label = 最小化
    .tooltip = 最小化
harbor-panel-ui-gradient-generator-custom-color = 自訂顏色
harbor-copy-current-url-confirmation = 網址已複製到剪貼簿！
harbor-copy-current-url-as-markdown-confirmation = 已以Markdown格式複製當前網址！
harbor-general-cancel-label = 
    .label = 取消
harbor-general-confirm = 
    .label = 確認
harbor-pinned-tab-replaced = 釘選分頁網址已替換為當前網址！
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = 成功重新命名分頁！
harbor-background-tab-opened-toast = 新分頁已在背景開啟！
harbor-workspace-renamed-toast = 成功重新命名工作區！
harbor-split-view-limit-toast = 無法加入更多分頁至分割畫面！
harbor-toggle-compact-mode-button = 
    .label = 緊湊模式
    .tooltiptext = 切換緊湊模式

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = 瞭解更多
harbor-close-label = 關閉
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = 搜尋…
harbor-icons-picker-emoji = 
    .label = 表情符號
harbor-icons-picker-svg = 
    .label = 圖示
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = 操作
harbor-site-data-settings = 設定
harbor-generic-manage = 管理
harbor-generic-more = 更多
harbor-generic-next = 下一個
harbor-essentials-promo-label = 新增至 Essentials
harbor-essentials-promo-sublabel = 僅需點擊一下就能切換至您的心儀分頁
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = 允許
harbor-site-data-setting-block = 已封鎖
harbor-site-data-protections-enabled = 已啟用
harbor-site-data-protections-disabled = 已停用
harbor-site-data-setting-cross-site = 跨站 cookie
harbor-site-data-security-info-extension = 
    .label = 擴充套件
harbor-site-data-security-info-secure = 
    .label = 安全
harbor-site-data-security-info-not-secure = 
    .label = 不安全
harbor-site-data-manage-addons = 
    .label = 管理擴充套件
harbor-site-data-get-addons = 
    .label = 新增擴充套件
harbor-site-data-site-settings = 
    .label = 全部網站的設定
harbor-site-data-header-share = 
    .tooltiptext = 分享此頁面
harbor-site-data-header-reader-mode = 
    .tooltiptext = 進入閱讀模式
harbor-site-data-header-screenshot = 
    .tooltiptext = 擷取螢幕
harbor-site-data-header-bookmark = 
    .tooltiptext = 將此頁加入書籤
harbor-urlbar-copy-url-button = 
    .tooltiptext = 複製網址
harbor-site-data-setting-site-protection = 追蹤器保護

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = 擴充套件、權限管理與其他功能的新家
harbor-site-data-panel-feature-callout-subtitle = 按這個圖示來管理網站設定、查看安全性資訊、存取擴充套件與執行基本動作。
harbor-open-link-in-glance = 
    .label = 在 Glance 內開啟連結
    .accesskey = G
harbor-sidebar-notification-updated-heading = 更新成功！

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = { -brand-short-name } 更新了什麼
harbor-sidebar-notification-updated-tooltip = 
    .title = 查看版本資訊
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = 有東西壞掉了嗎？
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = 在安全模式下重新啟動
harbor-window-sync-migration-dialog-title = 讓您的視窗處於同步狀態
harbor-window-sync-migration-dialog-message = Harbor現在能同步同裝置上的各個視窗，在某一視窗上的變動將會立即在其它視窗上反映出來。
harbor-window-sync-migration-dialog-learn-more = 了解更多
harbor-window-sync-migration-dialog-accept = 明白了
harbor-appmenu-new-blank-window = 
    .label = 開新簡白視窗
