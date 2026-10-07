# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right =
    .label = Подпрозорци вдясно
    .accesskey = Д

harbor-toolbar-context-compact-mode =
    .label = Компактен режим
harbor-toolbar-context-compact-mode-enable =
    .label = Включване на компактния режим
    .accesskey = В
harbor-toolbar-context-compact-mode-just-tabs =
    .label = Скриване на страничната лента
harbor-toolbar-context-compact-mode-just-toolbar =
    .label = Скриване на лентата с инструменти
harbor-toolbar-context-compact-mode-hide-both =
    .label = Скриване и на двете
    .accesskey = И

harbor-toolbar-context-move-to-folder =
    .label = Преместване в папка
    .accesskey = П

harbor-toolbar-context-new-folder =
    .label = Нова папка
    .accesskey = Н

sidebar-harbor-expand =
    .label = Разширяване на страничната лента

sidebar-harbor-create-new =
    .label = Създаване на нов подпрозорец

tabbrowser-unload-tab-button =
    .tooltiptext =
        { $tabCount ->
            [one] Разтоварване и превключване към подпрозореца
            *[other] Разтоварване на { $tabCount } подпрозорци и превключване към първия
        }

tabbrowser-reset-pin-button =
    .tooltiptext =
        { $tabCount ->
            [one] Нулиране и закрепване на подпрозореца
            *[other] Нулиране и закрепване на { $tabCount } подпрозорци
        }

harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Обратно към закрепения адрес
        [harbor-default-pinned-cmd] Отделяне от закрепения подпрозорец
        *[other] { $tabSubtitle }
    }
