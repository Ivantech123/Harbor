# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Параметри живої теки

harbor-live-folder-last-fetched =
    .label = Останнє оновлення: { $time }

harbor-live-folder-refresh =
    .label = Оновити

harbor-live-folder-github-option-author-self =
    .label = Створені мною

harbor-live-folder-github-option-assigned-self =
    .label = Призначені мені

harbor-live-folder-github-option-review-requested =
    .label = Запити на перегляд

harbor-live-folder-github-option-include-drafts =
    .label = Включити чернеткові запити на злиття

harbor-live-folder-type-rss =
    .label = Стрічка RSS

harbor-live-folder-option-fetch-interval =
    .label = Інтервал оновлення

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 хв
      *[other] { $mins } хв
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 год
      *[other] { $hours } год
    }

harbor-live-folder-rss-option-time-range =
    .label = Часовий діапазон

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Остання година
      *[other] Останні { $hours } год
    }

harbor-live-folder-time-range-all-time =
    .label = За весь час

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Останній день
      *[other] Останні { $days } дн
    }

harbor-live-folder-rss-option-item-limit =
    .label = Обмеження кількості елементів

harbor-live-folder-rss-option-feed-url =
    .label = URL-адреса стрічки

harbor-live-folder-rss-prompt-feed-url = Введіть URL-адресу стрічки

harbor-live-folder-rss-option-item-limit-num =
    .label = Кількість елементів: { $limit }

harbor-live-folder-failed-fetch =
    .label = Не вдалося оновити
    .tooltiptext = Не вдалося оновити. Спробуйте ще раз.

harbor-live-folder-github-no-auth =
    .label = Не виконано вхід до GitHub
    .tooltiptext = Увійдіть знову до GitHub.

harbor-live-folder-github-no-filter =
    .label = Фільтр не налаштовано
    .tooltiptext = Фільтр не налаштовано, нічого не буде завантажено.

harbor-live-folder-rss-invalid-url-title = Не вдалося створити живу теку
harbor-live-folder-rss-invalid-url-description = Недійсна URL-адреса стрічки. Перевірте адресу та спробуйте ще раз

harbor-live-folder-github-option-repo-filter =
    .label = Репозиторії

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Запити на злиття

harbor-live-folder-github-issues =
    .label = Проблеми

harbor-live-folder-github-option-repo-list-note =
    .label = Цей список створюється на основі ваших активних запитів на злиття.

harbor-live-folders-promotion-title = Живу теку створено!
harbor-live-folders-promotion-description = Тут автоматично з’являтимуться найновіші записи з ваших стрічок RSS або запитів на злиття GitHub.
