# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = поточний профіль
unified-extensions-description = Розширення використовуються, щоб додати більше функціональних можливостей до { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Скинути основну вкладку
           *[false] Скинути закріплену вкладку
        }
    .accesskey = Р
tab-context-harbor-add-essential = 
    .label = Додати до необхідного
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } комірок заповнено
tab-context-harbor-remove-essential = 
    .label = Вилучити з основних елементів
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
    .label = Змінити мітку...
tab-context-harbor-edit-icon = 
    .label = Змінити значок...
harbor-themes-corrupted = Ваш файл модифікацій { -brand-short-name } пошкоджено. Вони були скинуті до типової теми.
harbor-shortcuts-corrupted = Ваш файл { -brand-short-name } комбінацій пошкоджено. Їх було скинуто до типових комбінацій.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Увімкнено новий рядок URL-адрес, що усуває потребу в нових сторінках вкладок.<br/><br/>
    Спробуйте відкрити нову вкладку, щоб побачити новий рядок URL-адреси в дії!
harbor-disable = Вимкнути
pictureinpicture-minimize-btn = 
    .aria-label = Згорнути
    .tooltip = Згорнути
harbor-panel-ui-gradient-generator-custom-color = Власний колір
harbor-copy-current-url-confirmation = Скопійовано поточну URL-адресу!
harbor-copy-current-url-as-markdown-confirmation = Скопійовано поточну URL-адресу як Markdown!
harbor-general-cancel-label = 
    .label = Скасувати
harbor-general-confirm = 
    .label = Підтвердити
harbor-pinned-tab-replaced = URL-адресу закріпленої вкладки замінено на поточну URL-адресу.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Вкладку успішно перейменовано!
harbor-background-tab-opened-toast = Відкрито нову фонову вкладку!
harbor-workspace-renamed-toast = Робочий простір успішно перейменовано!
harbor-split-view-limit-toast = Неможливо додати більше панелей до розділеного перегляду!
harbor-toggle-compact-mode-button = 
    .label = Компактний режим
    .tooltiptext = Увімк. / Вимк. компактний режим

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Дізнатися більше
harbor-close-label = Закрити
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Пошук...
harbor-icons-picker-emoji = 
    .label = Емоджі
harbor-icons-picker-svg = 
    .label = Значки
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Дії
harbor-site-data-settings = Налаштування
harbor-generic-manage = Керувати
harbor-generic-more = Більше
harbor-generic-next = Далі
harbor-essentials-promo-label = Додати до необхідного
harbor-essentials-promo-sublabel = Тримайте ваші улюблені вкладки на відстані одного клацу
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Дозволено
harbor-site-data-setting-block = Заблоковано
harbor-site-data-protections-enabled = Увімкнено
harbor-site-data-protections-disabled = Вимкнено
harbor-site-data-setting-cross-site = Міжсайтові cookie
harbor-site-data-security-info-extension = 
    .label = Розширення
harbor-site-data-security-info-secure = 
    .label = Захищено
harbor-site-data-security-info-not-secure = 
    .label = Не захищено
harbor-site-data-manage-addons = 
    .label = Керування розширеннями
harbor-site-data-get-addons = 
    .label = Додати розширення
harbor-site-data-site-settings = 
    .label = Усі налаштування сайту
harbor-site-data-header-share = 
    .tooltiptext = Поділитися цією сторінкою
harbor-site-data-header-reader-mode = 
    .tooltiptext = Увійти у режим читання
harbor-site-data-header-screenshot = 
    .tooltiptext = Зробити знімок екрана
harbor-site-data-header-bookmark = 
    .tooltiptext = Додати цю сторінку в закладки
harbor-urlbar-copy-url-button = 
    .tooltiptext = Копіювати URL-адресу
harbor-site-data-setting-site-protection = Захист від відстеження

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Новий дім для доповнень, дозволів тощо
harbor-site-data-panel-feature-callout-subtitle = Натисніть значок, щоби керувати налаштуваннями сайту, переглядати інформацію про безпеку, отримувати доступ до розширень і виконувати поширені дії.
harbor-open-link-in-glance = 
    .label = Відкрити посилання в передперегляді
    .accesskey = G
harbor-sidebar-notification-updated-heading = Оновлення завершено!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Що нового в { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Переглянути примітки до випуску
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Щось зламалося?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Перезапустити в безпечному режимі
harbor-window-sync-migration-dialog-title = Тримати ваші вікна синхронізованими
harbor-window-sync-migration-dialog-message = Harbor тепер синхронізує вікна на одному пристрої, тому зміни в одному вікні миттєво показуватимуться в інших.
harbor-window-sync-migration-dialog-learn-more = Дізнатися більше
harbor-window-sync-migration-dialog-accept = Зрозуміло
harbor-appmenu-new-blank-window = 
    .label = Нове несинхронізоване вікно
