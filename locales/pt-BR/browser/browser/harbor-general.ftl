# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = Perfil atual
unified-extensions-description = As extensões são usadas para trazer mais recursos adicionais para o { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reiniciar Aba Essencial
           *[false] Reiniciar Aba Fixada
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Adicionar aos Essenciais
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } Espaços preenchidos
tab-context-harbor-remove-essential = 
    .label = Remover dos Essenciais
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Editar URL Essencial
           *[false] Editar URL Fixada
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Substituir por URL atual
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Editar…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Alterar Rótulo...
tab-context-harbor-edit-icon = 
    .label = Alterar Ícone...
harbor-themes-corrupted = Seu arquivo de modificações { -brand-short-name } está corrompido. Eles foram redefinidos para o tema padrão.
harbor-shortcuts-corrupted = Seu arquivo de atalhos { -brand-short-name } está corrompido. Eles foram redefinidos para os atalhos padrão.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification = A nova barra de URL foi ativada, removendo a necessidade de novas páginas de guia.<br/><br/>Tente abrir uma nova guia para ver a nova barra de URL em ação!
harbor-disable = Desativar
pictureinpicture-minimize-btn = 
    .aria-label = Minimizar
    .tooltip = Minimizar
harbor-panel-ui-gradient-generator-custom-color = Cor Personalizada
harbor-copy-current-url-confirmation = URL atual copiada!
harbor-copy-current-url-as-markdown-confirmation = URL atual copiada como Markdown!
harbor-general-cancel-label = 
    .label = Cancelar
harbor-general-confirm = 
    .label = Confirmar
harbor-pinned-tab-replaced = A URL da aba fixada foi substituída pela URL atual!
harbor-pinned-tab-url-edited = A URL da aba fixada foi atualizada!
harbor-pinned-tab-url-invalid = Isso não parece ser uma URL válida.
harbor-pinned-tab-edit-url-title = Editar URL Fixada
harbor-pinned-tab-edit-url-label = Digite a URL que esta aba fixada deve apontar para:
harbor-tabs-renamed = A aba foi renomeada com sucesso!
harbor-background-tab-opened-toast = Nova aba em segundo plano aberta!
harbor-workspace-renamed-toast = A área de trabalho foi renomeada com sucesso!
harbor-split-view-limit-toast = Não é possível adicionar mais painéis à visualização dividida!
harbor-toggle-compact-mode-button = 
    .label = Modo Compacto
    .tooltiptext = Alternar Modo Compacto

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Saiba Mais
harbor-close-label = Fechar
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Pesquisar...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Ícones
harbor-emojis-picker-search = 
    .placeholder = Procurar emojis
urlbar-search-mode-zen_actions = Ações
harbor-site-data-settings = Configurações
harbor-generic-manage = Gerenciar
harbor-generic-more = Mais
harbor-generic-next = Próximo
harbor-essentials-promo-label = Adicionar aos Essenciais
harbor-essentials-promo-sublabel = Mantenha suas abas favoritas a um clique de distância
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Permitido
harbor-site-data-setting-block = Bloqueado
harbor-site-data-protections-enabled = Habilitado
harbor-site-data-protections-disabled = Desabilitado
harbor-site-data-setting-cross-site = Cookie entre Sites
harbor-site-data-security-info-extension = 
    .label = Extensão
harbor-site-data-security-info-secure = 
    .label = Seguro
harbor-site-data-security-info-not-secure = 
    .label = Não seguro
harbor-site-data-manage-addons = 
    .label = Gerenciar Extensões
harbor-site-data-get-addons = 
    .label = Adicionar Extensões
harbor-site-data-site-settings = 
    .label = Todas as Configurações do Site
harbor-site-data-header-share = 
    .tooltiptext = Compartilhar Esta Página
harbor-site-data-header-reader-mode = 
    .tooltiptext = Entrar no Modo Leitura
harbor-site-data-header-screenshot = 
    .tooltiptext = Tirar Captura de Tela
harbor-site-data-header-bookmark = 
    .tooltiptext = Marcar Esta Página
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copiar URL
harbor-site-data-setting-site-protection = Proteção contra Rastreamento

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Um novo lar para extensões, permissões e mais
harbor-site-data-panel-feature-callout-subtitle = Clique no ícone para gerenciar configurações do site, visualizar informações de segurança, acessar extensões e realizar ações comuns.
harbor-open-link-in-glance = 
    .label = Abrir Link no Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Atualização Completa!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = O que há de novo em { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Ver Notas da Versão
harbor-sidebar-notification-donate-label = Apoie { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Doe para o projeto
harbor-sidebar-notification-restart-safe-mode-label = Algo quebrou?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Reiniciar no Modo Seguro
harbor-window-sync-migration-dialog-title = Mantenha Suas Janelas em Sincronia
harbor-window-sync-migration-dialog-message = Harbor agora sincroniza as janelas no mesmo dispositivo, assim as mudanças feitas em uma janela são refletidas para as outras instantaneamente.
harbor-window-sync-migration-dialog-learn-more = Saiba Mais
harbor-window-sync-migration-dialog-accept = Entendi
harbor-appmenu-new-blank-window = 
    .label = Nova janela em branco
