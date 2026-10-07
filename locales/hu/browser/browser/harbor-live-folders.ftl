# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Élő mappa beállításai

harbor-live-folder-last-fetched =
    .label = Utolsó lekérés: { $time }

harbor-live-folder-refresh =
    .label = Frissítés

harbor-live-folder-github-option-author-self =
    .label = Általam létrehozott

harbor-live-folder-github-option-assigned-self =
    .label = Hozzám rendelt

harbor-live-folder-github-option-review-requested =
    .label = Review-kérések

harbor-live-folder-github-option-include-drafts =
    .label = Félkész pull requestek is

harbor-live-folder-type-rss =
    .label = RSS-hírfolyam

harbor-live-folder-option-fetch-interval =
    .label = Lekérési időköz

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 perc
      *[other] { $mins } perc
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 óra
      *[other] { $hours } óra
    }

harbor-live-folder-rss-option-time-range =
    .label = Időtartom

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Az elmúlt óra
      *[other] Az elmúlt { $hours } óra
    }

harbor-live-folder-time-range-all-time =
    .label = Összes idő

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Az elmúlt nap
      *[other] Az elmúlt { $days } nap
    }

harbor-live-folder-rss-option-item-limit =
    .label = Elemszámkorlát

harbor-live-folder-rss-option-feed-url =
    .label = Hírfolyam URL-je

harbor-live-folder-rss-prompt-feed-url = Adja meg a hírfolyam URL-jét

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elem

harbor-live-folder-failed-fetch =
    .label = Nem sikerült frissíteni
    .tooltiptext = Nem sikerült frissíteni. Próbálja újra.

harbor-live-folder-github-no-auth =
    .label = Nincs bejelentkezve a GitHubba
    .tooltiptext = Jelentkezzen be újra a GitHubba.

harbor-live-folder-github-no-filter =
    .label = Nincs szűrő beállítva
    .tooltiptext = Nincs szűrő beállítva, ezért semmi sem kerül lekérésre.

harbor-live-folder-rss-invalid-url-title = Nem sikerült létrehozni az élő mappát
harbor-live-folder-rss-invalid-url-description = A hírfolyam URL-je érvénytelen. Ellenőrizze a címet, és próbálja újra

harbor-live-folder-github-option-repo-filter =
    .label = Tárolók

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requestek

harbor-live-folder-github-issues =
    .label = Issue-k

harbor-live-folder-github-option-repo-list-note =
    .label = Ez a lista az Ön jelenleg nyitott pull requestjei alapján készül.

harbor-live-folders-promotion-title = Az élő mappa létrejött!
harbor-live-folders-promotion-description = Az Ön RSS-hírfolyamainak vagy GitHub pull requestjeinek legfrissebb tartalma automatikusan itt jelenik meg.
