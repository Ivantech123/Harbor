# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Live-Ordner-Optionen

harbor-live-folder-last-fetched =
    .label = Letzter Abruf: { $time }

harbor-live-folder-refresh =
    .label = Aktualisieren

harbor-live-folder-github-option-author-self =
    .label = Von mir erstellt

harbor-live-folder-github-option-assigned-self =
    .label = Mir zugewiesen

harbor-live-folder-github-option-review-requested =
    .label = Review-Anfragen

harbor-live-folder-github-option-include-drafts =
    .label = Entwurfs-Pull-Requests einbeziehen

harbor-live-folder-type-rss =
    .label = RSS-Feed

harbor-live-folder-option-fetch-interval =
    .label = Abrufintervall

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 Minute
      *[other] { $mins } Minuten
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 Stunde
      *[other] { $hours } Stunden
    }

harbor-live-folder-rss-option-time-range =
    .label = Zeitbereich

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Letzte Stunde
      *[other] Letzte { $hours } Stunden
    }

harbor-live-folder-time-range-all-time =
    .label = Gesamter Zeitraum

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Letzter Tag
      *[other] Letzte { $days } Tage
    }

harbor-live-folder-rss-option-item-limit =
    .label = Elementlimit

harbor-live-folder-rss-option-feed-url =
    .label = Feed-URL

harbor-live-folder-rss-prompt-feed-url = Bitte geben Sie die Feed-URL ein

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } Elemente

harbor-live-folder-failed-fetch =
    .label = Aktualisierung fehlgeschlagen
    .tooltiptext = Aktualisierung fehlgeschlagen. Versuchen Sie es erneut.

harbor-live-folder-github-no-auth =
    .label = Nicht bei GitHub angemeldet
    .tooltiptext = Melden Sie sich erneut bei GitHub an.

harbor-live-folder-github-no-filter =
    .label = Filter ist nicht festgelegt
    .tooltiptext = Kein Filter festgelegt, es wird nichts abgerufen.

harbor-live-folder-rss-invalid-url-title = Live-Ordner konnte nicht erstellt werden
harbor-live-folder-rss-invalid-url-description = Die Feed-URL ist ungültig. Überprüfen Sie die Adresse und versuchen Sie es erneut

harbor-live-folder-github-option-repo-filter =
    .label = Repositorys

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull Requests

harbor-live-folder-github-issues =
    .label = Issues

harbor-live-folder-github-option-repo-list-note =
    .label = Diese Liste wird basierend auf Ihren derzeit aktiven Pull Requests generiert.

harbor-live-folders-promotion-title = Live-Ordner erstellt!
harbor-live-folders-promotion-description = Die neuesten Inhalte Ihrer RSS-Feeds oder GitHub-Pull-Requests werden hier automatisch angezeigt.
