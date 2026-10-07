# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opzioni della cartella live

harbor-live-folder-last-fetched =
    .label = Ultimo recupero: { $time }

harbor-live-folder-refresh =
    .label = Aggiorna

harbor-live-folder-github-option-author-self =
    .label = Creati da me

harbor-live-folder-github-option-assigned-self =
    .label = Assegnati a me

harbor-live-folder-github-option-review-requested =
    .label = Richieste di revisione

harbor-live-folder-github-option-include-drafts =
    .label = Includi le pull request in bozza

harbor-live-folder-type-rss =
    .label = Feed RSS

harbor-live-folder-option-fetch-interval =
    .label = Intervallo di recupero

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuto
      *[other] { $mins } minuti
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 ora
      *[other] { $hours } ore
    }

harbor-live-folder-rss-option-time-range =
    .label = Intervallo di tempo

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Ultima ora
      *[other] Ultime { $hours } ore
    }

harbor-live-folder-time-range-all-time =
    .label = Dall'inizio

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Ultimo giorno
      *[other] Ultimi { $days } giorni
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limite di elementi

harbor-live-folder-rss-option-feed-url =
    .label = URL del feed

harbor-live-folder-rss-prompt-feed-url = Inserisci l'URL del feed

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elementi

harbor-live-folder-failed-fetch =
    .label = Aggiornamento non riuscito
    .tooltiptext = Aggiornamento non riuscito. Riprova.

harbor-live-folder-github-no-auth =
    .label = Accesso a GitHub non effettuato
    .tooltiptext = Accedi nuovamente a GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtro non impostato
    .tooltiptext = Nessun filtro impostato, non verrà recuperato nulla.

harbor-live-folder-rss-invalid-url-title = Impossibile creare la cartella live
harbor-live-folder-rss-invalid-url-description = L'URL del feed non è valido. Controlla l'indirizzo e riprova

harbor-live-folder-github-option-repo-filter =
    .label = Repository

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull request

harbor-live-folder-github-issues =
    .label = Issue

harbor-live-folder-github-option-repo-list-note =
    .label = Questo elenco è generato in base alle pull request attive al momento.

harbor-live-folders-promotion-title = Cartella live creata!
harbor-live-folders-promotion-description = Qui verrà mostrato automaticamente il contenuto più recente dei tuoi feed RSS o delle tue pull request su GitHub.
