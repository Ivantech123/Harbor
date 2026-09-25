# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = текущ профил
unified-extensions-description = Разширенията се използват за добавяне на допълнителна функционалност към { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Essential Tab
           *[false] Reset Pinned Tab
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Добавяне към Основни
    .accesskey = E
tab-context-harbor-add-essential-badge = Запълнени слотове: { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Премахване от Основни
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
    .label = Промени етикета...
tab-context-harbor-edit-icon = 
    .label = Промени иконата...
harbor-themes-corrupted = Файлът с модификации на { -brand-short-name } е повреден. Те бяха нулирани до темата по подразбиране.
harbor-shortcuts-corrupted = Файлът с клавишни комбинации на { -brand-short-name } е повреден. Комбинациите бяха нулирани до настройките по подразбиране.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Новата адресна лента е активирана, което премахва нуждата от страници за нов раздел.<br/><br/>
    Опитай да отвориш нов раздел, за да видиш новата адресна лента в действие!
harbor-disable = Изключи
pictureinpicture-minimize-btn = 
    .aria-label = Минимизирай
    .tooltip = Минимизирай
harbor-panel-ui-gradient-generator-custom-color = Персонализиран цвят
harbor-copy-current-url-confirmation = Текущият адрес е копиран!
harbor-copy-current-url-as-markdown-confirmation = Copied current URL as Markdown!
harbor-general-cancel-label = 
    .label = Отказ
harbor-general-confirm = 
    .label = Потвърди
harbor-pinned-tab-replaced = Адресът на закачения раздел беше заменен с текущия адрес!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Разделът беше успешно преименуван!
harbor-background-tab-opened-toast = Отворен е нов раздел на заден план!
harbor-workspace-renamed-toast = Работното пространство беше преименувано успешно!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Компактен изглед
    .tooltiptext = Превключи компактен режим

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Научи повече
harbor-close-label = Затвори
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Търси...
harbor-icons-picker-emoji = 
    .label = Емоджита
harbor-icons-picker-svg = 
    .label = Икони
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Действия
harbor-site-data-settings = Настройки
harbor-generic-manage = Управление
harbor-generic-more = Повече
harbor-generic-next = Напред
harbor-essentials-promo-label = Добави към Основни
harbor-essentials-promo-sublabel = Дръж любимите си раздели само на един клик разстояние
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Позволено
harbor-site-data-setting-block = Блокирани
harbor-site-data-protections-enabled = Включено
harbor-site-data-protections-disabled = Изключено
harbor-site-data-setting-cross-site = Междусайтови бисквитки
harbor-site-data-security-info-extension = 
    .label = Разширение
harbor-site-data-security-info-secure = 
    .label = Защитено
harbor-site-data-security-info-not-secure = 
    .label = Няма защита
harbor-site-data-manage-addons = 
    .label = Управление на разширения
harbor-site-data-get-addons = 
    .label = Добавяне на разширения
harbor-site-data-site-settings = 
    .label = Всички настройки за сайтове
harbor-site-data-header-share = 
    .tooltiptext = Сподели тази страница
harbor-site-data-header-reader-mode = 
    .tooltiptext = Отвори режим на четене
harbor-site-data-header-screenshot = 
    .tooltiptext = Направи екранна снимка
harbor-site-data-header-bookmark = 
    .tooltiptext = Добави тази страница в отметки
harbor-urlbar-copy-url-button = 
    .tooltiptext = Копирай адрес
harbor-site-data-setting-site-protection = Защита от проследяване

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Ново място за добавки, разширения и още
harbor-site-data-panel-feature-callout-subtitle = Натисни върху иконата, за да управляваш настройките на сайта, да видиш информацията за сигурността, да получиш достъп до разширенията и да извършваш често използвани действия.
harbor-open-link-in-glance = 
    .label = Отвори връзката в Glance
    .accesskey = Ж
harbor-sidebar-notification-updated-heading = Актуализацията е завършена!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Какво е ново в { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Виж бележките към изданието
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Има проблем?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Рестартирай в безопасен режим
harbor-window-sync-migration-dialog-title = Синхронизирай прозорците си
harbor-window-sync-migration-dialog-message = Harbor вече синхронизира прозорците на едно и също устройство, така че промените в един прозорец се отразяват незабавно във всички останали.
harbor-window-sync-migration-dialog-learn-more = Научи повече
harbor-window-sync-migration-dialog-accept = Добре
harbor-appmenu-new-blank-window = 
    .label = New blank window
