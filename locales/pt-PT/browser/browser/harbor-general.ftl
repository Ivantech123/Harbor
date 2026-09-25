# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = perfil atual
unified-extensions-description = As extensões são usadas para trazer funcionalidades adicionais para o { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Repor Separador Essencial
           *[false] Repor Separador Fixado
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Adicionar aos Essenciais
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } espaços preenchidos
tab-context-harbor-remove-essential = 
    .label = Remover dos Essenciais
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
    .label = Alterar etiqueta...
tab-context-harbor-edit-icon = 
    .label = Alterar ícone...
harbor-themes-corrupted = O seu ficheiro de modificações do { -brand-short-name } está corrompido. Elas foram redefinidas como iguais às do tema padrão.
harbor-shortcuts-corrupted = O seu ficheiro de atalhos do { -brand-short-name } está corrompido. Eles foram redefinidos para os atalhos padrão.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    A nova barra de URL foi ativada, removendo a necessidade de páginas de novo separador.<br/><br/>
    Experimente abrir um novo separador para ver a nova barra de URL em ação!
harbor-disable = Desativar
pictureinpicture-minimize-btn = 
    .aria-label = Minimizar
    .tooltip = Minimizar
harbor-panel-ui-gradient-generator-custom-color = Cor personalizada
harbor-copy-current-url-confirmation = URL atual copiado!
harbor-copy-current-url-as-markdown-confirmation = URL atual copiado em Markdown!
harbor-general-cancel-label = 
    .label = Cancelar
harbor-general-confirm = 
    .label = Confirmar
harbor-pinned-tab-replaced = O URL do separador fixado foi substituído pelo URL atual.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Nome do separador alterado com sucesso!
harbor-background-tab-opened-toast = Novo separador aberto em segundo plano!
harbor-workspace-renamed-toast = Nome do espaço de trabalho alterado com sucesso!
harbor-split-view-limit-toast = Não é possível adicionar mais painéis à vista dividida!
harbor-toggle-compact-mode-button = 
    .label = Modo Compacto
    .tooltiptext = Alternar Modo Compacto

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Saber Mais
harbor-close-label = Fechar
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Pesquisar...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Ícones
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Ações
harbor-site-data-settings = Definições
harbor-generic-manage = Gerir
harbor-generic-more = Mais
harbor-generic-next = Seguinte
harbor-essentials-promo-label = Adicionar aos Essenciais
harbor-essentials-promo-sublabel = Mantenha os seus separadores favoritos a um clique de distância
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Permitido
harbor-site-data-setting-block = Bloqueado
harbor-site-data-protections-enabled = Ativado
harbor-site-data-protections-disabled = Desativado
harbor-site-data-setting-cross-site = Cookies entre sites
harbor-site-data-security-info-extension = 
    .label = Extensão
harbor-site-data-security-info-secure = 
    .label = Seguro
harbor-site-data-security-info-not-secure = 
    .label = Não Seguro
harbor-site-data-manage-addons = 
    .label = Gerir Extensões
harbor-site-data-get-addons = 
    .label = Adicionar Extensões
harbor-site-data-site-settings = 
    .label = Todas as Definições do Site
harbor-site-data-header-share = 
    .tooltiptext = Partilhar Esta Página
harbor-site-data-header-reader-mode = 
    .tooltiptext = Entrar no Modo Leitura
harbor-site-data-header-screenshot = 
    .tooltiptext = Tirar uma Captura de Ecrã
harbor-site-data-header-bookmark = 
    .tooltiptext = Adicionar esta Página aos Favoritos
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copiar URL
harbor-site-data-setting-site-protection = Proteção contra rastreio

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Uma nova casa para extensões, permissões e mais
harbor-site-data-panel-feature-callout-subtitle = Clique no ícone para gerir definições do site, ver informações de segurança, extensões de acesso e executar ações comuns.
harbor-open-link-in-glance = 
    .label = Abrir Link no Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Atualização Concluída!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = O que há de novo no { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Ver Notas de Lançamento
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Falhou alguma coisa?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Reiniciar em Modo de Segurança
harbor-window-sync-migration-dialog-title = Mantenha As Suas Janelas Sincronizadas
harbor-window-sync-migration-dialog-message = Agora, o Harbor sincroniza as janelas no dispositivo, pelo que alterações numa janela são refletidas instantaneamente nas outras.
harbor-window-sync-migration-dialog-learn-more = Saber Mais
harbor-window-sync-migration-dialog-accept = Entendido
harbor-appmenu-new-blank-window = 
    .label = Nova janela sem sincronização
