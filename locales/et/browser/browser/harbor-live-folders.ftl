# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Reaalkausta valikud

harbor-live-folder-last-fetched =
    .label = Viimati uuendatud: { $time }

harbor-live-folder-refresh =
    .label = Värskenda

harbor-live-folder-github-option-author-self =
    .label = Minu loodud

harbor-live-folder-github-option-assigned-self =
    .label = Minule määratud

harbor-live-folder-github-option-review-requested =
    .label = Ülevaatusepäringud

harbor-live-folder-github-option-include-drafts =
    .label = Kaasa tõmbepäringute mustandid

harbor-live-folder-type-rss =
    .label = RSS-voog

harbor-live-folder-option-fetch-interval =
    .label = Uuendusintervall

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minut
      *[other] { $mins } minutit
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 tund
      *[other] { $hours } tundi
    }

harbor-live-folder-rss-option-time-range =
    .label = Ajavahemik

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Viimane tund
      *[other] Viimased { $hours } tundi
    }

harbor-live-folder-time-range-all-time =
    .label = Kogu ajalugu

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Viimane päev
      *[other] Viimased { $days } päeva
    }

harbor-live-folder-rss-option-item-limit =
    .label = Kirjete piir

harbor-live-folder-rss-option-feed-url =
    .label = RSS-voogu URL

harbor-live-folder-rss-prompt-feed-url = Sisestage RSS-voogu URL

harbor-live-folder-rss-option-item-limit-num =
    .label = Kirjete arv: { $limit }

harbor-live-folder-failed-fetch =
    .label = Uuendamine ebaõnnestus
    .tooltiptext = Uuendamine ebaõnnestus. Proovige uuesti.

harbor-live-folder-github-no-auth =
    .label = GitHubi pole sisse logitud
    .tooltiptext = Logige uuesti sisse GitHubi.

harbor-live-folder-github-no-filter =
    .label = Filtrit pole määratud
    .tooltiptext = Filtrit pole määratud, seega midagi ei laeta.

harbor-live-folder-rss-invalid-url-title = Reaalkausta loomine ebaõnnestus
harbor-live-folder-rss-invalid-url-description = RSS-voogu URL on vigane. Kontrollige aadressi ja proovige uuesti

harbor-live-folder-github-option-repo-filter =
    .label = Repositooriumid

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Tõmbepäringud

harbor-live-folder-github-issues =
    .label = Probleemid

harbor-live-folder-github-option-repo-list-note =
    .label = See lood genereeritakse teie praegu aktiivsete tõmbepäringute põhjal.

harbor-live-folders-promotion-title = Reaalkaust loodud!
harbor-live-folders-promotion-description = Teie RSS-voogude või GitHubi tõmbepäringute uusim sisu kuvatakse siin automaatselt.
