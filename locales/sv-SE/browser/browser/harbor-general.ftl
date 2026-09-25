# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = nuvarande profil
unified-extensions-description = Tillägg används för att få fler extra funktioner i { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Återställ Essential flik
           *[false] Återställ fäst flik
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Lägg till Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } platser fyllda
tab-context-harbor-remove-essential = 
    .label = Ta bort från Essentials
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Redigera Essential URL
           *[false] Redigera fäst URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Ersätt med nuvarande URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Redigera…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Ändra etikett...
tab-context-harbor-edit-icon = 
    .label = Ändra ikon...
harbor-themes-corrupted = Din { -brand-short-name } modds-fil är skadad. De har återställts till standardtemat.
harbor-shortcuts-corrupted = Din { -brand-short-name } Genvägsfil är korrupt. De har återställts till standardgenvägarna.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Det nya adressfältet har aktiverats, vilket eliminerar behovet av nya fliksidor.<br/><br/>
    Försök att öppna en ny flik för att se det nya adressfältet användas!
harbor-disable = Inaktivera
pictureinpicture-minimize-btn = 
    .aria-label = Minimera
    .tooltip = Minimera
harbor-panel-ui-gradient-generator-custom-color = Anpassad färg
harbor-copy-current-url-confirmation = Kopierade nuvarande URL!
harbor-copy-current-url-as-markdown-confirmation = Kopierade nuvarande webbadress som Markdown!
harbor-general-cancel-label = 
    .label = Avbryt
harbor-general-confirm = 
    .label = Bekräfta
harbor-pinned-tab-replaced = Den fästa flikens URL har ersatts med den aktuella URL!
harbor-pinned-tab-url-edited = Fäst flik URL har uppdaterats!
harbor-pinned-tab-url-invalid = Det ser inte ut som en giltig URL.
harbor-pinned-tab-edit-url-title = Redigera fäst URL
harbor-pinned-tab-edit-url-label = Ange den URL som den fästa fliken ska peka till:
harbor-tabs-renamed = Fliken har fått nytt namn!
harbor-background-tab-opened-toast = Ny bakgrundsflik öppnad!
harbor-workspace-renamed-toast = Arbetsytan har fått ett nytt namn!
harbor-split-view-limit-toast = Kan inte lägga till fler paneler till delad vy!
harbor-toggle-compact-mode-button = 
    .label = Kompakt läge
    .tooltiptext = Växla kompakt läge

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Läs mer
harbor-close-label = Stäng
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Sök...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Ikoner
harbor-emojis-picker-search = 
    .placeholder = Sök emojis
urlbar-search-mode-zen_actions = Åtgärder
harbor-site-data-settings = Inställningar
harbor-generic-manage = Hantera
harbor-generic-more = Mer
harbor-generic-next = Nästa
harbor-essentials-promo-label = Lägg till Essentials
harbor-essentials-promo-sublabel = Behåll dina favoritflikar bara ett klick bort
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Tillåtet
harbor-site-data-setting-block = Blockerade
harbor-site-data-protections-enabled = Aktiverad
harbor-site-data-protections-disabled = Inaktiverad
harbor-site-data-setting-cross-site = Globala kakor
harbor-site-data-security-info-extension = 
    .label = Tillägg
harbor-site-data-security-info-secure = 
    .label = Säker
harbor-site-data-security-info-not-secure = 
    .label = Inte säker
harbor-site-data-manage-addons = 
    .label = Hantera tillägg
harbor-site-data-get-addons = 
    .label = Lägg till tillägg
harbor-site-data-site-settings = 
    .label = Alla webbplatsinställningar
harbor-site-data-header-share = 
    .tooltiptext = Dela denna sida
harbor-site-data-header-reader-mode = 
    .tooltiptext = Öppna läsläge
harbor-site-data-header-screenshot = 
    .tooltiptext = Ta en skärmdump
harbor-site-data-header-bookmark = 
    .tooltiptext = Bokmärk denna sida
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopiera URL
harbor-site-data-setting-site-protection = Spårningsskydd

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Ett nytt hem för tillägg, behörigheter och mer
harbor-site-data-panel-feature-callout-subtitle = Klicka på ikonen för att hantera webbplatsinställningar, visa säkerhetsinformation, öppna tillägg och utföra vanliga åtgärder.
harbor-open-link-in-glance = 
    .label = Öppna länk i Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Uppdatering slutförd!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Vad är nytt i { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Visa versionsfakta
harbor-sidebar-notification-donate-label = Stöd { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donera till projektet
harbor-sidebar-notification-restart-safe-mode-label = Har något gått sönder?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Starta om i felsäkert läge
harbor-window-sync-migration-dialog-title = Behåll dina fönster i Sync
harbor-window-sync-migration-dialog-message = Harbor synkroniserar nu fönster på samma enhet, så ändringar i ett fönster återspeglas direkt i de andra.
harbor-window-sync-migration-dialog-learn-more = Läs mer
harbor-window-sync-migration-dialog-accept = Jag förstår
harbor-appmenu-new-blank-window = 
    .label = Nytt blankt fönster
