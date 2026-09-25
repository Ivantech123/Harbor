# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Abas à direita
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Modo compacto
harbor-toolbar-context-compact-mode-enable = 
    .label = Ativar modo compacto
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Ocultar barra lateral
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Ocultar barra de ferramentas
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Esconder os dois
    .accesskey = A
harbor-toolbar-context-move-to-folder = 
    .label = Mover para Pasta...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nova Pasta
    .accesskey = N
sidebar-harbor-expand = 
    .label = Expandir barra lateral
sidebar-harbor-create-new = 
    .label = Criar Novo...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Suspender e alternar para a aba
           *[other] Suspender { $tabCount } abas e alternar para a primeira
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Redefinir e fixar aba
           *[other] Redefinir e fixar { $tabCount } abas
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Voltar para url fixada
        [harbor-default-pinned-cmd] Separar da aba fixada
       *[other] { $tabSubtitle }
    }
