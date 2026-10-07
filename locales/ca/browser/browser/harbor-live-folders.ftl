# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opcions de la carpeta en viu

harbor-live-folder-last-fetched =
    .label = Última consulta: { $time }

harbor-live-folder-refresh =
    .label = Actualitza

harbor-live-folder-github-option-author-self =
    .label = Creat per mi

harbor-live-folder-github-option-assigned-self =
    .label = Assignat a mi

harbor-live-folder-github-option-review-requested =
    .label = Sol·licituds de revisió

harbor-live-folder-github-option-include-drafts =
    .label = Inclou les sol·licituds d'integració en esborrany

harbor-live-folder-rss-type =
    .label = Font RSS

harbor-live-folder-option-fetch-interval =
    .label = Interval de consulta

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minut
      *[other] { $mins } minuts
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 hora
      *[other] { $hours } hores
    }

harbor-live-folder-rss-option-time-range =
    .label = Interval de temps

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Última hora
      *[other] Últimes { $hours } hores
    }

harbor-live-folder-time-range-all-time =
    .label = Tot el temps

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Últim dia
      *[other] Últims { $days } dies
    }

harbor-live-folder-rss-option-item-limit =
    .label = Límit d'elements

harbor-live-folder-rss-option-feed-url =
    .label = URL de la font

harbor-live-folder-rss-prompt-feed-url = Introduïu l'URL de la font

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elements

harbor-live-folder-failed-fetch =
    .label = No s'ha pogut actualitzar
    .tooltiptext = No s'ha pogut actualitzar. Torneu-ho a provar.

harbor-live-folder-github-no-auth =
    .label = No has iniciat la sessió a GitHub
    .tooltiptext = Torna a iniciar la sessió a GitHub.

harbor-live-folder-github-no-filter =
    .label = No s'ha definit el filtre
    .tooltiptext = No s'ha definit cap filtre; no es recuperarà res.

harbor-live-folder-rss-invalid-url-title = No s'ha pogut crear la carpeta en viu
harbor-live-folder-rss-invalid-url-description = L'URL de la font no és vàlida. Comproveu l'adreça i torneu-ho a provar

harbor-live-folder-github-option-repo-filter =
    .label = Repositoris

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Sol·licituds d'integració

harbor-live-folder-github-issues =
    .label = Incidències

harbor-live-folder-github-option-repo-list-note =
    .label = Aquesta llista es genera a partir de les teves sol·licituds d'integració actualment actives.

harbor-live-folders-promotion-title = S'ha creat la carpeta en viu!
harbor-live-folders-promotion-description = El contingut més recent de les teves fonts RSS o de les sol·licituds d'integració de GitHub apareixerà aquí automàticament.
