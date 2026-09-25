# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = dabartinis profilis
unified-extensions-description = Plėtiniai naudojami norint į „{ -brand-short-name }“ įtraukti daugiau papildomų funkcijų.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Atkurti būtiniausią kortelę
           *[false] Atkurti prisegtą kortelę
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Įtraukti į būtiniausius
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Šalinti iš būtiniausių
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
    .label = Keisti žymę...
tab-context-harbor-edit-icon = 
    .label = Keisti piktogramą...
harbor-themes-corrupted = Jūsų „{ -brand-short-name }“ modifikacijos failas sugadintas. Jie buvo atkurti į numatytąją temą.
harbor-shortcuts-corrupted = Jūsų „{ -brand-short-name }“ sparčiųjų klavišų failas sugadintas. Jie buvo atkurti į numatytuosius sparčiuosius klavišus.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Įjungta naujoji URL juosta, todėl nebereikia naujų kortelių puslapių.<br/><br/>
    Pabandykite atverti naują kortelę, kad matytumėte veikiantį naująjį URL juostą!
harbor-disable = Išjungti
pictureinpicture-minimize-btn = 
    .aria-label = Sumažinti
    .tooltip = Sumažinti
harbor-panel-ui-gradient-generator-custom-color = Pasirinktinė spalva
harbor-copy-current-url-confirmation = Nukopijuotas dabartinis URL.
harbor-copy-current-url-as-markdown-confirmation = Nukopijuotas dabartinis URL kaip ženklinimas.
harbor-general-cancel-label = 
    .label = Atšaukti
harbor-general-confirm = 
    .label = Patvirtinti
harbor-pinned-tab-replaced = Prisegtos kortelės URL pakeistas dabartiniu URL.
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Kortelė sėkmingai pervadinta.
harbor-background-tab-opened-toast = Nauja fonos kortelė atverta.
harbor-workspace-renamed-toast = Darbo sritis sėkmingai pervadintas.
harbor-split-view-limit-toast = Negalima įtraukti daugiau skydelių į suskaidytą rodinį.
harbor-toggle-compact-mode-button = 
    .label = Kompaktinis režimas
    .tooltiptext = Perjungti kompaktinį režimą

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Sužinoti daugiau
harbor-close-label = Užverti
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Ieškokite...
harbor-icons-picker-emoji = 
    .label = Jaustukai
harbor-icons-picker-svg = 
    .label = Piktogramos
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Veiksmai
harbor-site-data-settings = Nustatymai
harbor-generic-manage = Tvarkyti
harbor-generic-more = Daugiau
harbor-generic-next = Sekantis
harbor-essentials-promo-label = Įtraukti į būtiniausius
harbor-essentials-promo-sublabel = Laikykite mėgstamas korteles vos nuo vienu paspaudimu
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Leidžiama
harbor-site-data-setting-block = Užblokuota
harbor-site-data-protections-enabled = Įjungta
harbor-site-data-protections-disabled = Išjungta
harbor-site-data-setting-cross-site = Tarpusavio svetainės slapukas
harbor-site-data-security-info-extension = 
    .label = Plėtinys
harbor-site-data-security-info-secure = 
    .label = Saugi
harbor-site-data-security-info-not-secure = 
    .label = Nesaugi
harbor-site-data-manage-addons = 
    .label = Tvarkyti plėtinius
harbor-site-data-get-addons = 
    .label = Įtraukti plėtinius
harbor-site-data-site-settings = 
    .label = Visi svetainės nustatymai
harbor-site-data-header-share = 
    .tooltiptext = Bendrinti šį puslapį
harbor-site-data-header-reader-mode = 
    .tooltiptext = Įeiti į skaitytojo režimą
harbor-site-data-header-screenshot = 
    .tooltiptext = Daryti ekrano kopiją
harbor-site-data-header-bookmark = 
    .tooltiptext = Įtraukti šį puslapį į adresyną
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopijuoti URL
harbor-site-data-setting-site-protection = Stebėjimo apsauga

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Nauji namai priedams, leidimams ir daugiau
harbor-site-data-panel-feature-callout-subtitle = Spustelėkite piktogramą, kad tvarkytumėte svetainės nustatymus, peržiūrėtumėte saugumo informaciją, pasiektumėte plėtinius ir atliktumėte įprastus veiksmus.
harbor-open-link-in-glance = 
    .label = Atverti nuorodą rodinyje „Glance“
    .accesskey = G
harbor-sidebar-notification-updated-heading = Naujinimas baigtas.

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Kas naujo naršyklėje „{ -brand-short-name }“
harbor-sidebar-notification-updated-tooltip = 
    .title = Peržiūrėti leidimo pastabas
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Kažkas neveikia?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Paleisti iš naujo saugioje režime
harbor-window-sync-migration-dialog-title = Išlaikykite savo langus sinchronizuotus
harbor-window-sync-migration-dialog-message = „Harbor“ dabar sinchronizuoja langus tame pačiame įrenginyje, todėl viename lange atlikti pakeitimai iš karto atsispindi ir kituose.
harbor-window-sync-migration-dialog-learn-more = Sužinoti daugiau
harbor-window-sync-migration-dialog-accept = Supratau
harbor-appmenu-new-blank-window = 
    .label = Naujas tuščias langas
