# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Reaaliaikaisen kansion asetukset

harbor-live-folder-last-fetched =
    .label = Viimeisin haku: { $time }

harbor-live-folder-refresh =
    .label = Päivitä

harbor-live-folder-github-option-author-self =
    .label = Minun luomani

harbor-live-folder-github-option-assigned-self =
    .label = Minulle määritetyt

harbor-live-folder-github-option-review-requested =
    .label = Arviointipyynnöt

harbor-live-folder-github-option-include-drafts =
    .label = Sisällytä luonnos-vetopyynnöt

harbor-live-folder-rss-type =
    .label = RSS-syöte

harbor-live-folder-option-fetch-interval =
    .label = Hakuväli

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuutti
      *[other] { $mins } minuuttia
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 tunti
      *[other] { $hours } tuntia
    }

harbor-live-folder-rss-option-time-range =
    .label = Aikaväli

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Viimeisin tunti
      *[other] Viimeiset { $hours } tuntia
    }

harbor-live-folder-time-range-all-time =
    .label = Kaikkiaika

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Viimeisin päivä
      *[other] Viimeiset { $days } päivää
    }

harbor-live-folder-rss-option-item-limit =
    .label = Kohteiden enimmäismäärä

harbor-live-folder-rss-option-feed-url =
    .label = Syötteen URL-osoite

harbor-live-folder-rss-prompt-feed-url = Anna syötteen URL-osoite

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } kohdetta

harbor-live-folder-failed-fetch =
    .label = Päivitys epäonnistui
    .tooltiptext = Päivitys epäonnistui. Yritä uudelleen.

harbor-live-folder-github-no-auth =
    .label = GitHubiin ei ole kirjautunut
    .tooltiptext = Kirjaudu uudelleen GitHubiin.

harbor-live-folder-github-no-filter =
    .label = Suodatinta ei ole asetettu
    .tooltiptext = Suodatinta ei ole asetettu, joten mitään ei haeta.

harbor-live-folder-rss-invalid-url-title = Reaaliaikaisen kansion luominen epäonnistui
harbor-live-folder-rss-invalid-url-description = Syötteen URL-osoite on virheellinen. Tarkista osoite ja yritä uudelleen

harbor-live-folder-github-option-repo-filter =
    .label = Repositoriot

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Vetopyynnöt

harbor-live-folder-github-issues =
    .label = Ongelmat

harbor-live-folder-github-option-repo-list-note =
    .label = Tämä luettelo on luotu tällä hetkellä aktiivisten vetopyyntöjesi perusteella.

harbor-live-folders-promotion-title = Reaaliaikainen kansio on luotu!
harbor-live-folders-promotion-description = RSS-syötteistäsi tai GitHubin vetopyyntöistäsi tuleva uusin sisältö näkyy täällä automaattisesti.
