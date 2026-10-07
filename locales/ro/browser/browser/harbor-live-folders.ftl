# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opțiuni pentru dosarul live

harbor-live-folder-last-fetched =
    .label = Ultima preluare: { $time }

harbor-live-folder-refresh =
    .label = Reîmprospătare

harbor-live-folder-github-option-author-self =
    .label = Create de mine

harbor-live-folder-github-option-assigned-self =
    .label = Atribuite mie

harbor-live-folder-github-option-review-requested =
    .label = Solicitări de evaluare

harbor-live-folder-github-option-include-drafts =
    .label = Include pull request-urile în draft

harbor-live-folder-rss =
    .label = Flux RSS

harbor-live-folder-option-fetch-interval =
    .label = Interval de preluare

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minut
      *[other] { $mins } minute
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 oră
      *[other] { $hours } ore
    }

harbor-live-folder-rss-option-time-range =
    .label = Interval de timp

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Ultima oră
      *[other] Ultimele { $hours } ore
    }

harbor-live-folder-time-range-all-time =
    .label = Toate perioadele

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Ultima zi
      *[other] Ultimele { $days } zile
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limită de elemente

harbor-live-folder-rss-option-feed-url =
    .label = Adresa URL a fluxului

harbor-live-folder-rss-prompt-feed-url = Introduceți adresa URL a fluxului

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elemente

harbor-live-folder-failed-fetch =
    .label = Actualizarea a eșuat
    .tooltiptext = Actualizarea a eșuat. Încercați din nou.

harbor-live-folder-github-no-auth =
    .label = Nu sunteți autentificat pe GitHub
    .tooltiptext = Autentificați-vă din nou pe GitHub.

harbor-live-folder-github-no-filter =
    .label = Nu este setat niciun filtru
    .tooltiptext = Nu este setat niciun filtru, nu se va prelua nimic.

harbor-live-folder-rss-invalid-url-title = Crearea dosarului live a eșuat
harbor-live-folder-rss-invalid-url-description = Adresa URL a fluxului nu este validă. Verificați adresa și încercați din nou

harbor-live-folder-github-option-repo-filter =
    .label = Repository-uri

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull request-uri

harbor-live-folder-github-issues =
    .label = Probleme

harbor-live-folder-github-option-repo-list-note =
    .label = Această listă este generată pe baza pull request-urilor active în prezent.

harbor-live-folders-promotion-title = Dosar live creat!
harbor-live-folders-promotion-description = Cele mai recente conținuturi din fluxurile RSS sau din pull request-urile de pe GitHub vor apărea automat aici.
