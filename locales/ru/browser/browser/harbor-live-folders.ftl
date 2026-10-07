# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Параметры живой папки

harbor-live-folder-last-fetched =
    .label = Последнее обновление: { $time }

harbor-live-folder-refresh =
    .label = Обновить

harbor-live-folder-github-option-author-self =
    .label = Создано мной

harbor-live-folder-github-option-assigned-self =
    .label = Назначено мне

harbor-live-folder-github-option-review-requested =
    .label = Запросы на проверку

harbor-live-folder-github-option-include-drafts =
    .label = Включать черновики запросов на вытягивание

harbor-live-folder-type-rss =
    .label = Лента RSS

harbor-live-folder-option-fetch-interval =
    .label = Интервал обновления

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 минута
      *[other] { $mins } мин.
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 час
      *[other] { $hours } ч.
    }

harbor-live-folder-rss-option-time-range =
    .label = Временной диапазон

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Последний час
      *[other] Последние { $hours } ч.
    }

harbor-live-folder-time-range-all-time =
    .label = За всё время

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Последний день
      *[other] Последние { $days } дн.
    }

harbor-live-folder-rss-option-item-limit =
    .label = Ограничение количества элементов

harbor-live-folder-rss-option-feed-url =
    .label = URL ленты

harbor-live-folder-rss-prompt-feed-url = Введите URL ленты

harbor-live-folder-rss-option-item-limit-num =
    .label = Элементов: { $limit }

harbor-live-folder-failed-fetch =
    .label = Не удалось обновить
    .tooltiptext = Не удалось обновить. Попробуйте ещё раз.

harbor-live-folder-github-no-auth =
    .label = Вы не вошли в GitHub
    .tooltiptext = Снова войдите в GitHub.

harbor-live-folder-github-no-filter =
    .label = Фильтр не задан
    .tooltiptext = Фильтр не задан, поэтому ничего не будет загружено.

harbor-live-folder-rss-invalid-url-title = Не удалось создать живую папку
harbor-live-folder-rss-invalid-url-description = URL ленты недопустим. Проверьте адрес и повторите попытку

harbor-live-folder-github-option-repo-filter =
    .label = Репозитории

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Запросы на вытягивание

harbor-live-folder-github-issues =
    .label = Задачи

harbor-live-folder-github-option-repo-list-note =
    .label = Этот список формируется на основе ваших активных запросов на вытягивание.

harbor-live-folders-promotion-title = Живая папка создана!
harbor-live-folders-promotion-description = Новые материалы из ваших лент RSS или запросов на вытягивание GitHub будут автоматически появляться здесь.
