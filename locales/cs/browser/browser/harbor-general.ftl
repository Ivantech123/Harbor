# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = aktuální profil
unified-extensions-description = Rozšíření slouží k přidání dalších funkcí do prohlížeče { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Resetovat Essential panel
           *[false] Resetovat připnutý panel
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Přidat do Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } zaplněných slotů
tab-context-harbor-remove-essential = 
    .label = Odstranit z Essentials
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Edit Essential URL
           *[false] Edit Pinned URL
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Nahradit současnou URL
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Upravit…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Změnit název...
tab-context-harbor-edit-icon = 
    .label = Změnit ikonu...
harbor-themes-corrupted = Váš { -brand-short-name } mods soubor je poškozen. Byl obnoven na výchozí motiv.
harbor-shortcuts-corrupted = Soubor se zkratky prohlížeče { -brand-short-name } je poškozen. Zkratky byly resetovány na výchozí nastavení.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Nový adresní řádek je nyní zapnutý, takže už není potřeba otevírat nové karty.<br/><br/>
    Zkuste otevřít nový panel a podívejte se, jak funguje!
harbor-disable = Zavřít
pictureinpicture-minimize-btn = 
    .aria-label = Minimalizovat
    .tooltip = Minimalizovat
harbor-panel-ui-gradient-generator-custom-color = Vlastní barva
harbor-copy-current-url-confirmation = URL adresa byla zkopírována!
harbor-copy-current-url-as-markdown-confirmation = Kopírovat aktuální URL jako Markdown!
harbor-general-cancel-label = 
    .label = Zrušit
harbor-general-confirm = 
    .label = Potvrdit
harbor-pinned-tab-replaced = Připnutá URL adresa panelu byla nahrazena aktuální URL adresou.
harbor-pinned-tab-url-edited = URL připnuté karty byla aktualizována!
harbor-pinned-tab-url-invalid = To nevypadá jako platná URL adresa.
harbor-pinned-tab-edit-url-title = Upravit připnutou adresu URL
harbor-pinned-tab-edit-url-label = Zadejte URL, na kterou by měl tento připnutý panel odkazovat:
harbor-tabs-renamed = Panel byl úspěšně přejmenován!
harbor-background-tab-opened-toast = Nový panel na pozadí byl otevřen!
harbor-workspace-renamed-toast = Pracovní prostor byl úspěšně přejmenován!
harbor-split-view-limit-toast = Do rozděleného zobrazení nelze přidat více panelů!
harbor-toggle-compact-mode-button = 
    .label = Kompaktní režim
    .tooltiptext = Přepnout kompaktní režim

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Zjistit více
harbor-close-label = Zavřít
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Hledat...
harbor-icons-picker-emoji = 
    .label = Emodži
harbor-icons-picker-svg = 
    .label = Ikony
harbor-emojis-picker-search = 
    .placeholder = Vyhledat emoji
urlbar-search-mode-zen_actions = Akce
harbor-site-data-settings = Nastavení
harbor-generic-manage = Spravovat
harbor-generic-more = Více
harbor-generic-next = Další
harbor-essentials-promo-label = Přídat do Essentials
harbor-essentials-promo-sublabel = Mějte oblíbené panely na dosah jedním kliknutím
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Povoleno
harbor-site-data-setting-block = Blokováno
harbor-site-data-protections-enabled = Zapnuto
harbor-site-data-protections-disabled = Vypnuto
harbor-site-data-setting-cross-site = Mezi stránkové cookies
harbor-site-data-security-info-extension = 
    .label = Rozšíření
harbor-site-data-security-info-secure = 
    .label = Bezpečné
harbor-site-data-security-info-not-secure = 
    .label = Nezabezpečeno
harbor-site-data-manage-addons = 
    .label = Spravovat rozšíření
harbor-site-data-get-addons = 
    .label = Přidat rozšíření
harbor-site-data-site-settings = 
    .label = Nastavení všech stránek
harbor-site-data-header-share = 
    .tooltiptext = Sdílet tuto stránku
harbor-site-data-header-reader-mode = 
    .tooltiptext = Zapnout čtecí režim
harbor-site-data-header-screenshot = 
    .tooltiptext = Pořídit snímek obrazovky
harbor-site-data-header-bookmark = 
    .tooltiptext = Přidat tuto stránku do záložek
harbor-urlbar-copy-url-button = 
    .tooltiptext = Kopírovat URL
harbor-site-data-setting-site-protection = Ochrana proti sledování

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Nový domov pro doplňky, oprávnění a další
harbor-site-data-panel-feature-callout-subtitle = Klikněte na ikonu pro správu nastavení webu, zobrazení bezpečnostních informací, přístup k rozšíření a provádění běžných akcí.
harbor-open-link-in-glance = 
    .label = Otevřít odkaz v Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Aktualizace byla dokončena!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Co je nového v prohlížeči { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Zobrazit změny
harbor-sidebar-notification-donate-label = Podpořte { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Přispět na projekt
harbor-sidebar-notification-restart-safe-mode-label = Něco se rozbilo?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Restartovat v Nouzovém Režimu
harbor-window-sync-migration-dialog-title = Mějte svá okna synchronizovaná
harbor-window-sync-migration-dialog-message = Harbor nyní synchronizuje okna na stejném zařízení. Změny provedené v jednom okně se okamžitě projeví v ostatních.
harbor-window-sync-migration-dialog-learn-more = Zjistit více
harbor-window-sync-migration-dialog-accept = Rozumím
harbor-appmenu-new-blank-window = 
    .label = Nové prázdné okno
