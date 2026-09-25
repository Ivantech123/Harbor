# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = nuværende profil
unified-extensions-description = Udvidelser bruges til at bringe ekstra funktionalitet ind i { -brand-short-name }.
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
    .label = Fjern fra Essentielle
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
harbor-themes-corrupted = Din { -brand-short-name } mods-fil er beskadiget. De er blevet nulstillet til standardtemaet.
harbor-shortcuts-corrupted = Din { -brand-short-name }-genvejsfil er beskadiget. De er blevet nulstillet til standardgenvejene.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Den nye URL-linje er aktiveret og fjerner dermed behovet for nye fanesider.<br/><br/>
    Prøv at åbne en ny fane for at se den i aktion!
harbor-disable = Deaktiver
pictureinpicture-minimize-btn = 
    .aria-label = Minimer
    .tooltip = Minimer
harbor-panel-ui-gradient-generator-custom-color = Brugerdefineret Farve
harbor-copy-current-url-confirmation = Kopieret nuværende URL!
harbor-copy-current-url-as-markdown-confirmation = Kopierede nuværende URL som Markdown!
harbor-general-cancel-label = 
    .label = Annuller
harbor-general-confirm = 
    .label = Bekræft
harbor-pinned-tab-replaced = Den fastgjorte fane-URL blev erstattet med den aktuelle.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Fanen blev omdøbt!
harbor-background-tab-opened-toast = Ny baggrundsfane åbnet!
harbor-workspace-renamed-toast = Arbejdsområde blev omdøbt!
harbor-split-view-limit-toast = Kan ikke tilføje flere paneler til denne delte visning!
harbor-toggle-compact-mode-button = 
    .label = Kompakt tilstand
    .tooltiptext = Kompakt tilstand til/fra

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Lær mere
harbor-close-label = Luk
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Søg...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Ikoner
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Handlinger
harbor-site-data-settings = Indstillinger
harbor-generic-manage = Administrer
harbor-generic-more = Mere
harbor-generic-next = Næste
harbor-essentials-promo-label = Add to Essentials
harbor-essentials-promo-sublabel = Hold dine yndlings faner et klik væk
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Tilladt
harbor-site-data-setting-block = Blokeret
harbor-site-data-protections-enabled = Aktiveret
harbor-site-data-protections-disabled = Deaktiveret
harbor-site-data-setting-cross-site = Cross-Site cookie
harbor-site-data-security-info-extension = 
    .label = Udvidelse
harbor-site-data-security-info-secure = 
    .label = Sikker
harbor-site-data-security-info-not-secure = 
    .label = Ikke sikker
harbor-site-data-manage-addons = 
    .label = Administrer udvidelser
harbor-site-data-get-addons = 
    .label = Tilføj udvidelser
harbor-site-data-site-settings = 
    .label = Alle Side Indstillinger
harbor-site-data-header-share = 
    .tooltiptext = Del Denne Side
harbor-site-data-header-reader-mode = 
    .tooltiptext = Åben Læsertilstand
harbor-site-data-header-screenshot = 
    .tooltiptext = Tag et Skærmbillede
harbor-site-data-header-bookmark = 
    .tooltiptext = Tilføj Side til Bogmærker
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopiér URL
harbor-site-data-setting-site-protection = Sporingsbeskyttelse

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Et nyt hjem for tilføjelser, tilladelser og mere
harbor-site-data-panel-feature-callout-subtitle = Klik ikonet for at administrere side indstillinger, se sikkerhedsoplysninger, tilgå udvidelser, og udføre almindelige handlinger.
harbor-open-link-in-glance = 
    .label = Open Link in Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Opdatering Fuldført!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Hvad er nyt i { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Se Udgivelsesnoter
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Noget der ikke virker?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Genstart i Beskyttet Tilstand
harbor-window-sync-migration-dialog-title = Hold Dine Vinduer Synkroniseret
harbor-window-sync-migration-dialog-message = Harbor synkroniserer nu vinduer på samme enhed, så ændringer i et vindue afspejles øjeblikkeligt på tværs af de andre.
harbor-window-sync-migration-dialog-learn-more = Lær Mere
harbor-window-sync-migration-dialog-accept = Forstået
harbor-appmenu-new-blank-window = 
    .label = Nyt tomt vindue
