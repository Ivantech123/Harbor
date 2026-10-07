# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Indstillinger for live mappe

harbor-live-folder-last-fetched =
    .label = Seneste hentning: { $time }

harbor-live-folder-refresh =
    .label = Opdater

harbor-live-folder-github-option-author-self =
    .label = Oprettet af mig

harbor-live-folder-github-option-assigned-self =
    .label = Tildelt mig

harbor-live-folder-github-option-review-requested =
    .label = Anmodninger om gennemgang

harbor-live-folder-github-option-include-drafts =
    .label = Inkludér udkast af pull requests

harbor-live-folder-type-rss =
    .label = RSS-feed

harbor-live-folder-option-fetch-interval =
    .label = Hentningsinterval

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minut
      *[other] { $mins } minutter
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 time
      *[other] { $hours } timer
    }

harbor-live-folder-rss-option-time-range =
    .label = Tidsperiode

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Seneste time
      *[other] Seneste { $hours } timer
    }

harbor-live-folder-time-range-all-time =
    .label = Hele perioden

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Seneste døgn
      *[other] Seneste { $days } dage
    }

harbor-live-folder-rss-option-item-limit =
    .label = Elementgrænse

harbor-live-folder-rss-option-feed-url =
    .label = Feed-URL

harbor-live-folder-rss-prompt-feed-url = Angiv feed-URL'en

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elementer

harbor-live-folder-failed-fetch =
    .label = Opdateringen mislykkedes
    .tooltiptext = Opdateringen mislykkedes. Prøv igen.

harbor-live-folder-github-no-auth =
    .label = Ikke logget ind på GitHub
    .tooltiptext = Log ind på GitHub igen.

harbor-live-folder-github-no-filter =
    .label = Filteret er ikke angivet
    .tooltiptext = Der hentes intet, fordi der ikke er angivet et filter.

harbor-live-folder-rss-invalid-url-title = Kunne ikke oprette den live mappe
harbor-live-folder-rss-invalid-url-description = Feed-URL'en er ugyldig. Kontrollér adressen, og prøv igen

harbor-live-folder-github-option-repo-filter =
    .label = Repositorier

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requests

harbor-live-folder-github-issues =
    .label = Issues

harbor-live-folder-github-option-repo-list-note =
    .label = Denne liste genereres ud fra dine aktive pull requests.

harbor-live-folders-promotion-title = Live mappe oprettet!
harbor-live-folders-promotion-description = Det nyeste indhold fra dine RSS-feeds eller dine GitHub-pull requests vises automatisk her.
