# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = โปรไฟล์ปัจจุบัน
unified-extensions-description = Extensions are used to bring more extra functionality into { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Essential Tab
           *[false] Reset Pinned Tab
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Add to Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } slots filled
tab-context-harbor-remove-essential = 
    .label = Remove from Essentials
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
    .label = Change Label...
tab-context-harbor-edit-icon = 
    .label = Change Icon...
harbor-themes-corrupted = Your { -brand-short-name } mods file is corrupted. They have been reset to the default theme.
harbor-shortcuts-corrupted = Your { -brand-short-name } shortcuts file is corrupted. They have been reset to the default shortcuts.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    The new URL bar has been enabled, removing the need for new tab pages.<br/><br/>
    Try opening a new tab to see the new URL bar in action!
harbor-disable = ปิดใช้งาน
pictureinpicture-minimize-btn = 
    .aria-label = ย่อ
    .tooltip = ย่อ
harbor-panel-ui-gradient-generator-custom-color = เลือกสีเอง
harbor-copy-current-url-confirmation = คัดลอก URL ปัจจุบันแล้ว!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = ยกเลิก
harbor-general-confirm = 
    .label = ยืนยัน
harbor-pinned-tab-replaced = Pinned tab URL has been replaced with the current URL.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Tab has been successfully renamed!
harbor-background-tab-opened-toast = New background tab opened!
harbor-workspace-renamed-toast = Workspace has been successfully renamed!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = โหมดกะทัดรัด
    .tooltiptext = Toggle Compact Mode

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = เรียนรู้เพิ่มเติม
harbor-close-label = ปิด
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = ค้นหา...
harbor-icons-picker-emoji = 
    .label = อิโมจิ
harbor-icons-picker-svg = 
    .label = ไอคอน
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Actions
harbor-site-data-settings = การตั้งค่า
harbor-generic-manage = จัดการ
harbor-generic-more = เพิ่มเติม
harbor-generic-next = ถัดไป
harbor-essentials-promo-label = Add to Essentials
harbor-essentials-promo-sublabel = Keep your favorite tabs just a click away
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = อนุญาต
harbor-site-data-setting-block = ถูกบล็อก
harbor-site-data-protections-enabled = เปิดใช้งานอยู่
harbor-site-data-protections-disabled = ปิดใช้งานอยู่
harbor-site-data-setting-cross-site = Cross-Site cookie
harbor-site-data-security-info-extension = 
    .label = ส่วนขยาย
harbor-site-data-security-info-secure = 
    .label = ปลอดภัย
harbor-site-data-security-info-not-secure = 
    .label = ไม่ปลอดภัย
harbor-site-data-manage-addons = 
    .label = จัดการส่วนขยาย
harbor-site-data-get-addons = 
    .label = เพิ่มส่วนขยาย
harbor-site-data-site-settings = 
    .label = All Site Settings
harbor-site-data-header-share = 
    .tooltiptext = แชร์หน้านี้
harbor-site-data-header-reader-mode = 
    .tooltiptext = Enter Reader Mode
harbor-site-data-header-screenshot = 
    .tooltiptext = ถ่ายภาพหน้าจอ
harbor-site-data-header-bookmark = 
    .tooltiptext = Bookmark This Page
harbor-urlbar-copy-url-button = 
    .tooltiptext = คัดลอก URL
harbor-site-data-setting-site-protection = การป้องกันการติดตาม

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = A new home for add-ons, permissions, and more
harbor-site-data-panel-feature-callout-subtitle = Click the icon to manage site settings, view security info, access extensions, and perform common actions.
harbor-open-link-in-glance = 
    .label = Open Link in Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = อัปเดตเสร็จสมบูรณ์แล้ว!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = มีอะไรใหม่ใน { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = View Release Notes
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Something broke?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Restart in Safe Mode
harbor-window-sync-migration-dialog-title = Keep Your Windows in Sync
harbor-window-sync-migration-dialog-message = Harbor now syncs windows on the same device, so changes in one window are reflected across the others instantly.
harbor-window-sync-migration-dialog-learn-more = Learn More
harbor-window-sync-migration-dialog-accept = Got It
harbor-appmenu-new-blank-window = 
    .label = New blank window
