# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opties voor live map

harbor-live-folder-last-fetched =
    .label = Laatst opgehaald: { $time }

harbor-live-folder-refresh =
    .label = Vernieuwen

harbor-live-folder-github-option-author-self =
    .label = Door mij aangemaakt

harbor-live-folder-github-option-assigned-self =
    .label = Aan mij toegewezen

harbor-live-folder-github-option-review-requested =
    .label = Reviewverzoeken

harbor-live-folder-github-option-include-drafts =
    .label = Concept-pullrequests opnemen

harbor-live-folder-type-rss =
    .label = RSS-feed

harbor-live-folder-option-fetch-interval =
    .label = Ophaalinterval

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuut
      *[other] { $mins } minuten
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 uur
      *[other] { $hours } uur
    }

harbor-live-folder-rss-option-time-range =
    .label = Tijdsbereik

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Laatste uur
      *[other] Laatste { $hours } uur
    }

harbor-live-folder-time-range-all-time =
    .label = Alle tijd

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Laatste dag
      *[other] Laatste { $days } dagen
    }

harbor-live-folder-rss-option-item-limit =
    .label = Itemlimiet

harbor-live-folder-rss-option-feed-url =
    .label = Feed-URL

harbor-live-folder-rss-prompt-feed-url = Voer de feed-URL in

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } items

harbor-live-folder-failed-fetch =
    .label = Bijwerken mislukt
    .tooltiptext = Bijwerken mislukt. Probeer het opnieuw.

harbor-live-folder-github-no-auth =
    .label = Niet aangemeld bij GitHub
    .tooltiptext = Meld je opnieuw aan bij GitHub.

harbor-live-folder-github-no-filter =
    .label = Filter is niet ingesteld
    .tooltiptext = Er is geen filter ingesteld, dus er wordt niets opgehaald.

harbor-live-folder-rss-invalid-url-title = Kan de live map niet aanmaken
harbor-live-folder-rss-invalid-url-description = De feed-URL is ongeldig. Controleer het adres en probeer het opnieuw

harbor-live-folder-github-option-repo-filter =
    .label = Repositories

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requests

harbor-live-folder-github-issues =
    .label = Issues

harbor-live-folder-github-option-repo-list-note =
    .label = Deze lijst wordt gegenereerd op basis van je momenteel actieve pull requests.

harbor-live-folders-promotion-title = Live map aangemaakt!
harbor-live-folders-promotion-description = De meest recente inhoud van je RSS-feeds of GitHub-pullrequests verschijnt hier automatisch.
