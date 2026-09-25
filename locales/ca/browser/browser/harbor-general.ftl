# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = perfil actual
unified-extensions-description = Les extensions aporten funcionalitats addicionals a { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Restableix la pestanya essencial
           *[false] Restableix la pestanya fixada
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Afegeix als essencials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Elimina dels essencials
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edita l'URL essencial
           *[false] Edita l'URL fixada
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Substitueix amb l'URL actual
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Edita…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Canvia l'etiqueta...
tab-context-harbor-edit-icon = 
    .label = Canvia la icona...
harbor-themes-corrupted = El vostre fitxer de modificacions { -brand-short-name } està malmès. S'ha restablert al tema per defecte.
harbor-shortcuts-corrupted = El vostre fitxer de dreceres { -brand-short-name } està malmès. S'ha restablert a les dreceres per defecte.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    La nova barra d'URL s'ha activat, eliminant la necessitat de noves pàgines de pestanya.<br/><br/>
    Proveu d'obrir una pestanya nova per veure la nova barra d'URL en acció!
harbor-disable = Deshabilita
pictureinpicture-minimize-btn = 
    .aria-label = Minimitza
    .tooltip = Minimitza
harbor-panel-ui-gradient-generator-custom-color = Color personalitzat
harbor-copy-current-url-confirmation = L'URL actual s'ha copiat.
harbor-copy-current-url-as-markdown-confirmation = L'URL actual s'ha copiat com a Markdown!
harbor-general-cancel-label = 
    .label = Cancel·la
harbor-general-confirm = 
    .label = Confirma
harbor-pinned-tab-replaced = L'URL de la pestanya fixada s'ha substituït per l'URL actual.
harbor-pinned-tab-url-edited = L'URL de la pestanya fixada s'ha actualitzat!
harbor-pinned-tab-url-invalid = Això no sembla una URL vàlida.
harbor-pinned-tab-edit-url-title = Edita l'URL fixada
harbor-pinned-tab-edit-url-label = Introduïu l'URL a la qual ha d'apuntar aquesta pestanya fixada:
harbor-tabs-renamed = S'ha canviat el nom de la pestanya correctament
harbor-background-tab-opened-toast = S'ha obert una nova pestanya de fons
harbor-workspace-renamed-toast = S'ha canviat el nom de l'espai de treball correctament
harbor-split-view-limit-toast = No es poden afegir més panells a la vista dividida!
harbor-toggle-compact-mode-button = 
    .label = Mode compacte
    .tooltiptext = Commuta el mode compacte

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Més informació
harbor-close-label = Tanca
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Cerca...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Icones
harbor-emojis-picker-search = 
    .placeholder = Cerca emojis
urlbar-search-mode-zen_actions = Accions
harbor-site-data-settings = Configuració
harbor-generic-manage = Gestiona
harbor-generic-more = Més
harbor-generic-next = Següent
harbor-essentials-promo-label = Afegeix als essencials
harbor-essentials-promo-sublabel = Mantingueu les vostres pestanyes preferides a només un clic de distància
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Permès
harbor-site-data-setting-block = Bloquejat
harbor-site-data-protections-enabled = Habilitat
harbor-site-data-protections-disabled = Deshabilitat
harbor-site-data-setting-cross-site = Galetes entre llocs
harbor-site-data-security-info-extension = 
    .label = Extensió
harbor-site-data-security-info-secure = 
    .label = Segur
harbor-site-data-security-info-not-secure = 
    .label = No és segur
harbor-site-data-manage-addons = 
    .label = Gestiona les extensions
harbor-site-data-get-addons = 
    .label = Afegeix extensions
harbor-site-data-site-settings = 
    .label = Totes les configuracions del lloc
harbor-site-data-header-share = 
    .tooltiptext = Comparteix aquesta pàgina
harbor-site-data-header-reader-mode = 
    .tooltiptext = Accedeix al mode lectura
harbor-site-data-header-screenshot = 
    .tooltiptext = Fes una captura de pantalla
harbor-site-data-header-bookmark = 
    .tooltiptext = Afegeix la pàgina a les adreces d'interès
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copia l'URL
harbor-site-data-setting-site-protection = Protecció contra el seguiment

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Una nova ubicació per a les extenions, permisos i molt més
harbor-site-data-panel-feature-callout-subtitle = Feu clic a la icona per gestionar la configuració del lloc, veure la informació de seguretat, accedir a les extensions i dur a terme accions habituals.
harbor-open-link-in-glance = 
    .label = Obre l'enllaç en un cop d'ull
    .accesskey = G
harbor-sidebar-notification-updated-heading = Actualització completada!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Novetats a { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Mostra les notes de la versió
harbor-sidebar-notification-donate-label = Ajudeu-nos { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Feu una donació al projecte
harbor-sidebar-notification-restart-safe-mode-label = Alguna cosa no funciona?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Reinici en mode segur
harbor-window-sync-migration-dialog-title = Mantingueu les finestres sincronitzades
harbor-window-sync-migration-dialog-message = El Harbor ara sincronitza les finestres del mateix dispositiu, de manera que els canvis en una finestra es reflecteixen a les altres a l'instant.
harbor-window-sync-migration-dialog-learn-more = Més informació
harbor-window-sync-migration-dialog-accept = D'acord
harbor-appmenu-new-blank-window = 
    .label = Nova finestra en blanc
