# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = praegune profiil
unified-extensions-description = Laiendusi kasutatakse täiendava funktsionaalsuse lisamiseks { -brand-short-name }i.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Essential Tab
           *[false] Reset Pinned Tab
        }
    .accesskey = p
tab-context-harbor-add-essential = 
    .label = Add to Essentials
    .accesskey = o
tab-context-harbor-add-essential-badge = { $num } / { $max } slots filled
tab-context-harbor-remove-essential = 
    .label = Eemalda olulistest
    .accesskey = o
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edit Essential URL
           *[false] Edit Pinned URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Replace with Current URL
    .accesskey = p
tab-context-harbor-edit-pinned-url = 
    .label = Edit…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Change Label...
tab-context-harbor-edit-icon = 
    .label = Change Icon...
harbor-themes-corrupted = Sinu { -brand-short-name } mods-ide fail on vigane. See on nüüd lähtestatud vaikimisi teemaks.
harbor-shortcuts-corrupted = Sinu { -brand-short-name } otseteede fail on vigane. See on nüüd lähtestatud vaikimisi otseteedeks.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Uus asukohariba on sisse lülitatud, mistõttu pole enam uue kaardi lehte tarvis.<br/><br/>
    Proovi avada uut kaarti, et näha uut asukohariba!
harbor-disable = Lülita välja
pictureinpicture-minimize-btn = 
    .aria-label = Minimeeri
    .tooltip = Minimeeri
harbor-panel-ui-gradient-generator-custom-color = Kohandatud värv
harbor-copy-current-url-confirmation = Copied current URL!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = Tühista
harbor-general-confirm = 
    .label = Kinnita
harbor-pinned-tab-replaced = Pinned tab URL has been replaced with the current URL.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Kaart on edukalt ümber nimetatud!
harbor-background-tab-opened-toast = Taustal avati uus kaart!
harbor-workspace-renamed-toast = Tööruum on edukalt ümber nimetatud!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Compact Mode
    .tooltiptext = Lülita kompaktne režiim sisse/välja

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Rohkem teavet
harbor-close-label = Sulge
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Otsi...
harbor-icons-picker-emoji = 
    .label = Emojid
harbor-icons-picker-svg = 
    .label = Ikoonid
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Tegevused
harbor-site-data-settings = Sätted
harbor-generic-manage = Halda
harbor-generic-more = Rohkem
harbor-generic-next = Next
harbor-essentials-promo-label = Add to Essentials
harbor-essentials-promo-sublabel = Keep your favorite tabs just a click away
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Lubatud
harbor-site-data-setting-block = Keelatud
harbor-site-data-protections-enabled = Enabled
harbor-site-data-protections-disabled = Disabled
harbor-site-data-setting-cross-site = Cross-Site cookie
harbor-site-data-security-info-extension = 
    .label = Laiendus
harbor-site-data-security-info-secure = 
    .label = Turvaline
harbor-site-data-security-info-not-secure = 
    .label = Ebaturvaline
harbor-site-data-manage-addons = 
    .label = Halda laiendusi
harbor-site-data-get-addons = 
    .label = Lisa laiendusi
harbor-site-data-site-settings = 
    .label = Kõik saidi sätted
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
