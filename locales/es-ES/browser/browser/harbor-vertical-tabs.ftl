# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Pestañas a la derecha
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Modo compacto
harbor-toolbar-context-compact-mode-enable = 
    .label = Habilitar modo compacto
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Ocultar barra lateral
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Ocultar barra de herramientas
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Ocultar ambas
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Mover a la carpeta...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nueva carpeta
    .accesskey = N
sidebar-harbor-expand = 
    .label = Expandir barra lateral
sidebar-harbor-create-new = 
    .label = Crear nuevo...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Suspender y cambiar de pestaña
           *[other] Suspender { $tabCount } pestañas y cambiar a la primera
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Restablecer y fijar pestaña
           *[other] Restablecer y fijar { $tabCount } pestañas
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Volver a la URL fijada
        [harbor-default-pinned-cmd] Separar de la pestaña fijada
       *[other] { $tabSubtitle }
    }
