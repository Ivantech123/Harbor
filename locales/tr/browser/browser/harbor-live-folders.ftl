# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Canlı Klasör Seçenekleri

harbor-live-folder-last-fetched =
    .label = Son getirme: { $time }

harbor-live-folder-refresh =
    .label = Yenile

harbor-live-folder-github-option-author-self =
    .label = Benim oluşturduğu

harbor-live-folder-github-option-assigned-self =
    .label = Bana atanmış

harbor-live-folder-github-option-review-requested =
    .label = İnceleme istekleri

harbor-live-folder-github-option-include-drafts =
    .label = Taslak Çekme İsteklerini Dahil Et

harbor-live-folder-type-rss =
    .label = RSS Akışı

harbor-live-folder-option-fetch-interval =
    .label = Getirme Aralığı

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 dakika
      *[other] { $mins } dakika
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 saat
      *[other] { $hours } saat
    }

harbor-live-folder-rss-option-time-range =
    .label = Zaman Aralığı

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] Son saat
      *[other] Son { $hours } saat
    }

harbor-live-folder-time-range-all-time =
    .label = Tüm zamanlar

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] Son gün
      *[other] Son { $days } gün
    }

harbor-live-folder-rss-option-item-limit =
    .label = Öğe Sınırı

harbor-live-folder-rss-option-feed-url =
    .label = Akış URL'si

harbor-live-folder-rss-prompt-feed-url = Lütfen akış URL'sini girin

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } öğe

harbor-live-folder-failed-fetch =
    .label = Güncellenemedi
    .tooltiptext = Güncellenemedi. Yeniden deneyin.

harbor-live-folder-github-no-auth =
    .label = GitHub'da oturum açılmamış
    .tooltiptext = GitHub'da yeniden oturum açın.

harbor-live-folder-github-no-filter =
    .label = Filtre ayarlanmamış
    .tooltiptext = Filtre ayarlanmadığı için hiçbir şey getirilmeyecek.

harbor-live-folder-rss-invalid-url-title = Canlı Klasör oluşturulamadı
harbor-live-folder-rss-invalid-url-description = Akış URL'si geçersiz. Adresi kontrol edip yeniden deneyin

harbor-live-folder-github-option-repo-filter =
    .label = Depolar

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Çekme İstekleri

harbor-live-folder-github-issues =
    .label = Sorunlar

harbor-live-folder-github-option-repo-list-note =
    .label = Bu liste, hâlâ açık olan çekme isteklerinize göre oluşturulur.

harbor-live-folders-promotion-title = Canlı Klasör Oluşturuldu!
harbor-live-folders-promotion-description = RSS akışlarınızdan veya GitHub çekme isteklerinizden en son içerikler burada otomatik olarak görünecek.
