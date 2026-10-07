# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opciones de la carpeta en directo

harbor-live-folder-last-fetched =
    .label = Última actualización: { $time }

harbor-live-folder-refresh =
    .label = Actualizar

harbor-live-folder-github-option-author-self =
    .label = Creadas por mí

harbor-live-folder-github-option-assigned-self =
    .label = Asignadas a mí

harbor-live-folder-github-option-review-requested =
    .label = Solicitudes de revisión

harbor-live-folder-github-option-include-drafts =
    .label = Incluir solicitudes de extracción en borrador

harbor-live-folder-type-rss =
    .label = Feed RSS

harbor-live-folder-option-fetch-interval =
    .label = Intervalo de actualización

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minuto
      *[other] { $mins } minutos
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 hora
      *[other] { $hours } horas
    }

harbor-live-folder-rss-option-time-range =
    .label = Intervalo de tiempo

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Última hora
      *[other] Últimas { $hours } horas
    }

harbor-live-folder-time-range-all-time =
    .label = Todo el tiempo

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Último día
      *[other] Últimos { $days } días
    }

harbor-live-folder-rss-option-item-limit =
    .label = Límite de elementos

harbor-live-folder-rss-option-feed-url =
    .label = URL del feed

harbor-live-folder-rss-prompt-feed-url = Introduce la URL del feed

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } elementos

harbor-live-folder-failed-fetch =
    .label = No se ha podido actualizar
    .tooltiptext = No se ha podido actualizar. Inténtalo de nuevo.

harbor-live-folder-github-no-auth =
    .label = No has iniciado sesión en GitHub
    .tooltiptext = Vuelve a iniciar sesión en GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtro no definido
    .tooltiptext = No hay ningún filtro definido, no se descargará nada.

harbor-live-folder-rss-invalid-url-title = No se ha podido crear la carpeta en directo
harbor-live-folder-rss-invalid-url-description = La URL del feed no es válida. Comprueba la dirección e inténtalo de nuevo

harbor-live-folder-github-option-repo-filter =
    .label = Repositorios

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Solicitudes de extracción

harbor-live-folder-github-issues =
    .label = Incidencias

harbor-live-folder-github-option-repo-list-note =
    .label = Esta lista se genera según las solicitudes de extracción que tengas activas.

harbor-live-folders-promotion-title = ¡Se ha creado la carpeta en directo!
harbor-live-folders-promotion-description = El contenido más reciente de tus feeds RSS o de tus solicitudes de extracción de GitHub aparecerá aquí automáticamente.
