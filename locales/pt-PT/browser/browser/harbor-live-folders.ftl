# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opções da pasta em direto

harbor-live-folder-last-fetched =
    .label = Última atualização: { $time }

harbor-live-folder-refresh =
    .label = Atualizar

harbor-live-folder-github-option-author-self =
    .label = Criado por mim

harbor-live-folder-github-option-assigned-self =
    .label = Atribuído a mim

harbor-live-folder-github-option-review-requested =
    .label = Pedidos de revisão

harbor-live-folder-github-option-include-drafts =
    .label = Incluir pedidos de integração em rascunho

harbor-live-folder-type-rss =
    .label = Feed RSS

harbor-live-folder-option-fetch-interval =
    .label = Intervalo de atualização

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuto
      *[other] { $mins } minutos
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 hora
      *[other] { $hours } horas
    }

harbor-live-folder-rss-option-time-range =
    .label = Intervalo de tempo

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Última hora
      *[other] Últimas { $hours } horas
    }

harbor-live-folder-time-range-all-time =
    .label = Todo o histórico

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Último dia
      *[other] Últimos { $days } dias
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limite de itens

harbor-live-folder-rss-option-feed-url =
    .label = URL do feed

harbor-live-folder-rss-prompt-feed-url = Introduza o URL do feed

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } itens

harbor-live-folder-failed-fetch =
    .label = Falha ao atualizar
    .tooltiptext = Não foi possível atualizar. Tente novamente.

harbor-live-folder-github-no-auth =
    .label = Não tem sessão iniciada no GitHub
    .tooltiptext = Inicie sessão novamente no GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtro não definido
    .tooltiptext = Não há filtro definido; nada será atualizado.

harbor-live-folder-rss-invalid-url-title = Não foi possível criar a pasta em direto
harbor-live-folder-rss-invalid-url-description = O URL do feed é inválido. Verifique o endereço e tente novamente

harbor-live-folder-github-option-repo-filter =
    .label = Repositórios

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pedidos de integração

harbor-live-folder-github-issues =
    .label = Problemas

harbor-live-folder-github-option-repo-list-note =
    .label = Esta lista é gerada com base nos seus pedidos de integração ativos neste momento.

harbor-live-folders-promotion-title = Pasta em direto criada!
harbor-live-folders-promotion-description = O conteúdo mais recente dos seus feeds RSS ou dos pedidos de integração do GitHub aparecerá aqui automaticamente.
