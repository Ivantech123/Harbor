# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Možnosti živé složky

harbor-live-folder-last-fetched =
    .label = Poslední načtení: { $time }

harbor-live-folder-refresh =
    .label = Aktualizovat

harbor-live-folder-github-option-author-self =
    .label = Vytvořeno mnou

harbor-live-folder-github-option-assigned-self =
    .label = Přiřazeno mně

harbor-live-folder-github-option-review-requested =
    .label = Požadavky na kontrolu

harbor-live-folder-github-option-include-drafts =
    .label = Zahrnout koncepty pull requestů

harbor-live-folder-type-rss =
    .label = RSS kanál

harbor-live-folder-option-fetch-interval =
    .label = Interval načítání

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuta
      *[other] { $mins } minut
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 hodina
      *[other] { $hours } hodin
    }

harbor-live-folder-rss-option-time-range =
    .label = Časové období

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Poslední hodina
      *[other] Posledních { $hours } hodin
    }

harbor-live-folder-time-range-all-time =
    .label = Za všechny časy

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Poslední den
      *[other] Posledních { $days } dní
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limit položek

harbor-live-folder-rss-option-feed-url =
    .label = URL kanálu

harbor-live-folder-rss-prompt-feed-url = Zadejte prosím URL kanálu

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } položek

harbor-live-folder-failed-fetch =
    .label = Aktualizace se nezdařila
    .tooltiptext = Aktualizace se nezdařila. Zkuste to znovu.

harbor-live-folder-github-no-auth =
    .label = Na GitHubu nejste přihlášeni
    .tooltiptext = Znovu se přihlaste ke GitHubu.

harbor-live-folder-github-no-filter =
    .label = Filtr není nastaven
    .tooltiptext = Není nastaven žádný filtr, nebude načten nic.

harbor-live-folder-rss-invalid-url-title = Vytvoření živé složky se nezdařilo
harbor-live-folder-rss-invalid-url-description = URL kanálu je neplatná. Zkontrolujte adresu a zkuste to znovu

harbor-live-folder-github-option-repo-filter =
    .label = Repozitáře

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull requesty

harbor-live-folder-github-issues =
    .label = Problémy

harbor-live-folder-github-option-repo-list-note =
    .label = Tento seznam je generován na základě vašich aktuálně aktivních pull requestů.

harbor-live-folders-promotion-title = Živá složka byla vytvořena!
harbor-live-folders-promotion-description = Nejnovější obsah z vašich RSS kanálů nebo pull requestů z GitHubu se zde automaticky zobrazí.
