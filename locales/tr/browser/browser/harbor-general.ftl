# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = mevcut profil
unified-extensions-description = Uzantılar { -brand-short-name }'e daha fazla ek işlevsellik kazandırmak için kullanılır.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Temel sekmeyi sıfırla
           *[false] Sabitlenmiş sekmeyi sıfırla
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Temel sekmelere ekle
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Temel sekmelerden kaldır
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Temel sekme adresini düzenle
           *[false] Sabitlenmiş sekme adresini düzenle
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Mevcut adresle değiştir
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Düzenle…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Etiketi değiştir…
tab-context-harbor-edit-icon = 
    .label = Simgeyi değiştir…
harbor-themes-corrupted = { -brand-short-name } adlı modun dosyaları hatalı. Varsayılan temaya sıfırlandılar.
harbor-shortcuts-corrupted = { -brand-short-name } kısayol dosyanız bozuldu. Varsayılan kısayollara sıfırlandı.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Yeni adres çubuğu etkinleştirildi ve yeni sekme sayfalarına olan ihtiyaç ortadan kalktı.<br/><br/>
    Yeni adres çubuğunu çalışırken görmek için yeni bir sekme açmayı dene!
harbor-disable = Devre dışı bırak
pictureinpicture-minimize-btn = 
    .aria-label = Küçült
    .tooltip = Küçült
harbor-panel-ui-gradient-generator-custom-color = Özel renk
harbor-copy-current-url-confirmation = Geçerli URL kopyalandı!
harbor-copy-current-url-as-markdown-confirmation = Geçerli URL Markdown olarak kopyalandı!
harbor-general-cancel-label = 
    .label = İptal
harbor-general-confirm = 
    .label = Onayla
harbor-pinned-tab-replaced = Sabitlenmiş sekmenin URL’si, mevcut URL ile değiştirildi!
harbor-pinned-tab-url-edited = Sabitlenmiş sekme adresi güncellendi!
harbor-pinned-tab-url-invalid = Bu geçerli bir adres gibi görünmüyor.
harbor-pinned-tab-edit-url-title = Sabitlenmiş sekme adresini düzenle
harbor-pinned-tab-edit-url-label = Bu sabitlenmiş sekmenin yönlendirileceği adresi girin:
harbor-tabs-renamed = Sekme başarıyla yeniden adlandırıldı!
harbor-background-tab-opened-toast = Yeni arka plan sekmesi açıldı!
harbor-workspace-renamed-toast = Çalışma alanı başarıyla yeniden adlandırıldı!
harbor-split-view-limit-toast = Bölünmüş görünüme daha fazla panel eklenemiyor!
harbor-toggle-compact-mode-button = 
    .label = Kompakt mod
    .tooltiptext = Kompakt modu aç/kapat

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Daha fazla bilgi
harbor-close-label = Kapat
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Ara...
harbor-icons-picker-emoji = 
    .label = Emojiler
harbor-icons-picker-svg = 
    .label = Simgeler
harbor-emojis-picker-search = 
    .placeholder = Emojilerde ara
urlbar-search-mode-zen_actions = Eylemler
harbor-site-data-settings = Ayarlar
harbor-generic-manage = Yönet
harbor-generic-more = Daha
harbor-generic-next = Sonraki
harbor-essentials-promo-label = Temel sekmelere ekle
harbor-essentials-promo-sublabel = Favori sekmelerinize tek tıkla erişin
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = İzin verildi
harbor-site-data-setting-block = Engellendi
harbor-site-data-protections-enabled = Etkinleştirildi
harbor-site-data-protections-disabled = Devre dışı bırakıldı
harbor-site-data-setting-cross-site = Siteler arası çerez
harbor-site-data-security-info-extension = 
    .label = Uzantı
harbor-site-data-security-info-secure = 
    .label = Güvenli
harbor-site-data-security-info-not-secure = 
    .label = Güvenli değil
harbor-site-data-manage-addons = 
    .label = Uzantıları yönet
harbor-site-data-get-addons = 
    .label = Uzantı ekle
harbor-site-data-site-settings = 
    .label = Tüm site ayarları
harbor-site-data-header-share = 
    .tooltiptext = Bu sayfayı paylaş
harbor-site-data-header-reader-mode = 
    .tooltiptext = Okuyucu moduna gir
harbor-site-data-header-screenshot = 
    .tooltiptext = Ekran görüntüsü al
harbor-site-data-header-bookmark = 
    .tooltiptext = Bu sayfayı yer imlerine ekle
harbor-urlbar-copy-url-button = 
    .tooltiptext = URL'yi kopyala
harbor-site-data-setting-site-protection = İzleme koruması

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Eklentiler, izinler ve daha fazlası için yeni bir alan
harbor-site-data-panel-feature-callout-subtitle = Site ayarlarını yönetmek, güvenlik bilgilerini görüntülemek, uzantılara erişmek ve yaygın işlemleri gerçekleştirmek için simgeye tıklayın.
harbor-open-link-in-glance = 
    .label = Bağlantıyı hızlı görünümde aç
    .accesskey = G
harbor-sidebar-notification-updated-heading = Güncelleme tamamlandı!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = { -brand-short-name }'de neler yeni
harbor-sidebar-notification-updated-tooltip = 
    .title = Sürüm Notlarını Görüntüle
harbor-sidebar-notification-donate-label = { -brand-short-name } uygulamasını destekle
harbor-sidebar-notification-donate-tooltip = 
    .title = Projeye bağış yap
harbor-sidebar-notification-restart-safe-mode-label = Bir sorun mu oluştu?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Güvenli Modda Yeniden Başlat
harbor-window-sync-migration-dialog-title = Pencerelerinizi Senkronize Tutun
harbor-window-sync-migration-dialog-message = Harbor artık aynı cihazdaki pencereleri senkronize ediyor; böylece bir pencerede yapılan değişiklikler anında diğer pencerelere yansıyor.
harbor-window-sync-migration-dialog-learn-more = Daha fazla bilgi
harbor-window-sync-migration-dialog-accept = Anladım
harbor-appmenu-new-blank-window = 
    .label = Yeni boş pencere
