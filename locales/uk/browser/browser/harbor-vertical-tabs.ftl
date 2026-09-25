# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Вкладки праворуч
    .accesskey = Р
harbor-toolbar-context-compact-mode = 
    .label = Компактний режим
harbor-toolbar-context-compact-mode-enable = 
    .label = Увімкнути компактний режим
    .accesskey = Ре
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Приховати бічну панель
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Приховати панель інструментів
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Приховувати обидві
    .accesskey = Н
harbor-toolbar-context-move-to-folder = 
    .label = Перемістити до теки...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Нова тека
    .accesskey = N
sidebar-harbor-expand = 
    .label = Розгорнути бічну панель
sidebar-harbor-create-new = 
    .label = Створити новий...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Вивантажити й перемкнутися на вкладку
            [few] Вивантажити { $tabCount } вкладки й перемкнутися до першої
           *[other] Вивантажити { $tabCount } вкладок й перемкнутися до першої
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Скинути та закріпити вкладку
            [few] Скинути та закріпити { $tabCount } вкладки
           *[other] Скинути та закріпити { $tabCount } вкладок
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Назад до закріпленої URL-адреси
        [harbor-default-pinned-cmd] Відокремити від закріпленої вкладки
       *[other] { $tabSubtitle }
    }
