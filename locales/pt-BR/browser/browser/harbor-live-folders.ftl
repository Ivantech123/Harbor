# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opções da pasta ao vivo

harbor-live-folder-last-fetched =
    .label = Última atualização: { $time }

harbor-live-folder-refresh =
    .label = Atualizar

harbor-live-folder-github-option-author-self =
    .label = Criados por mim

harbor-live-folder-github-option-assigned-self =
    .label = Atribuídos a mim

harbor-live-folder-github-option-review-requested =
    .label = Pedidos de revisão

harbor-live-folder-github-option-include-drafts =
    .label = Incluir pull requests em rascunho

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
    .label = Período

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Última hora
      *[other] Últimas { $hours } horas
    }

harbor-live-folder-time-range-all-time =
    .label = Todo o período

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Último dia
      *[other] Últimos { $days } dias
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limite de itens

harbor-live-folder-rss-option-feed-url =
    .label = URL do feed

harbor-live-folder-rss-prompt-feed-url = Insira a URL do feed

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } itens

harbor-live-folder-failed-fetch =
    .label = Não foi possível atualizar
    .tooltiptext = Não foi possível atualizar. Tente novamente.

harbor-live-folder-github-no-auth =
    .label = Não conectado ao GitHub
    .tooltiptext = Entre novamente no GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtro não definido
    .tooltiptext = Nenhum filtro definido; nenhum conteúdo será buscado.

harbor-live-folder-rss-invalid-url-title = Falha ao criar a pasta ao vivo
harbor-live-folder-rss-invalid-url-description = A URL do feed é inválida. Verifique o endereço e tente novamente

harbor-live-folder-github-option-repo-filter =
    .label = Repositórios

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requests

harbor-live-folder-github-issues =
    .label = Issues

harbor-live-folder-github-option-repo-list-note =
    .label = Esta lista é gerada com base nos pull requests que estão ativos no momento.

harbor-live-folders-promotion-title = Pasta ao vivo criada!
harbor-live-folders-promotion-description = O conteúdo mais recente dos seus feeds RSS ou pull requests do GitHub será exibido aqui automaticamente.
