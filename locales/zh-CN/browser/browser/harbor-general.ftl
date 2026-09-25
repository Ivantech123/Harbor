# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = 当前配置
unified-extensions-description = 扩展用于为 { -brand-short-name } 带来更多额外功能。
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] 重置常驻标签页
           *[false] 重置标签页
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = 添加到常驻标签页
    .accesskey = E
tab-context-harbor-add-essential-badge = 已使用 { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = 从常驻标签页中移除
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] 编辑常驻标签页
           *[false] 编辑固定标签页
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = 替换为当前 URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = 编辑…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = 更改标签…
tab-context-harbor-edit-icon = 
    .label = 更改图标…
harbor-themes-corrupted = 您的 { -brand-short-name } 模组文件已损坏。它们已重置为默认主题。
harbor-shortcuts-corrupted = 您的 { -brand-short-name } 快捷键文件已损坏。它们已重置为默认快捷键。
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification = 新的地址栏已启用，不再需要新标签页。<br/><br/>打开一个新标签页来试试看新地址栏！
harbor-disable = 禁用
pictureinpicture-minimize-btn = 
    .aria-label = 最小化
    .tooltip = 最小化
harbor-panel-ui-gradient-generator-custom-color = 自定义颜色
harbor-copy-current-url-confirmation = 网址已复制到剪贴板！
harbor-copy-current-url-as-markdown-confirmation = 已将当前网址复制为 Markdown 格式！
harbor-general-cancel-label = 
    .label = 取消
harbor-general-confirm = 
    .label = 确认
harbor-pinned-tab-replaced = 固定标签页的网址已更新为当前页面网址！
harbor-pinned-tab-url-edited = 固定标签页的 URL 已更新！
harbor-pinned-tab-url-invalid = URL 无效。
harbor-pinned-tab-edit-url-title = 编辑固定 URL
harbor-pinned-tab-edit-url-label = 请输入此固定标签页应指向的 URL：
harbor-tabs-renamed = 标签页重命名成功！
harbor-background-tab-opened-toast = 新的后台标签页已打开 ！
harbor-workspace-renamed-toast = 工作区重命名成功！
harbor-split-view-limit-toast = 无法在分屏视图中添加更多面板！
harbor-toggle-compact-mode-button = 
    .label = 简洁模式
    .tooltiptext = 切换简洁模式

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = 了解更多
harbor-close-label = 关闭
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = 搜索…
harbor-icons-picker-emoji = 
    .label = 表情符号
harbor-icons-picker-svg = 
    .label = 图标集
harbor-emojis-picker-search = 
    .placeholder = 搜索表情符号
urlbar-search-mode-zen_actions = 操作
harbor-site-data-settings = 设置
harbor-generic-manage = 管理
harbor-generic-more = 更多
harbor-generic-next = 下一步
harbor-essentials-promo-label = 添加到常驻标签页
harbor-essentials-promo-sublabel = 让您常用的标签页触手可及
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = 允许
harbor-site-data-setting-block = 阻止
harbor-site-data-protections-enabled = 开启
harbor-site-data-protections-disabled = 关闭
harbor-site-data-setting-cross-site = 跨站 Cookie
harbor-site-data-security-info-extension = 
    .label = 扩展
harbor-site-data-security-info-secure = 
    .label = 安全
harbor-site-data-security-info-not-secure = 
    .label = 不安全
harbor-site-data-manage-addons = 
    .label = 管理扩展
harbor-site-data-get-addons = 
    .label = 添加扩展
harbor-site-data-site-settings = 
    .label = 所有站点设置
harbor-site-data-header-share = 
    .tooltiptext = 分享此页面
harbor-site-data-header-reader-mode = 
    .tooltiptext = 进入阅读模式
harbor-site-data-header-screenshot = 
    .tooltiptext = 截图
harbor-site-data-header-bookmark = 
    .tooltiptext = 为此页面添加书签
harbor-urlbar-copy-url-button = 
    .tooltiptext = 复制链接
harbor-site-data-setting-site-protection = 跟踪保护

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = 附加组件、权限和各种功能的一站式界面
harbor-site-data-panel-feature-callout-subtitle = 点击图标以管理站点设置、查看安全信息、访问扩展，还可执行各种操作。
harbor-open-link-in-glance = 
    .label = 在浮窗预览中打开链接
    .accesskey = G
harbor-sidebar-notification-updated-heading = 更新完成！

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = 了解 { -brand-short-name } 的新版变化
harbor-sidebar-notification-updated-tooltip = 
    .title = 查看更新日志
harbor-sidebar-notification-donate-label = 支持 { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = 为此项目捐赠
harbor-sidebar-notification-restart-safe-mode-label = 出了什么问题吗？
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = 在排障模式下重启
harbor-window-sync-migration-dialog-title = 保持您的窗口同步
harbor-window-sync-migration-dialog-message = Harbor 现已支持同一设备上的窗口同步，一个窗口的更改将即时同步到其他窗口。
harbor-window-sync-migration-dialog-learn-more = 了解更多
harbor-window-sync-migration-dialog-accept = 知道了
harbor-appmenu-new-blank-window = 
    .label = 新建空白窗口
