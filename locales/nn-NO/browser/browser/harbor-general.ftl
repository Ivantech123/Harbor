# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = current profile
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
harbor-disable = Disable
pictureinpicture-minimize-btn = 
    .aria-label = Minimize
    .tooltip = Minimize
harbor-panel-ui-gradient-generator-custom-color = Custom Color
harbor-copy-current-url-confirmation = Copied current URL!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = Cancel
harbor-general-confirm = 
    .label = Confirm
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
    .label = Compact Mode
    .tooltiptext = Toggle Compact Mode

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Learn More
harbor-close-label = Close
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Search...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Icons
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Actions
harbor-site-data-settings = Settings
harbor-generic-manage = Manage
harbor-generic-more = More
harbor-generic-next = Next
harbor-essentials-promo-label = Add to Essentials
harbor-essentials-promo-sublabel = Keep your favorite tabs just a click away
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Allowed
harbor-site-data-setting-block = Blocked
harbor-site-data-protections-enabled = Enabled
harbor-site-data-protections-disabled = Disabled
harbor-site-data-setting-cross-site = Cross-Site cookie
harbor-site-data-security-info-extension = 
    .label = Extension
harbor-site-data-security-info-secure = 
    .label = Secure
harbor-site-data-security-info-not-secure = 
    .label = Not Secure
harbor-site-data-manage-addons = 
    .label = Manage Extensions
harbor-site-data-get-addons = 
    .label = Add Extensions
harbor-site-data-site-settings = 
    .label = All Site Settings
harbor-site-data-header-share = 
    .tooltiptext = Share This Page
harbor-site-data-header-reader-mode = 
    .tooltiptext = Enter Reader Mode
harbor-site-data-header-screenshot = 
    .tooltiptext = Take a Screenshot
harbor-site-data-header-bookmark = 
    .tooltiptext = Bookmark This Page
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copy URL
harbor-site-data-setting-site-protection = Tracking Protection

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = A new home for add-ons, permissions, and more
harbor-site-data-panel-feature-callout-subtitle = Click the icon to manage site settings, view security info, access extensions, and perform common actions.
harbor-open-link-in-glance = 
    .label = Open Link in Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Update Complete!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = What's new in { -brand-short-name }
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
