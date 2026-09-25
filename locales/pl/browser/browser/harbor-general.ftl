# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = aktualny profil
unified-extensions-description = Rozszerzenia są używane, aby zapewnić dodatkową funkcjonalność w { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Zresetuj niezbędną kartę
           *[false] Zresetuj przypiętą kartę
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Dodaj do niezbędnych
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Usuń z niezbędnych
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edytuj niezbędny adres URL
           *[false] Edytuj przypięty adres URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Zastąp bieżącym adresem URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Edytuj…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Zmień nazwę...
tab-context-harbor-edit-icon = 
    .label = Zmień ikonę...
harbor-themes-corrupted = Twój plik modyfikacji { -brand-short-name } jest uszkodzony. Został on zresetowany do domyślnego stanu.
harbor-shortcuts-corrupted = Twój plik skrótów { -brand-short-name } jest uszkodzony. Został on zresetowany do domyślnego stanu.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Włączono nowy pasek adresu URL, dzięki czemu nie ma już potrzeby korzystania ze strony nowej karty.<br/><br/>
    Spróbuj otworzyć nową kartę, aby zobaczyć, jak działa nowy pasek adresu URL!
harbor-disable = Deaktywuj
pictureinpicture-minimize-btn = 
    .aria-label = Zminimalizuj
    .tooltip = Zminimalizuj
harbor-panel-ui-gradient-generator-custom-color = Niestandardowy kolor
harbor-copy-current-url-confirmation = Skopiowano bieżący URL!
harbor-copy-current-url-as-markdown-confirmation = Skopiowano bieżący adres URL jako Markdown!
harbor-general-cancel-label = 
    .label = Anuluj
harbor-general-confirm = 
    .label = Potwierdź
harbor-pinned-tab-replaced = URL przypiętej karty został zastąpiony bieżącym adresem!
harbor-pinned-tab-url-edited = Adres URL przypiętej karty został zaktualizowany!
harbor-pinned-tab-url-invalid = To nie wygląda na prawidłowy adres URL.
harbor-pinned-tab-edit-url-title = Edytuj przypięty adres URL
harbor-pinned-tab-edit-url-label = Wprowadź adres URL, do którego ma prowadzić ta przypięta karta:
harbor-tabs-renamed = Nazwa karty została pomyślnie zmieniona!
harbor-background-tab-opened-toast = Nowa karta została otworzona w tle!
harbor-workspace-renamed-toast = Zmieniono nazwę przestrzeni roboczej!
harbor-split-view-limit-toast = Nie można dodać kolejnych paneli do widoku podzielonego!
harbor-toggle-compact-mode-button = 
    .label = Tryb kompaktowy
    .tooltiptext = Przełącz tryb kompaktowy

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Dowiedz się więcej
harbor-close-label = Zamknij
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Szukaj...
harbor-icons-picker-emoji = 
    .label = Emotikony
harbor-icons-picker-svg = 
    .label = Ikony
harbor-emojis-picker-search = 
    .placeholder = Szukaj emoji
urlbar-search-mode-zen_actions = Akcje
harbor-site-data-settings = Ustawienia
harbor-generic-manage = Zarządzaj
harbor-generic-more = Więcej
harbor-generic-next = Następne
harbor-essentials-promo-label = Dodaj do niezbędnych
harbor-essentials-promo-sublabel = Utrzymuj swoje ulubione karty w zasięgu myszki
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Dozwolone
harbor-site-data-setting-block = Zablokowane
harbor-site-data-protections-enabled = Włączone
harbor-site-data-protections-disabled = Wyłączone
harbor-site-data-setting-cross-site = Pliki cookie między witrynami
harbor-site-data-security-info-extension = 
    .label = Rozszerzenie
harbor-site-data-security-info-secure = 
    .label = Zabezpieczone
harbor-site-data-security-info-not-secure = 
    .label = Niezabezpieczone
harbor-site-data-manage-addons = 
    .label = Zarządzaj rozszerzeniami
harbor-site-data-get-addons = 
    .label = Dodaj rozszerzenia
harbor-site-data-site-settings = 
    .label = Wszystkie ustawienia strony
harbor-site-data-header-share = 
    .tooltiptext = Udostępnij tę stronę
harbor-site-data-header-reader-mode = 
    .tooltiptext = Przejdź do trybu czytania
harbor-site-data-header-screenshot = 
    .tooltiptext = Zrzut ekranu
harbor-site-data-header-bookmark = 
    .tooltiptext = Dodaj tę stronę do zakładek
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopiuj URL
harbor-site-data-setting-site-protection = Ochrona przed śledzeniem

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Nowy dom dla dodatków, uprawnień i więcej
harbor-site-data-panel-feature-callout-subtitle = Kliknij ikonę, aby zarządzać ustawieniami witryny, wyświetlić informacje o zabezpieczeniach, rozszerzeniach i wykonać akcje.
harbor-open-link-in-glance = 
    .label = Otwórz link w szybkim podglądzie
    .accesskey = G
harbor-sidebar-notification-updated-heading = Aktualizacja ukończona!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Co nowego w { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Zobacz informacje o aktualizacji
harbor-sidebar-notification-donate-label = Wesprzyj { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Wesprzyj projekt
harbor-sidebar-notification-restart-safe-mode-label = Coś się zepsuło?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Zrestartuj w trybie bezpiecznym
harbor-window-sync-migration-dialog-title = Utrzymuj synchronizację okien
harbor-window-sync-migration-dialog-message = Harbor synchronizuje teraz okna na tym samym urządzeniu, dzięki czemu zmiany wprowadzone w jednym oknie są natychmiast odzwierciedlane w pozostałych.
harbor-window-sync-migration-dialog-learn-more = Dowiedz się więcej
harbor-window-sync-migration-dialog-accept = Rozumiem
harbor-appmenu-new-blank-window = 
    .label = Nowe puste okno
