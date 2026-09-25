# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = profilul curent
unified-extensions-description = Extensiile sunt folosite pentru a aduce funcționalități suplimentare în { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Resetare Filă Esențială
           *[false] Resetare Filă Fixată
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Adaugă la Esențiale
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Elimină din Esențiale
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Editează URL-ul filei esențiale
           *[false] Editează URL-ul filei fixate
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Înlocuiește cu URL-ul curent
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Editează…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Change Label...
tab-context-harbor-edit-icon = 
    .label = Change Icon...
harbor-themes-corrupted = Fișierul tău de moduri { -brand-short-name } este corupt. Acestea au fost resetate la tema implicită.
harbor-shortcuts-corrupted = Fișierul tău de scurtături { -brand-short-name } este corupt. Acestea au fost resetate la scurtăturile implicite.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Noua bară URL a fost activată, eliminând necesitatea pentru paginile cu file noi.<br/><br/>
    Încearcă să deschizi o filă nouă pentru a vedea noua bară URL în acțiune!
harbor-disable = Dezactivează
pictureinpicture-minimize-btn = 
    .aria-label = Minimizează
    .tooltip = Minimizează
harbor-panel-ui-gradient-generator-custom-color = Culoare Personalizată
harbor-copy-current-url-confirmation = URL-ul curent a fost copiat!
harbor-copy-current-url-as-markdown-confirmation = URL-ul curent a fost copiat ca Markdown!
harbor-general-cancel-label = 
    .label = Anulează
harbor-general-confirm = 
    .label = Confirmă
harbor-pinned-tab-replaced = URL-ul filei fixate a fost înlocuit cu URL-ul curent!
harbor-pinned-tab-url-edited = URL-ul filei fixate a fost actualizat!
harbor-pinned-tab-url-invalid = Nu pare a fi un URL valid.
harbor-pinned-tab-edit-url-title = Editare URL fixat
harbor-pinned-tab-edit-url-label = Introdu URL-ul pe care această filă trebuie să-l indice:
harbor-tabs-renamed = Fila a fost redenumită cu succes!
harbor-background-tab-opened-toast = Filă nouă de fundal deschisă!
harbor-workspace-renamed-toast = Spațiul de Lucru a fost redenumit cu succes!
harbor-split-view-limit-toast = Nu se mai pot adăuga panouri noi la vizualizarea împărțită!
harbor-toggle-compact-mode-button = 
    .label = Modul Compact
    .tooltiptext = Comută Modul Compact

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Află mai multe
harbor-close-label = Închide
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Caută...
harbor-icons-picker-emoji = 
    .label = Emoji-uri
harbor-icons-picker-svg = 
    .label = Iconițe
harbor-emojis-picker-search = 
    .placeholder = Caută Emoji
urlbar-search-mode-zen_actions = Acțiuni
harbor-site-data-settings = Setări
harbor-generic-manage = Gestionează
harbor-generic-more = Mai multe
harbor-generic-next = Următorul
harbor-essentials-promo-label = Adaugă la Esențiale
harbor-essentials-promo-sublabel = Ține filele tale preferate la un click distanță
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Permis
harbor-site-data-setting-block = Blocat
harbor-site-data-protections-enabled = Activat
harbor-site-data-protections-disabled = Dezactivat
harbor-site-data-setting-cross-site = Cookie Cross-Site
harbor-site-data-security-info-extension = 
    .label = Extensie
harbor-site-data-security-info-secure = 
    .label = Securizat
harbor-site-data-security-info-not-secure = 
    .label = Nesecurizat
harbor-site-data-manage-addons = 
    .label = Gestionează Extensiile
harbor-site-data-get-addons = 
    .label = Adaugă Extensii
harbor-site-data-site-settings = 
    .label = Toate Setările Site-ului
harbor-site-data-header-share = 
    .tooltiptext = Distribuie Această Pagină
harbor-site-data-header-reader-mode = 
    .tooltiptext = Intră în Modul Cititor
harbor-site-data-header-screenshot = 
    .tooltiptext = Fă o Captură Ecran
harbor-site-data-header-bookmark = 
    .tooltiptext = Marchează Această Pagină
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copiază URL-ul
harbor-site-data-setting-site-protection = Protecție împotriva Urmăririi

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = O casă nouă pentru Suplimente, Permisiuni și multe altele
harbor-site-data-panel-feature-callout-subtitle = Apasă pe iconiță pentru a gestiona setările site-ului, pentru a vizualiza informațiile de securitate, accesul extensiilor și pentru a efectua acțiuni comune.
harbor-open-link-in-glance = 
    .label = Deschide link-ul în Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Actualizare finalizată!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Ce este nou în { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Vezi Notele de Lansare
harbor-sidebar-notification-donate-label = Suportă { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donează proiectului
harbor-sidebar-notification-restart-safe-mode-label = S-a stricat ceva?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Repornește în Modul Sigur
harbor-window-sync-migration-dialog-title = Păstrează-ți Ferestrele Sincronizate
harbor-window-sync-migration-dialog-message = Harbor sincronizează ferestrele pe același dispozitiv, deci modificările dintr-o fereastră sunt reflectate instantaneu la celelalte ferestre.
harbor-window-sync-migration-dialog-learn-more = Află mai multe
harbor-window-sync-migration-dialog-accept = Am înțeles
harbor-appmenu-new-blank-window = 
    .label = Fereastră Nouă Goală
