# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Tiesioginio aplanko parinktys

harbor-live-folder-last-fetched =
    .label = Paskutinis atnaujinimas: { $time }

harbor-live-folder-refresh =
    .label = Atnaujinti

harbor-live-folder-github-option-author-self =
    .label = Mano sukurti

harbor-live-folder-github-option-assigned-self =
    .label = Man priskirti

harbor-live-folder-github-option-review-requested =
    .label = Peržiūros užklausos

harbor-live-folder-github-option-include-drafts =
    .label = Įtraukti juodraukštes įkėlimo užklausas

harbor-live-folder-type-rss =
    .label = RSS srautas

harbor-live-folder-option-fetch-interval =
    .label = Atnaujinimo intervalas

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 minutė
      *[other] { $mins } minučių
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 valanda
      *[other] { $hours } valandų
    }

harbor-live-folder-rss-option-time-range =
    .label = Laiko diapazonas

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Paskutinė valanda
      *[other] Paskutinės { $hours } valandos
    }

harbor-live-folder-time-range-all-time =
    .label = Visų laikų

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Paskutinė diena
      *[other] Paskutinės { $days } dienos
    }

harbor-live-folder-rss-option-item-limit =
    .label = Įrašų limitas

harbor-live-folder-rss-option-feed-url =
    .label = Srauto URL

harbor-live-folder-rss-prompt-feed-url = Įveskite srauto URL

harbor-live-folder-rss-option-item-limit-num =
    .label = Įrašų: { $limit }

harbor-live-folder-failed-fetch =
    .label = Nepavyko atnaujinti
    .tooltiptext = Nepavyko atnaujinti. Bandykite dar kartą.

harbor-live-folder-github-no-auth =
    .label = Neprisijungta prie GitHub
    .tooltiptext = Vėl prisijunkite prie GitHub.

harbor-live-folder-github-no-filter =
    .label = Filtras nepasirinktas
    .tooltiptext = Nepasirinktas filtras, todėl nebus gaunamas joks turinys.

harbor-live-folder-rss-invalid-url-title = Nepavyko sukurti tiesioginio aplanko
harbor-live-folder-rss-invalid-url-description = Srauto URL netinkamas. Patikrinkite adresą ir bandykite dar kartą

harbor-live-folder-github-option-repo-filter =
    .label = Saugyklos

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Įkėlimo užklausos

harbor-live-folder-github-issues =
    .label = Problemos

harbor-live-folder-github-option-repo-list-note =
    .label = Šis sąrašas pagrįstas jūsų šiuo metu aktyviomis įkėlimo užklausomis.

harbor-live-folders-promotion-title = Tiesioginis aplankas sukurtas!
harbor-live-folders-promotion-description = Čia automatiškai bus rodomas naujausias turinys iš jūsų RSS srautų arba GitHub įkėlimo užklausų.
