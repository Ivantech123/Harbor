# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = текущий профиль
unified-extensions-description = Расширения дополняют функционал { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Сбросить важную вкладку
           *[false] Сбросить закрепленную вкладку
        }
    .accesskey = К
tab-context-harbor-add-essential = 
    .label = Добавить в важное
    .accesskey = У
tab-context-harbor-add-essential-badge = { $num }/{ $max } мест занято
tab-context-harbor-remove-essential = 
    .label = Удалить из важного
    .accesskey = К
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Изменить URL-адрес из важного
           *[false] Изменить закрепленный URL-адрес
        }
    .accesskey = З
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Заменить текущим URL-адресом
    .accesskey = С
tab-context-harbor-edit-pinned-url = 
    .label = Редактировать…
    .accesskey = У
tab-context-harbor-edit-title = 
    .label = Переименовать...
tab-context-harbor-edit-icon = 
    .label = Изменить значок...
harbor-themes-corrupted = Файл модов { -brand-short-name } повреждён. Тема сброшена к стандартной.
harbor-shortcuts-corrupted = Файл сочетаний клавиш { -brand-short-name } повреждён. Возвращены сочетания клавиш по умолчанию.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Новая адресная строка активирована, теперь нет необходимости использовать отдельные страницы для новых вкладок.<br/><br/>
    Попробуйте открыть новую вкладку, чтобы увидеть новую адресную строку в действии!
harbor-disable = Выключить
pictureinpicture-minimize-btn = 
    .aria-label = Свернуть
    .tooltip = Свернуть
harbor-panel-ui-gradient-generator-custom-color = Свой цвет
harbor-copy-current-url-confirmation = Адрес скопирован!
harbor-copy-current-url-as-markdown-confirmation = Текущий адрес скопирован как Markdown!
harbor-general-cancel-label = 
    .label = Отменить
harbor-general-confirm = 
    .label = Подтвердить
harbor-pinned-tab-replaced = Адрес закреплённой вкладки заменён на текущий адрес!
harbor-pinned-tab-url-edited = Ссылка на закрепленную вкладку обновлена!
harbor-pinned-tab-url-invalid = Это не похоже на допустимый URL.
harbor-pinned-tab-edit-url-title = Редактировать прикрепленный URL
harbor-pinned-tab-edit-url-label = Введите URL на который должна вести эта вкладка:
harbor-tabs-renamed = Вкладка успешно переименована!
harbor-background-tab-opened-toast = Открыта новая фоновая вкладка!
harbor-workspace-renamed-toast = Пространство успешно переименовано!
harbor-split-view-limit-toast = Невозможно добавить больше панелей в раздельный вид!
harbor-toggle-compact-mode-button = 
    .label = Компактный режим
    .tooltiptext = Переключить компактный режим

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Узнать больше
harbor-close-label = Закрыть
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Найти...
harbor-icons-picker-emoji = 
    .label = Эмодзи
harbor-icons-picker-svg = 
    .label = Иконки
harbor-emojis-picker-search = 
    .placeholder = Поиск эмодзи
urlbar-search-mode-zen_actions = Действия
harbor-site-data-settings = Настройки
harbor-generic-manage = Изменить
harbor-generic-more = Ещё
harbor-generic-next = Далее
harbor-essentials-promo-label = Добавить в важное
harbor-essentials-promo-sublabel = Доступ к любимым вкладкам в один клик
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Разрешено
harbor-site-data-setting-block = Запрещено
harbor-site-data-protections-enabled = Включено
harbor-site-data-protections-disabled = Отключено
harbor-site-data-setting-cross-site = Межсайтовые куки
harbor-site-data-security-info-extension = 
    .label = Расширение
harbor-site-data-security-info-secure = 
    .label = Безопасно
harbor-site-data-security-info-not-secure = 
    .label = Небезопасно
harbor-site-data-manage-addons = 
    .label = Управление расширениями
harbor-site-data-get-addons = 
    .label = Добавить расширения
harbor-site-data-site-settings = 
    .label = Все настройки сайта
harbor-site-data-header-share = 
    .tooltiptext = Поделиться страницей
harbor-site-data-header-reader-mode = 
    .tooltiptext = Режим чтения
harbor-site-data-header-screenshot = 
    .tooltiptext = Сделать снимок экрана
harbor-site-data-header-bookmark = 
    .tooltiptext = Добавить в закладки
harbor-urlbar-copy-url-button = 
    .tooltiptext = Скопировать URL
harbor-site-data-setting-site-protection = Защита от отслеживания

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Новый дом для расширений, разрешений и всего остального
harbor-site-data-panel-feature-callout-subtitle = Нажмите на значок для доступа к настройкам сайта, параметрам безопасности, расширениям и прочим действиям.
harbor-open-link-in-glance = 
    .label = Открыть ссылку в предпросмотре
    .accesskey = П
harbor-sidebar-notification-updated-heading = Обновление завершено!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Что нового в { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Примечания к выпуску
harbor-sidebar-notification-donate-label = Поддержать { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Поддержать проект
harbor-sidebar-notification-restart-safe-mode-label = Что-то пошло не так?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Перезапустить в безопасном режиме
harbor-window-sync-migration-dialog-title = Синхронизируйте окна
harbor-window-sync-migration-dialog-message = Теперь Harbor синхронизирует окна на одном устройстве, поэтому изменения в одном окне будут мгновенно отображаться в других.
harbor-window-sync-migration-dialog-learn-more = Узнать больше
harbor-window-sync-migration-dialog-accept = Понятно
harbor-appmenu-new-blank-window = 
    .label = Новое пустое окно
