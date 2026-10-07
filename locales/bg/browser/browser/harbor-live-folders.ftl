# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Опции на живата папка

harbor-live-folder-last-fetched =
    .label = Последно изтегляне: { $time }

harbor-live-folder-refresh =
    .label = Опресняване

harbor-live-folder-github-option-author-self =
    .label = Създадени от мен

harbor-live-folder-github-option-assigned-self =
    .label = Възложени на мен

harbor-live-folder-github-option-review-requested =
    .label = Искания за преглед

harbor-live-folder-github-option-include-drafts =
    .label = Включване на чернови заявки за сливане

harbor-live-folder-type-rss =
    .label = RSS емисия

harbor-live-folder-option-fetch-interval =
    .label = Интервал за изтегляне

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 минута
      *[other] { $mins } минути
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 час
      *[other] { $hours } часа
    }

harbor-live-folder-rss-option-time-range =
    .label = Времеви обхват

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Последния час
      *[other] Последните { $hours } часа
    }

harbor-live-folder-time-range-all-time =
    .label = Цялото време

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Последния ден
      *[other] Последните { $days } дни
    }

harbor-live-folder-rss-option-item-limit =
    .label = Ограничение на броя на елементите

harbor-live-folder-rss-option-feed-url =
    .label = URL адрес на емисията

harbor-live-folder-rss-prompt-feed-url = Въведете URL адреса на емисията

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } елемента

harbor-live-folder-failed-fetch =
    .label = Неуспешно обновяване
    .tooltiptext = Неуспешно обновяване. Опитайте отново.

harbor-live-folder-github-no-auth =
    .label = Не сте влезли в GitHub
    .tooltiptext = Влезте отново в GitHub.

harbor-live-folder-github-no-filter =
    .label = Филтърът не е зададен
    .tooltiptext = Филтърът не е зададен, затова няма да се изтегля нищо.

harbor-live-folder-rss-invalid-url-title = Неуспешно създаване на живата папка
harbor-live-folder-rss-invalid-url-description = URL адресът на емисията е невалиден. Проверете адреса и опитайте отново

harbor-live-folder-github-option-repo-filter =
    .label = Хранилища

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Заявки за сливане

harbor-live-folder-github-issues =
    .label = Проблеми

harbor-live-folder-github-option-repo-list-note =
    .label = Този списък се генерира въз основа на текущите ви активни заявки за сливане.

harbor-live-folders-promotion-title = Живата папка е създадена!
harbor-live-folders-promotion-description = Най-новото съдържание от вашите RSS емисии или GitHub заявки за сливане ще се появява тук автоматично.
