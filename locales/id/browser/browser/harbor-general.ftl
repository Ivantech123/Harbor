# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = profil saat ini
unified-extensions-description = Ekstensi digunakan untuk menambahkan fungsi ekstra ke { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Reset Tab Esensial ke URL awal
           *[false] Reset Tab Sematan ke URL awal
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Tambahkan ke Esensial
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } slot terisi
tab-context-harbor-remove-essential = 
    .label = Hapus dari Esensial
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edit Essential URL
           *[false] Edit Pinned URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Replace with Current URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Edit…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Ubah Label...
tab-context-harbor-edit-icon = 
    .label = Ubah Ikon...
harbor-themes-corrupted = Tidak dapat memuat file tema { -brand-short-name } Anda karena rusak. File tersebut telah diatur ulang ke tema default.
harbor-shortcuts-corrupted = File pintasan { -brand-short-name } Anda rusak. Mereka telah diatur ulang ke pintasan default.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Bilah URL baru telah diaktifkan, menghapus kebutuhan untuk halaman tab baru.<br/><br/>
    Coba buka tab baru untuk melihat bilah URL baru beraksi!
harbor-disable = Nonaktifkan
pictureinpicture-minimize-btn = 
    .aria-label = Minimalkan
    .tooltip = Minimalkan
harbor-panel-ui-gradient-generator-custom-color = Warna Kustom
harbor-copy-current-url-confirmation = URL Disalin!
harbor-copy-current-url-as-markdown-confirmation = URL disalin sebagai Markdown!
harbor-general-cancel-label = 
    .label = Batalkan
harbor-general-confirm = 
    .label = Konfirmasi
harbor-pinned-tab-replaced = URL awal dari tab yang disematkan telah diganti dengan URL saat ini.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Tab telah berhasil diubah namanya!
harbor-background-tab-opened-toast = Tab baru telah terbuka di latar belakang!
harbor-workspace-renamed-toast = Ruang Kerja telah berhasil diubah namanya!
harbor-split-view-limit-toast = Can't add more panels to the split view!
harbor-toggle-compact-mode-button = 
    .label = Mode Ringkas
    .tooltiptext = Aktifkan/Sembunyikan Mode Ringkas

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Pelajari Lebih Lanjut
harbor-close-label = Tutup
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Cari...
harbor-icons-picker-emoji = 
    .label = Emoji
harbor-icons-picker-svg = 
    .label = Ikon
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Aksi
harbor-site-data-settings = Pengaturan
harbor-generic-manage = Kelola
harbor-generic-more = Selengkapnya
harbor-generic-next = Lanjut
harbor-essentials-promo-label = Tambahkan ke Esensial
harbor-essentials-promo-sublabel = Akses tab favorit Anda hanya dengan sekali klik
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Diizinkan
harbor-site-data-setting-block = Diblokir
harbor-site-data-protections-enabled = Diaktifkan
harbor-site-data-protections-disabled = Dinonaktifkan
harbor-site-data-setting-cross-site = Kuki Lintas Situs
harbor-site-data-security-info-extension = 
    .label = Ekstensi
harbor-site-data-security-info-secure = 
    .label = Aman
harbor-site-data-security-info-not-secure = 
    .label = Tidak Aman
harbor-site-data-manage-addons = 
    .label = Kelola Ekstensi
harbor-site-data-get-addons = 
    .label = Tambahkan Ekstensi
harbor-site-data-site-settings = 
    .label = Semua Pengaturan Situs
harbor-site-data-header-share = 
    .tooltiptext = Bagikan Halaman Ini
harbor-site-data-header-reader-mode = 
    .tooltiptext = Masuki Mode Membaca
harbor-site-data-header-screenshot = 
    .tooltiptext = Ambil Tangkapan Layar
harbor-site-data-header-bookmark = 
    .tooltiptext = Markahi Laman Ini
harbor-urlbar-copy-url-button = 
    .tooltiptext = Salin URL
harbor-site-data-setting-site-protection = Perlindungan Pelacakan

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Rumah baru untuk add-on, izin, dan lainnya
harbor-site-data-panel-feature-callout-subtitle = Klik ikon untuk mengelola pengaturan situs, melihat info keamanan, mengakses ekstensi, dan melakukan tindakan umum.
harbor-open-link-in-glance = 
    .label = Buka Tautan di Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Pembaruan Selesai!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Apa yang baru di { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Lihat Catatan Rilis
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Ada yang rusak?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Mulai Ulang dalam Mode Aman
harbor-window-sync-migration-dialog-title = Jaga Jendela Anda Tetap Sinkron
harbor-window-sync-migration-dialog-message = Harbor kini menyinkronkan jendela pada perangkat yang sama, sehingga perubahan di satu jendela akan langsung terlihat di jendela lainnya.
harbor-window-sync-migration-dialog-learn-more = Pelajari Lebih Lanjut
harbor-window-sync-migration-dialog-accept = Oke!
harbor-appmenu-new-blank-window = 
    .label = Jendela Kosong Baru
