# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = profilo in uso
unified-extensions-description = Le estensioni sono usate per portare più funzionalità in { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Resetta Scheda Essenziale
           *[false] Resetta Scheda Bloccata
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Aggiungi agli Essenziali
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } slot riempiti
tab-context-harbor-remove-essential = 
    .label = Rimuovi dagli Essenziali
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
    .label = Cambia Etichetta...
tab-context-harbor-edit-icon = 
    .label = Cambia icona...
harbor-themes-corrupted = Il tuo file { -brand-short-name } mods è danneggiato. Sono stati reimpostati al tema predefinito.
harbor-shortcuts-corrupted = Il file delle scorciatoie per { -brand-short-name } è corrotto. Le scorciatoie sono state riportate alle impostazioni predefinite.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification = La nuova barra degli indirizzi è stata abilitata, eliminando la necessità della pagina di una nuova scheda.<br/><br/>Prova ad aprire una nuova scheda per vedere la nuova barra degli indirizzi in azione!
harbor-disable = Disabilita
pictureinpicture-minimize-btn = 
    .aria-label = Minimizza
    .tooltip = Minimizza
harbor-panel-ui-gradient-generator-custom-color = Colore personalizzato
harbor-copy-current-url-confirmation = L'URL corrente è stato copiato!
harbor-copy-current-url-as-markdown-confirmation = URL corrente copiato come Markdown!
harbor-general-cancel-label = 
    .label = Annulla
harbor-general-confirm = 
    .label = Conferma
harbor-pinned-tab-replaced = L'URL della scheda bloccata è stato sostituito con l'URL attuale.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = La scheda è stata rinominata con successo!
harbor-background-tab-opened-toast = Nuova scheda aperta in background!
harbor-workspace-renamed-toast = Il Workspace è stato rinominato con successo!
harbor-split-view-limit-toast = Impossibile aggiungere altri pannelli alla vista divisa!
harbor-toggle-compact-mode-button = 
    .label = Modalità compatta
    .tooltiptext = Attiva/disattiva Modalità compatta

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Scopri di più
harbor-close-label = Chiudi
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Cerca...
harbor-icons-picker-emoji = 
    .label = Emoji
harbor-icons-picker-svg = 
    .label = Icone
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Azioni
harbor-site-data-settings = Impostazioni
harbor-generic-manage = Gestisci
harbor-generic-more = Altro
harbor-generic-next = Successivo
harbor-essentials-promo-label = Aggiungi agli Essenziali
harbor-essentials-promo-sublabel = Mantieni le tue schede preferite a un clic di distanza
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Consentito
harbor-site-data-setting-block = Bloccato
harbor-site-data-protections-enabled = Attivato
harbor-site-data-protections-disabled = Disattivato
harbor-site-data-setting-cross-site = Cookie Cross-Site
harbor-site-data-security-info-extension = 
    .label = Estensione
harbor-site-data-security-info-secure = 
    .label = Sicuro
harbor-site-data-security-info-not-secure = 
    .label = Non sicuro
harbor-site-data-manage-addons = 
    .label = Gestisci estensioni
harbor-site-data-get-addons = 
    .label = Aggiungi estensioni
harbor-site-data-site-settings = 
    .label = Tutte le impostazioni del sito
harbor-site-data-header-share = 
    .tooltiptext = Condividi questa pagina
harbor-site-data-header-reader-mode = 
    .tooltiptext = Entra nella Modalità Lettura
harbor-site-data-header-screenshot = 
    .tooltiptext = Cattura schermata
harbor-site-data-header-bookmark = 
    .tooltiptext = Aggiungi questa pagina ai segnalibri
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copia URL
harbor-site-data-setting-site-protection = Protezione Tracciamento

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Una nuova casa per componenti aggiuntivi, permessi, e altro ancora
harbor-site-data-panel-feature-callout-subtitle = Clicca l'icona per gestire le impostazioni del sito, visualizzare informazioni di sicurezza, accedere alle estensioni, ed eseguire azioni comuni.
harbor-open-link-in-glance = 
    .label = Apri collegamento in Sguardo
    .accesskey = G
harbor-sidebar-notification-updated-heading = Aggiornamento completato!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Cosa c'è di nuovo in { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Vedi Note di Rilascio
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Si è rotto qualcosa?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Riavvia in Modalità Provvisoria
harbor-window-sync-migration-dialog-title = Mantieni le tue Finestre sincronizzate
harbor-window-sync-migration-dialog-message = Harbor ora sincronizza le finestre sullo stesso dispositivo, quindi le modifiche in una finestra si riflettono istantaneamente sulle altre.
harbor-window-sync-migration-dialog-learn-more = Scopri di più
harbor-window-sync-migration-dialog-accept = Ho capito
harbor-appmenu-new-blank-window = 
    .label = Nuova finestra vuota
