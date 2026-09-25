# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = nykyinen profiili
unified-extensions-description = Laajennuksia käytetään tuomaan enemmän ylimääräisiä toimintoja { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Essential Tab
           *[false] Reset Pinned Tab
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Lisää olennaisiin
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } täytetty paikka
tab-context-harbor-remove-essential = 
    .label = Poista olennaisista
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
harbor-themes-corrupted = { -brand-short-name } modejasi tiedosto on vioittunut. Ne on palautettu oletusteemaan.
harbor-shortcuts-corrupted = { -brand-short-name } Oikotietä sisältävä tiedosto on korruptoitunut. Ne on palautettu oletus oikoteihin.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Uusi URL-palkki on otettu käyttöön, uusia välilehtisivuja ei enää tarvita.<br/><br/>
    Kokeile avata uusi välilehti nähdäksesi uuden URL-palkin toiminnassa!
harbor-disable = Poista käytöstä
pictureinpicture-minimize-btn = 
    .aria-label = Minimoi
    .tooltip = Minimoi
harbor-panel-ui-gradient-generator-custom-color = Muokattu Väri
harbor-copy-current-url-confirmation = Nykyinen URL-osoite kopioitu!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = Peruuta
harbor-general-confirm = 
    .label = Vahvista
harbor-pinned-tab-replaced = Pinned tab URL has been replaced with the current URL.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Välilehti on nimetty uudelleen!
harbor-background-tab-opened-toast = Uusi taustavälilehti avattu!
harbor-workspace-renamed-toast = Työtila on nimetty uudelleen!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Kompakti Tila
    .tooltiptext = Ota käyttöön Kompakti tila

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Lue Lisää
harbor-close-label = Sulje
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Hae...
harbor-icons-picker-emoji = 
    .label = Emojit
harbor-icons-picker-svg = 
    .label = Kuvakkeet
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Toiminnot
harbor-site-data-settings = Asetukset
harbor-generic-manage = Hallitse
harbor-generic-more = Lisää
harbor-generic-next = Seuraava
harbor-essentials-promo-label = Add to Essentials
harbor-essentials-promo-sublabel = Keep your favorite tabs just a click away
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Sallittu
harbor-site-data-setting-block = Estetty
harbor-site-data-protections-enabled = Käytössä
harbor-site-data-protections-disabled = Pois käytöstä
harbor-site-data-setting-cross-site = Sivuston välinen eväste
harbor-site-data-security-info-extension = 
    .label = Laajennus
harbor-site-data-security-info-secure = 
    .label = Turvallinen
harbor-site-data-security-info-not-secure = 
    .label = Ei turvallinen
harbor-site-data-manage-addons = 
    .label = Hallita Laajennuksia
harbor-site-data-get-addons = 
    .label = Lisää Laajennuksia
harbor-site-data-site-settings = 
    .label = Kaikki Sivuston Asetukset
harbor-site-data-header-share = 
    .tooltiptext = Jaa Tämä Sivu
harbor-site-data-header-reader-mode = 
    .tooltiptext = Siirry lukutilaan
harbor-site-data-header-screenshot = 
    .tooltiptext = Ota kuvakaappaus
harbor-site-data-header-bookmark = 
    .tooltiptext = Lisää Tämä Sivu Kirjanmerkkeihin
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopioi URL
harbor-site-data-setting-site-protection = Seuranta Suojaus

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Uusi koti lisäosille, käyttöoikeuksille ja paljon muuta
harbor-site-data-panel-feature-callout-subtitle = Klikkaa kuvaketta hallitaksesi sivuston asetuksia, tarkastella tietoturvatietoja, käyttää laajennuksia ja suorittaa yhteisiä toimintoja.
harbor-open-link-in-glance = 
    .label = Avaa linkki vilkaisussa
    .accesskey = G
harbor-sidebar-notification-updated-heading = Päivitys valmis!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Mitä uutta { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Katso Julkaisutiedot
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Jotain rikki?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Käynnistä uudelleen vianmääritystilassa
harbor-window-sync-migration-dialog-title = Keep Your Windows in Sync
harbor-window-sync-migration-dialog-message = Harbor now syncs windows on the same device, so changes in one window are reflected across the others instantly.
harbor-window-sync-migration-dialog-learn-more = Learn More
harbor-window-sync-migration-dialog-accept = Got It
harbor-appmenu-new-blank-window = 
    .label = New blank window
