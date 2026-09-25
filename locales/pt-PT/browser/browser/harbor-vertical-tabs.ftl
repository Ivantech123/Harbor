# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Separadores à direita
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Modo compacto
harbor-toolbar-context-compact-mode-enable = 
    .label = Ativar modo compacto
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Ocultar a barra lateral
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Ocultar a barra de ferramentas
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Ocultar ambas
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Mover para Pasta...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nova Pasta
    .accesskey = N
sidebar-harbor-expand = 
    .label = Expandir Barra Lateral
sidebar-harbor-create-new = 
    .label = Criar Novo...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Hibernar e mudar para o separador
           *[other] Hibernar { $tabCount } separadores e mudar para o primeiro
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Restaurar e fixar separador
           *[other] Restaurar e fixar { $tabCount } separadores
        }
harbor-tab-sublabel =
    rl{ $tabSubtitle ->
        [harbor-default-pinned] Voltar para URL fixado
        [harbor-default-pinned-cmd] Separar do separador fixado
       *[other] { $tabSubtitle }
    }
