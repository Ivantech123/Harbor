# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Options du dossier en direct

harbor-live-folder-last-fetched =
    .label = Dernière mise à jour : { $time }

harbor-live-folder-refresh =
    .label = Actualiser

harbor-live-folder-github-option-author-self =
    .label = Créées par moi

harbor-live-folder-github-option-assigned-self =
    .label = Qui me sont attribuées

harbor-live-folder-github-option-review-requested =
    .label = Demandes de revue

harbor-live-folder-github-option-include-drafts =
    .label = Inclure les demandes de fusion en brouillon

harbor-live-folder-type-rss =
    .label = Flux RSS

harbor-live-folder-option-fetch-interval =
    .label = Intervalle de mise à jour

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minute
      *[other] { $mins } minutes
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 heure
      *[other] { $hours } heures
    }

harbor-live-folder-rss-option-time-range =
    .label = Période

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Dernière heure
      *[other] Dernières { $hours } heures
    }

harbor-live-folder-time-range-all-time =
    .label = Depuis le début

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Dernier jour
      *[other] Derniers { $days } jours
    }

harbor-live-folder-rss-option-item-limit =
    .label = Limite d’éléments

harbor-live-folder-rss-option-feed-url =
    .label = URL du flux

harbor-live-folder-rss-prompt-feed-url = Veuillez saisir l’URL du flux

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } éléments

harbor-live-folder-failed-fetch =
    .label = Échec de la mise à jour
    .tooltiptext = La mise à jour a échoué. Réessayez.

harbor-live-folder-github-no-auth =
    .label = Non connecté à GitHub
    .tooltiptext = Reconnectez-vous à GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtre non défini
    .tooltiptext = Aucun filtre n’est défini, rien ne sera mis à jour.

harbor-live-folder-rss-invalid-url-title = Échec de la création du dossier en direct
harbor-live-folder-rss-invalid-url-description = L’URL du flux n’est pas valide. Vérifiez l’adresse et réessayez.

harbor-live-folder-github-option-repo-filter =
    .label = Dépôts

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Demandes de fusion

harbor-live-folder-github-issues =
    .label = Tickets

harbor-live-folder-github-option-repo-list-note =
    .label = Cette liste est générée à partir de vos demandes de fusion actives.

harbor-live-folders-promotion-title = Dossier en direct créé !
harbor-live-folders-promotion-description = Le contenu le plus récent de vos flux RSS ou de vos demandes de fusion GitHub apparaîtra ici automatiquement.
