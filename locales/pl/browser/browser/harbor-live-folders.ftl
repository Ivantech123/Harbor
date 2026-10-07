# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opcje folderu na żywo

harbor-live-folder-last-fetched =
    .label = Ostatnie pobranie: { $time }

harbor-live-folder-refresh =
    .label = Odśwież

harbor-live-folder-github-option-author-self =
    .label = Utworzone przeze mnie

harbor-live-folder-github-option-assigned-self =
    .label = Przypisane do mnie

harbor-live-folder-github-option-review-requested =
    .label = Żądania przeglądu

harbor-live-folder-github-option-include-drafts =
    .label = Uwzględnij żądania pull w wersji roboczej

harbor-live-folder-type-rss =
    .label = Kanał RSS

harbor-live-folder-option-fetch-interval =
    .label = Interwał pobierania

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuta
      *[other] { $mins } minut
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 godzina
      *[other] { $hours } godzin
    }

harbor-live-folder-rss-option-time-range =
    .label = Zakres czasu

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Ostatnia godzina
      *[other] Ostatnie { $hours } godzin
    }

harbor-live-folder-time-range-all-time =
    .label = Cały okres

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Ostatni dzień
      *[other] Ostatnie { $days } dni
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limit elementów

harbor-live-folder-rss-option-feed-url =
    .label = Adres URL kanału

harbor-live-folder-rss-prompt-feed-url = Wprowadź adres URL kanału

harbor-live-folder-rss-option-item-limit-num =
    .label = Liczba elementów: { $limit }

harbor-live-folder-failed-fetch =
    .label = Nie udało się zaktualizować
    .tooltiptext = Nie udało się zaktualizować. Spróbuj ponownie.

harbor-live-folder-github-no-auth =
    .label = Nie zalogowano do GitHub
    .tooltiptext = Zaloguj się ponownie do GitHub.

harbor-live-folder-github-no-filter =
    .label = Nie ustawiono filtra
    .tooltiptext = Nie ustawiono filtra, więc nic nie zostanie pobrane.

harbor-live-folder-rss-invalid-url-title = Nie udało się utworzyć folderu na żywo
harbor-live-folder-rss-invalid-url-description = Adres URL kanału jest nieprawidłowy. Sprawdź adres i spróbuj ponownie

harbor-live-folder-github-option-repo-filter =
    .label = Repozytoria

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Żądania pull

harbor-live-folder-github-issues =
    .label = Zgłoszenia

harbor-live-folder-github-option-repo-list-note =
    .label = Ta lista jest generowana na podstawie żądań pull, które są obecnie aktywne.

harbor-live-folders-promotion-title = Utworzono folder na żywo!
harbor-live-folders-promotion-description = Najnowsze treści z kanałów RSS lub żądań pull w serwisie GitHub pojawią się tutaj automatycznie.
