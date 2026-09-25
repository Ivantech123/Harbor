# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = y proffil cyfredol
unified-extensions-description = Mae estyniadau'n cael ei defnyddio er mwyn ychwanegu fwy o swyddogaeth i { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Ailosod y Tab Hanfodol
           *[false] Ailosod y Tab wedi'i Binio
        }
    .accesskey = A
tab-context-harbor-add-essential = 
    .label = Ychwanegu at Hanfodion
    .accesskey = H
tab-context-harbor-add-essential-badge = { $num } / { $max } slotiau wedi'u llenwi
tab-context-harbor-remove-essential = 
    .label = Dileu o'r Hanfodion
    .accesskey = D
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edit Essential URL
           *[false] Edit Pinned URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Replace with Current URL
    .accesskey = P
tab-context-harbor-edit-pinned-url = 
    .label = Edit…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Newid Label...
tab-context-harbor-edit-icon = 
    .label = Newid Eicon...
harbor-themes-corrupted = Mae eich ffeil addasiadau { -brand-short-name } wedi'i llygru. Maen nhw wedi cael eu hailosod i'r thema rhagosodedig.
harbor-shortcuts-corrupted = Mae eich ffeil llwybr-byr { -brand-short-name } wedi'i llygru. Maen nhw wedi cael eu hailosod i'r llwybr byr rhagosodedig.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Mae'r bar URL newydd wedi'i alluogi, sydd yn dileu'r angen am dudalennau tab newydd.<br/><br/>
    Ceisiwch agor tab newydd i weld y bar URL newydd ar waith!
harbor-disable = Analluogi
pictureinpicture-minimize-btn = 
    .aria-label = Lleihau
    .tooltip = Lleihau
harbor-panel-ui-gradient-generator-custom-color = Lliw Cyfaddas
harbor-copy-current-url-confirmation = Wedi copïo'r URL cyfredol!
harbor-copy-current-url-as-markdown-confirmation = Wedi copïo'r URL cyfredol fel Markdown!
harbor-general-cancel-label = 
    .label = Na
harbor-general-confirm = 
    .label = Cadarnhau
harbor-pinned-tab-replaced = Mae URL y tab wedi'i binio wedi'i newid i'r URL gyfredol!
harbor-pinned-tab-url-edited = Pinned tab URL has been updated!
harbor-pinned-tab-url-invalid = That doesn't look like a valid URL.
harbor-pinned-tab-edit-url-title = Edit Pinned URL
harbor-pinned-tab-edit-url-label = Enter the URL this pinned tab should point to:
harbor-tabs-renamed = Mae'r tab wedi cael ei ailenwi'n llwyddiannus!
harbor-background-tab-opened-toast = Tab cefndir newydd wedi'i agor!
harbor-workspace-renamed-toast = Mae'r Man Gwaith wedi cael ei ailenwi'n llwyddiannus!
harbor-split-view-limit-toast = Methu ychwanegu mwy o baneli at y golwg hollt!
harbor-toggle-compact-mode-button = 
    .label = Modd Cryno
    .tooltiptext = Togglo Modd Cryno

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Dysgu Rhagor
harbor-close-label = Cau
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Chwilio...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Eiconau
harbor-emojis-picker-search = 
    .placeholder = Search emojis
urlbar-search-mode-zen_actions = Gweithredoedd
harbor-site-data-settings = Gosodiadau
harbor-generic-manage = Rheoli
harbor-generic-more = Rhagor
harbor-generic-next = Nesaf
harbor-essentials-promo-label = Ychwanegu at Hanfodion
harbor-essentials-promo-sublabel = Cadwch eich hoff dabiau dim ond un clic i ffwrdd
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Caniatawyd
harbor-site-data-setting-block = Rhwystrwyd
harbor-site-data-protections-enabled = Galluogwyd
harbor-site-data-protections-disabled = Analluogwyd
harbor-site-data-setting-cross-site = Cwci Traws-Gwefan
harbor-site-data-security-info-extension = 
    .label = Estyniad
harbor-site-data-security-info-secure = 
    .label = Diogel
harbor-site-data-security-info-not-secure = 
    .label = Ddim yn Ddiogel
harbor-site-data-manage-addons = 
    .label = Rheoli Estyniadau
harbor-site-data-get-addons = 
    .label = Ychwanegu Estyniadau
harbor-site-data-site-settings = 
    .label = Pob Gosodiad Gwefan
harbor-site-data-header-share = 
    .tooltiptext = Rhannu'r Dudalen Hon
harbor-site-data-header-reader-mode = 
    .tooltiptext = Mynd i'r Modd Darllenydd
harbor-site-data-header-screenshot = 
    .tooltiptext = Cymryd Llun Sgrin
harbor-site-data-header-bookmark = 
    .tooltiptext = Nodi'r Dudalen Hon
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copïo URL
harbor-site-data-setting-site-protection = Diogelu Rhag Tracio

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Cartref newydd ar gyfer ychwanegiadau, caniatâd, a mwy
harbor-site-data-panel-feature-callout-subtitle = Cliciwch yr eicon i reoli gosodiadau'r wefan, gweld manylion diogelwch, cael mynediad at estyniadau, a chyflawni gweithredoedd cyffredin.
harbor-open-link-in-glance = 
    .label = Agor y Ddolen yn Cipolwg
    .accesskey = C
harbor-sidebar-notification-updated-heading = Diweddariad Wedi'i Gwblhau!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Beth sy'n newydd yn { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Gweld Nodiadau Rhyddhau
harbor-sidebar-notification-donate-label = Support { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donate to the project
harbor-sidebar-notification-restart-safe-mode-label = Rhywbeth wedi torri?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Ailgychwyn yn y Modd Diogel
harbor-window-sync-migration-dialog-title = Cadw Eich Ffenestr Wedi'u Cydweddu
harbor-window-sync-migration-dialog-message = Mae Harbor bellach yn cydweddu ffenestri ar yr un ddyfais, felly mae newidiadau mewn un ffenestr yn cael eu dangos ar y lleill yn syth.
harbor-window-sync-migration-dialog-learn-more = Dysgu Rhagor
harbor-window-sync-migration-dialog-accept = Iawn
harbor-appmenu-new-blank-window = 
    .label = Ffenestr wag newydd
