# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opcije žive mape

harbor-live-folder-last-fetched =
    .label = Posljednje dohvatanje: { $time }

harbor-live-folder-refresh =
    .label = Osvježi

harbor-live-folder-github-option-author-self =
    .label = Kreirano od mene

harbor-live-folder-github-option-assigned-self =
    .label = Dodijeljeno meni

harbor-live-folder-github-option-review-requested =
    .label = Zahtjevi za pregled

harbor-live-folder-github-option-include-drafts =
    .label = Uključi skice zahtjeva za spajanje

harbor-live-folder-type-rss =
    .label = RSS izvor

harbor-live-folder-option-fetch-interval =
    .label = Interval dohvatanja

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuta
      *[other] { $mins } minuta
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 sat
      *[other] { $hours } sati
    }

harbor-live-folder-rss-option-time-range =
    .label = Vremenski opseg

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Posljednji sat
      *[other] Posljednjih { $hours } sati
    }

harbor-live-folder-time-range-all-time =
    .label = Sve do sada

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Posljednji dan
      *[other] Posljednjih { $days } dana
    }

harbor-live-folder-rss-option-item-limit =
    .label = Ograničenje broja stavki

harbor-live-folder-rss-option-feed-url =
    .label = URL RSS izvora

harbor-live-folder-rss-prompt-feed-url = Unesite URL RSS izvora

harbor-live-folder-rss-option-item-limit-num =
    .label = Broj stavki: { $limit }

harbor-live-folder-failed-fetch =
    .label = Dohvaćanje nije uspjelo
    .tooltiptext = Dohvaćanje nije uspjelo. Pokušajte ponovo.

harbor-live-folder-github-no-auth =
    .label = Niste prijavljeni na GitHub
    .tooltiptext = Ponovo se prijavite na GitHub.

harbor-live-folder-github-no-filter =
    .label = Filter nije postavljen
    .tooltiptext = Nijem postavljen filter, ništa se neće dohvatiti.

harbor-live-folder-rss-invalid-url-title = Kreiranje žive mape nije uspjelo
harbor-live-folder-rss-invalid-url-description = URL RSS izvora nije ispravan. Provjerite adresu i pokušajte ponovo

harbor-live-folder-github-option-repo-filter =
    .label = Repozitoriji

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Zahtjevi za spajanje

harbor-live-folder-github-issues =
    .label = Problemi

harbor-live-folder-github-option-repo-list-note =
    .label = Ova lista se generiše na osnovu vaših trenutno aktivnih zahtjeva za spajanje.

harbor-live-folders-promotion-title = Živa mapa je kreirana!
harbor-live-folders-promotion-description = Najnoviji sadržaj iz vaših RSS izvora ili vaših zahtjeva za spajanje na GitHubu automatski će se pojaviti ovdje.
