# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = aktuálny profil
unified-extensions-description = Rozšírenia slúžia na pridanie ďalších funkcií do { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Essential Tab
           *[false] Reset Pinned Tab
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Pridať medzi hlavné
    .accesskey = E
tab-context-harbor-add-essential-badge = Využité pozície: { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Odstrániť z hlavných
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
    .label = Zmeniť Označenie...
tab-context-harbor-edit-icon = 
    .label = Zmeniť Ikonu...
harbor-themes-corrupted = Váš súbor módov { -brand-short-name } je poškodený. Témy boli resetované na predvolené.
harbor-shortcuts-corrupted = Váš súbor skratiek { -brand-short-name } je poškodený. Skratky boli resetované na predvolené.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification = Nový panel adries bol aktivovaný, takže stránky novej karty už nie sú potrebné.<br/><br/>Skúste otvoriť novú kartu a pozrite si nový panel adries v akcii!
harbor-disable = Zakázať
pictureinpicture-minimize-btn = 
    .aria-label = Minimalizovať
    .tooltip = Minimalizovať
harbor-panel-ui-gradient-generator-custom-color = Vlastná Farba
harbor-copy-current-url-confirmation = Aktuálna URL skopírovaná!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = Zrušiť
harbor-general-confirm = 
    .label = Potvrdiť
harbor-pinned-tab-replaced = URL pripnutej karty bola nahradená aktuálnou URL!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Karta bola úspešne premenovaná!
harbor-background-tab-opened-toast = Nová karta otvorená na pozadí!
harbor-workspace-renamed-toast = Pracovný priestor bol úspešne premenovaný!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Kompaktný Režim
    .tooltiptext = Prepnúť Kompaktný Režim

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Zistiť Viac
harbor-close-label = Zatvoriť
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Hľadať...
harbor-icons-picker-emoji = 
    .label = Emoji
harbor-icons-picker-svg = 
    .label = Ikony
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Akcie
harbor-site-data-settings = Nastavenia
harbor-generic-manage = Spravovať
harbor-generic-more = Viac
harbor-generic-next = Ďalšie
harbor-essentials-promo-label = Pridať do Hlavných
harbor-essentials-promo-sublabel = Majte svoje obľúbené karty na dosah jediným kliknutím
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Povolené
harbor-site-data-setting-block = Zablokované
harbor-site-data-protections-enabled = Zapnuté
harbor-site-data-protections-disabled = Vypnuté
harbor-site-data-setting-cross-site = Cookie tretích strán
harbor-site-data-security-info-extension = 
    .label = Rozšírenie
harbor-site-data-security-info-secure = 
    .label = Zabezpečené
harbor-site-data-security-info-not-secure = 
    .label = Nezabezpečené
harbor-site-data-manage-addons = 
    .label = Spravovať Rozšírenia
harbor-site-data-get-addons = 
    .label = Pridať Rozšírenia
harbor-site-data-site-settings = 
    .label = Všetky Nastavenia Webov
harbor-site-data-header-share = 
    .tooltiptext = Zdieľať Túto Stránku
harbor-site-data-header-reader-mode = 
    .tooltiptext = Prejsť do Režimu Čítačky
harbor-site-data-header-screenshot = 
    .tooltiptext = Vytvoriť Snímku Obrazovky
harbor-site-data-header-bookmark = 
    .tooltiptext = Pridať Túto Stránku k Záložkám
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopírovať URL adresu
harbor-site-data-setting-site-protection = Ochrana pred Sledovaním

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Nové miesto pre doplnky, povolenia a ďalšie funkcie
harbor-site-data-panel-feature-callout-subtitle = Kliknutím na túto ikonu môžete spravovať nastavenia webu, zobraziť informácie o zabezpečení, pristupovať k rozšíreniam a vykonávať bežné akcie.
harbor-open-link-in-glance = 
    .label = Otvoriť odkaz v Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Aktualizácia Dokončená!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Čo je nové v { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Zobraziť Poznámky k Vydaniu
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Niečo sa pokazilo?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Reštartovať v Núdzovom Režime
harbor-window-sync-migration-dialog-title = Majte svoje okná synchronizované
harbor-window-sync-migration-dialog-message = Harbor teraz synchronizuje okná v rámci jedného zariadenia, takže zmeny v jednom okne sa okamžite prejavia vo všetkých ostatných.
harbor-window-sync-migration-dialog-learn-more = Dozvedieť sa Viac
harbor-window-sync-migration-dialog-accept = Rozumiem
harbor-appmenu-new-blank-window = 
    .label = New blank window
