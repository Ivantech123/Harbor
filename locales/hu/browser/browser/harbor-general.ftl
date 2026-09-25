# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = jelenlegi profil
unified-extensions-description = A bővítmények a { -brand-short-name }-t új funkciókkal látják el.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Alapvető lap visszaállítása
           *[false] Rögzített lap visszaállítása
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Felvétel az alapvetőkbe
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } hely foglalt
tab-context-harbor-remove-essential = 
    .label = Eltávolítás az alapvetőkből
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
    .label = Címke módosítása...
tab-context-harbor-edit-icon = 
    .label = Ikon módosítása...
harbor-themes-corrupted = A te { -brand-short-name } mod fájljaid károsodtak. Vissza lettek állítva az eredeti témára.
harbor-shortcuts-corrupted = A te { -brand-short-name } parancsikonok fájlod károsodott. Vissza lettek állítva az eredeti parancsikonokra.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Az új URL sáv engedélyezve lett, így nincs szükség új lapokra.<br/><br/>
    Próbáljon ki egy új lapot nyitni, hogy láthassa az új URL-sávot működés közben!
harbor-disable = Kikapcsolás
pictureinpicture-minimize-btn = 
    .aria-label = Minimalizálás
    .tooltip = Minimalizálás
harbor-panel-ui-gradient-generator-custom-color = Egyedi szín
harbor-copy-current-url-confirmation = Jelenlegi URL másolva!
harbor-copy-current-url-as-markdown-confirmation = Jelenlegi URL másolva Markdownként!
harbor-general-cancel-label = 
    .label = Mégsem
harbor-general-confirm = 
    .label = Megerősítés
harbor-pinned-tab-replaced = A rögzített lap URL címe helyébe az aktuális URL cím lépett!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = A lap sikeresen át lett nevezve!
harbor-background-tab-opened-toast = Új lap megnyitva!
harbor-workspace-renamed-toast = A munkakörnyezet sikeresen át lett nevezve!
harbor-split-view-limit-toast = Nem lehet további paneleket hozzáadni az osztott nézethez!
harbor-toggle-compact-mode-button = 
    .label = Kompakt mód
    .tooltiptext = Kompakt mód ki-/bekapcsolása

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Tudjon meg többet
harbor-close-label = Bezárás
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Keresés...
harbor-icons-picker-emoji = 
    .label = Emojik
harbor-icons-picker-svg = 
    .label = Ikonok
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Műveletek
harbor-site-data-settings = Beállítások
harbor-generic-manage = Kezelés
harbor-generic-more = Több
harbor-generic-next = Következő
harbor-essentials-promo-label = Felvétel az alapvetőkbe
harbor-essentials-promo-sublabel = Tartsd kedvenc lapjaid egy kattintásnyira
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Engedélyezve
harbor-site-data-setting-block = Blokkolva
harbor-site-data-protections-enabled = Engedélyezve
harbor-site-data-protections-disabled = Letiltva
harbor-site-data-setting-cross-site = Webhelyek közötti sütik
harbor-site-data-security-info-extension = 
    .label = Kiegészítő
harbor-site-data-security-info-secure = 
    .label = Biztonságos
harbor-site-data-security-info-not-secure = 
    .label = Nem biztonságos
harbor-site-data-manage-addons = 
    .label = Kiegészítők kezelése
harbor-site-data-get-addons = 
    .label = Kiegészítő hozzáadása
harbor-site-data-site-settings = 
    .label = Minden webhelybeállítás
harbor-site-data-header-share = 
    .tooltiptext = Oldal megosztása
harbor-site-data-header-reader-mode = 
    .tooltiptext = Olvasó módba lépés
harbor-site-data-header-screenshot = 
    .tooltiptext = Képernyőkép készítése
harbor-site-data-header-bookmark = 
    .tooltiptext = Oldal mentése a könyvjelzők közé
harbor-urlbar-copy-url-button = 
    .tooltiptext = URL másolása
harbor-site-data-setting-site-protection = Nyomkövetés védelem

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Új hely az add-onok, engedélyek és egyéb elemek számára
harbor-site-data-panel-feature-callout-subtitle = Kattints az ikonra a webhely beállításainak kezeléséhez, a biztonsági információk megtekintéséhez, a kiegészítők eléréséhez és a gyakori műveletek végrehajtásához.
harbor-open-link-in-glance = 
    .label = Link megnyitása a bepillantóban
    .accesskey = G
harbor-sidebar-notification-updated-heading = Frissítés befejezve!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = { -brand-short-name } újdonságai
harbor-sidebar-notification-updated-tooltip = 
    .title = Változások listájának megtekintése
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Valami elromlott?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Újraindítás biztonságos módban
harbor-window-sync-migration-dialog-title = Tartsad szinkronban az ablakaid
harbor-window-sync-migration-dialog-message = A Harbor mostantól szinkronizálja az ugyanazon eszközön található ablakokat, így az egyik ablakban végzett módosítások azonnal megjelennek a többiben is.
harbor-window-sync-migration-dialog-learn-more = Tudj meg többet
harbor-window-sync-migration-dialog-accept = Értettem
harbor-appmenu-new-blank-window = 
    .label = Új üres ablak
