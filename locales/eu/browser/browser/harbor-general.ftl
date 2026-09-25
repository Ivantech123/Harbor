# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = oraingo profila
unified-extensions-description = Gehigarriek funtzioak eransten dizkiote { -brand-short-name }i.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Berrezarri Funtsezko Fitxa
           *[false] Berrezarri Ainguratutako Fitxa
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Funtsezko fitxetara Gehitu
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } hutsune beteta
tab-context-harbor-remove-essential = 
    .label = Funtsezko fitxetatik Kendu
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
    .label = Etiketa aldatu...
tab-context-harbor-edit-icon = 
    .label = Ikonoa aldatu...
harbor-themes-corrupted = Zure { -brand-short-name }eko mod-artxiboa kaltetuta dago. Lehenetsitako gaia berrezarri da.
harbor-shortcuts-corrupted = Zure { -brand-short-name }eko lasterbide-artxiboa kaltetuta dago. Lehenetsitako lasterbideak berrezarri dira.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    URL-barra berria gaitu da. Jada ez dira beharrezkoa fitxa berriak.<br/><br/>
    Saiatu fitxa berri bat zabaltzen URL-barra berria ikusteko!
harbor-disable = Desgaitu
pictureinpicture-minimize-btn = 
    .aria-label = Ikonotu
    .tooltip = Ikonotu
harbor-panel-ui-gradient-generator-custom-color = Neurrirako kolorea
harbor-copy-current-url-confirmation = Oraingo esteka kopiatu da!
harbor-copy-current-url-as-markdown-confirmation = Oraingo esteka kopiatu da Markdown gisa!
harbor-general-cancel-label = 
    .label = Ezeztatu
harbor-general-confirm = 
    .label = Baieztatu
harbor-pinned-tab-replaced = Oraingo estekak ordezkatu du ainguratutako fitxarena!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Fitxaren izena ongi aldatu da!
harbor-background-tab-opened-toast = Fitxa berri bat zabaldu da bigarren planoan!
harbor-workspace-renamed-toast = Lan-eremuaren izena ongi aldatu da!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Modu Trinkoa
    .tooltiptext = Modu Trinkoa Aktibatu/Desaktibatu

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Gehiago ikasi
harbor-close-label = Itxi
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Bilatu...
harbor-icons-picker-emoji = 
    .label = Emojiak
harbor-icons-picker-svg = 
    .label = Ikonoak
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Ekintzak
harbor-site-data-settings = Ezarpenak
harbor-generic-manage = Kudeatu
harbor-generic-more = Gehiago
harbor-generic-next = Hurrengoa
harbor-essentials-promo-label = Funtsezkoetara Gehitu
harbor-essentials-promo-sublabel = Izan zure fitxa gogokoenak klik bakar batera
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Baimenduta
harbor-site-data-setting-block = Blokeatuta
harbor-site-data-protections-enabled = Gaituta
harbor-site-data-protections-disabled = Ezgaituta
harbor-site-data-setting-cross-site = Bitartekoen cookieak
harbor-site-data-security-info-extension = 
    .label = Gehigarria
harbor-site-data-security-info-secure = 
    .label = Segurua
harbor-site-data-security-info-not-secure = 
    .label = Ez segurua
harbor-site-data-manage-addons = 
    .label = Gehigarriak Kudeatu
harbor-site-data-get-addons = 
    .label = Gehigarriak Erantsi
harbor-site-data-site-settings = 
    .label = Webgunearen Ezarpen Guztiak
harbor-site-data-header-share = 
    .tooltiptext = Orri Hau Partekatu
harbor-site-data-header-reader-mode = 
    .tooltiptext = Irakurle-moduan Sartu
harbor-site-data-header-screenshot = 
    .tooltiptext = Pantaila-argazkia Atera
harbor-site-data-header-bookmark = 
    .tooltiptext = Gehitu Orria Laster-marketara
harbor-urlbar-copy-url-button = 
    .tooltiptext = Esteka Kopiatu
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
