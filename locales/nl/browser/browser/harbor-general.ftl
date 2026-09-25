# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = huidig profiel
unified-extensions-description = Extensies worden gebruikt om extra functionaliteit toe te voegen aan { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Essential-tabblad herstellen
           *[false] Vastgezet tabblad herstellen
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Toevoegen aan Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } plekken bezet
tab-context-harbor-remove-essential = 
    .label = Verwijderen uit Essentials
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
    .label = Naam veranderen...
tab-context-harbor-edit-icon = 
    .label = Icoon veranderen...
harbor-themes-corrupted = Je { -brand-short-name } mods bestand is beschadigd. Ze zijn gereset naar het standaard thema.
harbor-shortcuts-corrupted = Je { -brand-short-name } snelkoppelingsbestand is beschadigd. Ze zijn gereset naar de standaard snelkoppelingen.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    De nieuwe URL-balk is ingeschakeld, waardoor nieuwe tabbladen niet meer nodig zijn.<br/><br/>
    Probeer een nieuw tabblad te openen om de nieuwe URL-balk in actie te zien!
harbor-disable = Uitschakelen
pictureinpicture-minimize-btn = 
    .aria-label = Minimaliseren
    .tooltip = Minimaliseren
harbor-panel-ui-gradient-generator-custom-color = Aangepaste kleur
harbor-copy-current-url-confirmation = Huidige URL gekopieerd!
harbor-copy-current-url-as-markdown-confirmation = Huidige URL gekopieerd als Markdown!
harbor-general-cancel-label = 
    .label = Annuleren
harbor-general-confirm = 
    .label = Bevestigen
harbor-pinned-tab-replaced = Vastgemaakte tabblad URL is vervangen met de huidige URL!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Tabblad is succesvol hernoemd!
harbor-background-tab-opened-toast = Nieuw achtergrondtabblad geopend!
harbor-workspace-renamed-toast = Werkruimte succesvol is hernoemd!
harbor-split-view-limit-toast = Kan geen panelen meer toevoegen aan de gesplitste weergave!
harbor-toggle-compact-mode-button = 
    .label = Compacte modus
    .tooltiptext = Compacte modus togglen

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Meer leren
harbor-close-label = Sluiten
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Zoeken…
harbor-icons-picker-emoji = 
    .label = Emoji's
harbor-icons-picker-svg = 
    .label = Iconen
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Acties
harbor-site-data-settings = Instellingen
harbor-generic-manage = Beheren
harbor-generic-more = Meer
harbor-generic-next = Volgende
harbor-essentials-promo-label = Toevoegen aan Essentials
harbor-essentials-promo-sublabel = Krijg in één klik toegang tot je favoriete tabbladen
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Toegestaan
harbor-site-data-setting-block = Geblokkeerd
harbor-site-data-protections-enabled = Ingeschakeld
harbor-site-data-protections-disabled = Uitgeschakeld
harbor-site-data-setting-cross-site = Cross-site cookie
harbor-site-data-security-info-extension = 
    .label = Extensie
harbor-site-data-security-info-secure = 
    .label = Beveiligd
harbor-site-data-security-info-not-secure = 
    .label = Niet beveiligd
harbor-site-data-manage-addons = 
    .label = Extensies beheren
harbor-site-data-get-addons = 
    .label = Extensies toevoegen
harbor-site-data-site-settings = 
    .label = Alle site-instellingen
harbor-site-data-header-share = 
    .tooltiptext = Deze pagina delen
harbor-site-data-header-reader-mode = 
    .tooltiptext = Leesmodus openen
harbor-site-data-header-screenshot = 
    .tooltiptext = Maak een schermafbeelding
harbor-site-data-header-bookmark = 
    .tooltiptext = Bladwijzer toevoegen voor deze pagina
harbor-urlbar-copy-url-button = 
    .tooltiptext = URL kopiëren
harbor-site-data-setting-site-protection = Tracking bescherming

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Een nieuw thuis voor add-ons, machtigingen en meer
harbor-site-data-panel-feature-callout-subtitle = Klik op het icoon om de site-instellingen te beheren, beveiligingsinfo te bekijken, extensies te openen en gemeenschappelijke acties uit te voeren.
harbor-open-link-in-glance = 
    .label = Link openen in Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Update voltooid!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Wat is er veranderd in { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Versie-informatie bekijken
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Werkt er iets niet?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Herstarten in veilige modus
harbor-window-sync-migration-dialog-title = Hou je vensters gesynchroniseerd
harbor-window-sync-migration-dialog-message = Vanaf nu synchroniseert Harbor alle vensters op hetzelfde apparaat, dus aanpassingen in het ene venster worden tegelijkertijd op het andere venster toegepast.
harbor-window-sync-migration-dialog-learn-more = Meer info
harbor-window-sync-migration-dialog-accept = Begrepen
harbor-appmenu-new-blank-window = 
    .label = Nieuw blanco venster
