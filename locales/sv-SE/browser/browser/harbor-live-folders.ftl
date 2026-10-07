# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Alternativ för live-mapp

harbor-live-folder-last-fetched =
    .label = Senaste hämtning: { $time }

harbor-live-folder-refresh =
    .label = Uppdatera

harbor-live-folder-github-option-author-self =
    .label = Skapad av mig

harbor-live-folder-github-option-assigned-self =
    .label = Tilldelad till mig

harbor-live-folder-github-option-review-requested =
    .label = Granskningsförfrågningar

harbor-live-folder-github-option-include-drafts =
    .label = Inkludera pull requests i utkast

harbor-live-folder-type-rss =
    .label = RSS-flöde

harbor-live-folder-option-fetch-interval =
    .label = Hämtningsintervall

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minut
      *[other] { $mins } minuter
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 timme
      *[other] { $hours } timmar
    }

harbor-live-folder-rss-option-time-range =
    .label = Tidsintervall

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Senaste timmen
      *[other] Senaste { $hours } timmarna
    }

harbor-live-folder-time-range-all-time =
    .label = Alltid

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Senaste dagen
      *[other] Senaste { $days } dagarna
    }

harbor-live-folder-rss-option-item-limit =
    .label = Objektgräns

harbor-live-folder-rss-option-feed-url =
    .label = Flödes-URL

harbor-live-folder-rss-prompt-feed-url = Ange flödes-URL

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } objekt

harbor-live-folder-failed-fetch =
    .label = Det gick inte att uppdatera
    .tooltiptext = Det gick inte att uppdatera. Försök igen.

harbor-live-folder-github-no-auth =
    .label = Inte inloggad på GitHub
    .tooltiptext = Logga in på GitHub igen.

harbor-live-folder-github-no-filter =
    .label = Filtret är inte inställt
    .tooltiptext = Inget filter har angetts, ingenting hämtas.

harbor-live-folder-rss-invalid-url-title = Det gick inte att skapa live-mappen
harbor-live-folder-rss-invalid-url-description = Flödes-URL:en är ogiltig. Kontrollera adressen och försök igen

harbor-live-folder-github-option-repo-filter =
    .label = Repositorier

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requests

harbor-live-folder-github-issues =
    .label = Ärenden

harbor-live-folder-github-option-repo-list-note =
    .label = Den här listan skapas utifrån dina aktuella pull requests.

harbor-live-folders-promotion-title = Live-mappen har skapats!
harbor-live-folders-promotion-description = Det senaste innehållet i dina RSS-flöden eller GitHub-pull requests visas här automatiskt.
