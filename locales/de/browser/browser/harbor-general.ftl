# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = Dein aktuelles Profil
unified-extensions-description = Mit Erweiterungen kannst du { -brand-short-name } um zusätzliche Funktionen erweitern.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Essential-Tab zurücksetzen
           *[false] Angehefteten Tab zurücksetzen
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Zu Essentials hinzufügen
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } Plätzen belegt
tab-context-harbor-remove-essential = 
    .label = Aus Essentials entfernen
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Essentials URL bearbeiten
           *[false] Angeheftete URL bearbeiten
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Mit aktueller URL ersetzen
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Bearbeiten...
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Titel ändern...
tab-context-harbor-edit-icon = 
    .label = Symbol ändern...
harbor-themes-corrupted = Deine { -brand-short-name }-Mods-Datei ist beschädigt. Sie wurde auf das Standard-Design zurückgesetzt.
harbor-shortcuts-corrupted = Deine { -brand-short-name }-Tastenkombinationsdatei ist beschädigt. Sie wurde auf die Standard-Tastenkombinationen zurückgesetzt.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Die neue Adressleiste wurde aktiviert und macht neue Tab-Seiten überflüssig.<br/><br/>
    Öffne einfach einen neuen Tab, um die neue Adressleiste auszuprobieren!
harbor-disable = Deaktivieren
pictureinpicture-minimize-btn = 
    .aria-label = Minimieren
    .tooltip = Minimieren
harbor-panel-ui-gradient-generator-custom-color = Eigene Farbe
harbor-copy-current-url-confirmation = URL kopiert!
harbor-copy-current-url-as-markdown-confirmation = URL als Markdown kopiert!
harbor-general-cancel-label = 
    .label = Abbrechen
harbor-general-confirm = 
    .label = Bestätigen
harbor-pinned-tab-replaced = Die URL des angehefteten Tabs wurde aktualisiert!
harbor-pinned-tab-url-edited = Angeheftete URL wurde aktualisiert!
harbor-pinned-tab-url-invalid = Das sieht nicht nach einer gültigen URL aus.
harbor-pinned-tab-edit-url-title = Angeheftete URL bearbeiten
harbor-pinned-tab-edit-url-label = Gib die URL an, auf die der angeheftete Tab verweisen soll:
harbor-tabs-renamed = Tab umbenannt!
harbor-background-tab-opened-toast = Neuer Tab im Hintergrund geöffnet!
harbor-workspace-renamed-toast = Arbeitsbereich umbenannt!
harbor-split-view-limit-toast = Diese Split View kann keine weiteren Panels aufnehmen!
harbor-toggle-compact-mode-button = 
    .label = Kompakter Modus
    .tooltiptext = Kompakten Modus umschalten

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Mehr erfahren
harbor-close-label = Schließen
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Suchen...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Symbole
harbor-emojis-picker-search = 
    .placeholder = Emojis durchsuchen
urlbar-search-mode-zen_actions = Aktionen
harbor-site-data-settings = Einstellungen
harbor-generic-manage = Verwalten
harbor-generic-more = Mehr
harbor-generic-next = Weiter
harbor-essentials-promo-label = Zu Essentials hinzufügen
harbor-essentials-promo-sublabel = Deine Lieblings-Tabs, immer nur einen Klick entfernt
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Erlaubt
harbor-site-data-setting-block = Blockiert
harbor-site-data-protections-enabled = Aktiviert
harbor-site-data-protections-disabled = Deaktiviert
harbor-site-data-setting-cross-site = Seitenübergreifendes Cookie
harbor-site-data-security-info-extension = 
    .label = Erweiterung
harbor-site-data-security-info-secure = 
    .label = Sicher
harbor-site-data-security-info-not-secure = 
    .label = Nicht sicher
harbor-site-data-manage-addons = 
    .label = Erweiterungen verwalten
harbor-site-data-get-addons = 
    .label = Erweiterungen hinzufügen
harbor-site-data-site-settings = 
    .label = Alle Website-Einstellungen
harbor-site-data-header-share = 
    .tooltiptext = Diese Seite teilen
harbor-site-data-header-reader-mode = 
    .tooltiptext = Lesemodus aktivieren
harbor-site-data-header-screenshot = 
    .tooltiptext = Bildschirmfoto erstellen
harbor-site-data-header-bookmark = 
    .tooltiptext = Diese Seite als Lesezeichen speichern
harbor-urlbar-copy-url-button = 
    .tooltiptext = URL kopieren
harbor-site-data-setting-site-protection = Tracking-Schutz

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Hier findest du Add-ons, Berechtigungen und mehr
harbor-site-data-panel-feature-callout-subtitle = Klicke auf das Symbol, um Website-Einstellungen anzupassen, Sicherheitsinfos anzuzeigen, auf Erweiterungen zuzugreifen und häufige Aktionen auszuführen.
harbor-open-link-in-glance = 
    .label = Link in Schnellansicht öffnen
    .accesskey = G
harbor-sidebar-notification-updated-heading = Update abgeschlossen!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Was in { -brand-short-name } neu ist
harbor-sidebar-notification-updated-tooltip = 
    .title = Versionshinweise anzeigen
harbor-sidebar-notification-donate-label = Unterstütze { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Spende für das Projekt
harbor-sidebar-notification-restart-safe-mode-label = Funktioniert etwas nicht?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Im abgesicherten Modus neu starten
harbor-window-sync-migration-dialog-title = Halte deine Fenster synchron
harbor-window-sync-migration-dialog-message = Harbor synchronisiert jetzt Fenster auf demselben Gerät, sodass Änderungen in einem Fenster sofort in den anderen übernommen werden.
harbor-window-sync-migration-dialog-learn-more = Mehr erfahren
harbor-window-sync-migration-dialog-accept = Verstanden
harbor-appmenu-new-blank-window = 
    .label = Neues leeres Fenster
