# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Innstillinger for sanntidsmappe

harbor-live-folder-last-fetched =
    .label = Sist hentet: { $time }

harbor-live-folder-refresh =
    .label = Oppdater

harbor-live-folder-github-option-author-self =
    .label = Opprettet av meg

harbor-live-folder-github-option-assigned-self =
    .label = Tildelt meg

harbor-live-folder-github-option-review-requested =
    .label = Forespørsler om gjennomgang

harbor-live-folder-github-option-include-drafts =
    .label = Inkluder utkast til pull requests

harbor-live-folder-type-rss =
    .label = RSS-strøm

harbor-live-folder-option-fetch-interval =
    .label = Henteintervall

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minutt
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
      [one] Siste time
      *[other] Siste { $hours } timer
    }

harbor-live-folder-time-range-all-time =
    .label = Hele perioden

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Siste dag
      *[other] Siste { $days } dager
    }

harbor-live-folder-rss-option-item-limit =
    .label = Maks. antall elementer

harbor-live-folder-rss-option-feed-url =
    .label = URL til strøm

harbor-live-folder-rss-prompt-feed-url = Skriv inn URL-en til strømmen

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elementer

harbor-live-folder-failed-fetch =
    .label = Oppdateringen mislyktes
    .tooltiptext = Oppdateringen mislyktes. Prøv igjen.

harbor-live-folder-github-no-auth =
    .label = Ikke logget inn på GitHub
    .tooltiptext = Logg inn på GitHub igjen.

harbor-live-folder-github-no-filter =
    .label = Filter er ikke angitt
    .tooltiptext = Det er ikke angitt noe filter, så ingenting vil bli hentet.

harbor-live-folder-rss-invalid-url-title = Klarte ikke å opprette sanntidsmappen
harbor-live-folder-rss-invalid-url-description = URL-en til strømmen er ugyldig. Kontroller adressen og prøv igjen

harbor-live-folder-github-option-repo-filter =
    .label = Repositorier

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requests

harbor-live-folder-github-issues =
    .label = Saker

harbor-live-folder-github-option-repo-list-note =
    .label = Denne listen genereres basert på de aktive pull requestsene du har.

harbor-live-folders-promotion-title = Sanntidsmappe opprettet!
harbor-live-folders-promotion-description = Det nyeste innholdet fra RSS-strømmene dine eller pull requestsene dine på GitHub vises automatisk her.
