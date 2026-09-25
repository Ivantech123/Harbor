# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = gjeldende profil
unified-extensions-description = Utvidelser brukes for å bringe ekstra funksjonalitet til { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Nullstill Essential fane
           *[false] Nullstill festet fane
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Legg til i Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Fjern fra Essentials
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
    .label = Endre etikett...
tab-context-harbor-edit-icon = 
    .label = Endre ikon...
harbor-themes-corrupted = Din { -brand-short-name }-mods fil er skadet. De har blitt tilbakestilt til standardtemaet.
harbor-shortcuts-corrupted = { -brand-short-name } snarvei-filen din er skadet. De har blitt tilbakestilt til standard-snarveiene.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Det nye nettadressefeltet har blitt aktivert, som tar vekk behovet for nye fanesider.<br/><br/>
    Prøv å åpne en ny fane for å se det nye nettadressefeltet i action!
harbor-disable = Deaktiver
pictureinpicture-minimize-btn = 
    .aria-label = Minimer
    .tooltip = Minimer
harbor-panel-ui-gradient-generator-custom-color = Tilpasset Farge
harbor-copy-current-url-confirmation = Kopierte gjeldende nettadresse!
harbor-copy-current-url-as-markdown-confirmation = Kopierte gjeldende nettadresse som Markdown!
harbor-general-cancel-label = 
    .label = Avbryt
harbor-general-confirm = 
    .label = Bekreft
harbor-pinned-tab-replaced = Festet fanes nettadresse har blit erstattet med gjeldende nettadresse!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Fanen har fått nytt navn!
harbor-background-tab-opened-toast = Ny bakgrunnsfane åpnet!
harbor-workspace-renamed-toast = Arbeidsområdet har fått nytt navn!
harbor-split-view-limit-toast = Kan ikke legge til flere paneler i delt visning!
harbor-toggle-compact-mode-button = 
    .label = Kompakt modus
    .tooltiptext = Veksle kompakt modus

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Lær mer
harbor-close-label = Lukk
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Søk...
harbor-icons-picker-emoji = 
    .label = Emojier
harbor-icons-picker-svg = 
    .label = Ikoner
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Handlinger
harbor-site-data-settings = Innstillinger
harbor-generic-manage = Behandle
harbor-generic-more = Mer
harbor-generic-next = Neste
harbor-essentials-promo-label = Legg til i Essentials
harbor-essentials-promo-sublabel = Hold favorittfanene dine bare et klikk unna
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Tillat
harbor-site-data-setting-block = Blokker
harbor-site-data-protections-enabled = Aktivert
harbor-site-data-protections-disabled = Deaktivert
harbor-site-data-setting-cross-site = Tvers-side informasjonskapsel
harbor-site-data-security-info-extension = 
    .label = Utvidelse
harbor-site-data-security-info-secure = 
    .label = Sikker
harbor-site-data-security-info-not-secure = 
    .label = Ikke sikker
harbor-site-data-manage-addons = 
    .label = Behandle Utvidelser
harbor-site-data-get-addons = 
    .label = Legg til utvidelser
harbor-site-data-site-settings = 
    .label = Alle nettstedsinnstillinger
harbor-site-data-header-share = 
    .tooltiptext = Del denne siden
harbor-site-data-header-reader-mode = 
    .tooltiptext = Gå til lesermodus
harbor-site-data-header-screenshot = 
    .tooltiptext = Ta et skjermbilde
harbor-site-data-header-bookmark = 
    .tooltiptext = Bokmerk denne siden
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopier nettadresse
harbor-site-data-setting-site-protection = Sporingsbeskyttelse

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Et nytt hjem for tillegg, tillatelser, og mer
harbor-site-data-panel-feature-callout-subtitle = Klikk på ikonet for å behandle nettstedsinnstillinger, se sikkerhetsinformasjon, behandle utvidelser, og utføre vanlige handlinger.
harbor-open-link-in-glance = 
    .label = Åpne lenke i Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Oppdatering fullført!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Hva er nytt i { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Se versjonsnotater
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Er noe ødelagt?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Start på nytt i sikker modus
harbor-window-sync-migration-dialog-title = Hold vinduene dine synkronisert
harbor-window-sync-migration-dialog-message = Harbor synkroniserer nå vinduer på samme enhet, så endringer i ett vindu blir reflekterte på tvers de andre med en gang.
harbor-window-sync-migration-dialog-learn-more = Lær mer
harbor-window-sync-migration-dialog-accept = Skjønner
harbor-appmenu-new-blank-window = 
    .label = Nytt tomt vindu
