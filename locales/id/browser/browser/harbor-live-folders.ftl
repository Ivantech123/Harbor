# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-live-folder-options =
    .label = Opsi Folder Langsung

harbor-live-folder-last-fetched =
    .label = Pengambilan terakhir: { $time }

harbor-live-folder-refresh =
    .label = Segarkan

harbor-live-folder-github-option-author-self =
    .label = Dibuat oleh saya

harbor-live-folder-github-option-assigned-self =
    .label = Ditugaskan kepada saya

harbor-live-folder-github-option-review-requested =
    .label = Permintaan Tinjauan

harbor-live-folder-github-option-include-drafts =
    .label = Sertakan Pull Request Draf

harbor-live-folder-type-rss =
    .label = Umpan RSS

harbor-live-folder-option-fetch-interval =
    .label = Interval Pengambilan

harbor-live-folder-fetch-interval-mins =
    .label = { $mins ->
      [one] 1 menit
      *[other] { $mins } menit
    }

harbor-live-folder-fetch-interval-hours =
    .label = { $hours ->
      [one] 1 jam
      *[other] { $hours } jam
    }

harbor-live-folder-rss-option-time-range =
    .label = Rentang Waktu

harbor-live-folder-time-range-hours =
    .label = { $hours ->
      [one] 1 jam terakhir
      *[other] { $hours } jam terakhir
    }

harbor-live-folder-time-range-all-time =
    .label = Sepanjang waktu

harbor-live-folder-time-range-days =
    .label = { $days ->
      [one] 1 hari terakhir
      *[other] { $days } hari terakhir
    }

harbor-live-folder-rss-option-item-limit =
    .label = Batas Item

harbor-live-folder-rss-option-feed-url =
    .label = URL Umpan

harbor-live-folder-rss-prompt-feed-url = Masukkan URL umpan

harbor-live-folder-rss-option-item-limit-num =
    .label = { $limit } item

harbor-live-folder-failed-fetch =
    .label = Gagal memperbarui
    .tooltiptext = Gagal memperbarui. Coba lagi.

harbor-live-folder-github-no-auth =
    .label = Tidak masuk ke GitHub
    .tooltiptext = Masuk kembali ke GitHub.

harbor-live-folder-github-no-filter =
    .label = Filter belum diatur
    .tooltiptext = Tidak ada filter yang diatur, tidak ada yang akan diambil.

harbor-live-folder-rss-invalid-url-title = Gagal membuat Folder Langsung
harbor-live-folder-rss-invalid-url-description = URL umpan tidak valid. Periksa alamat lalu coba lagi

harbor-live-folder-github-option-repo-filter =
    .label = Repositori

harbor-live-folder-github-option-repo =
    .label = { $repo }

harbor-live-folder-github-pull-requests =
    .label = Pull Request

harbor-live-folder-github-issues =
    .label = Isu

harbor-live-folder-github-option-repo-list-note =
    .label = Daftar ini dibuat berdasarkan pull request aktif Anda saat ini.

harbor-live-folders-promotion-title = Folder Langsung Dibuat!
harbor-live-folders-promotion-description = Konten terbaru dari umpan RSS atau pull request GitHub akan otomatis muncul di sini.
