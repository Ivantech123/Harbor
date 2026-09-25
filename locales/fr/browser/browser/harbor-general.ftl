# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = profil actuel
unified-extensions-description = Les extensions sont utilisées pour ajouter plus de fonctionnalités à { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Réinitialiser l'onglet Essential
           *[false] Réinitialiser l'onglet épinglé
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Ajouter aux Essentials
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max }
tab-context-harbor-remove-essential = 
    .label = Retirer des Essentials
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Modifier l'URL de l'Essential
           *[false] Modifier de l'URL de l'onglet épinglé
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Remplacer par l'URL actuelle
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Modifier…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Changer le libellé...
tab-context-harbor-edit-icon = 
    .label = Changer l'icône...
harbor-themes-corrupted = Votre fichier de thèmes { -brand-short-name } est corrompu. Il a été réinitialisé au thème par défaut.
harbor-shortcuts-corrupted = Votre fichier de raccourcis { -brand-short-name } est corrompu. Ils ont été réinitialisés aux raccourcis par défaut.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    La nouvelle barre d’adresse a été activée, supprimant la nécessité de nouvelles pages d’onglets.<br/><br/>
    Essayez d’ouvrir un nouvel onglet pour voir la nouvelle barre d’adresse en action !
harbor-disable = Désactiver
pictureinpicture-minimize-btn = 
    .aria-label = Minimiser
    .tooltip = Minimiser
harbor-panel-ui-gradient-generator-custom-color = Couleur personnalisée
harbor-copy-current-url-confirmation = URL actuelle copiée !
harbor-copy-current-url-as-markdown-confirmation = URL actuelle copiée en tant que Markdown !
harbor-general-cancel-label = 
    .label = Annuler
harbor-general-confirm = 
    .label = Confirmer
harbor-pinned-tab-replaced = L’adresse de l'onglet épinglé a été remplacée par l’adresse actuelle.
harbor-pinned-tab-url-edited = L'URL de l'onglet épinglé a été mise à jour !
harbor-pinned-tab-url-invalid = Cela ne ressemble pas à une URL valide.
harbor-pinned-tab-edit-url-title = Modifier l'URL épinglée
harbor-pinned-tab-edit-url-label = Entrer l'URL à laquelle cet onglet épinglé devrait pointer :
harbor-tabs-renamed = L’onglet a été renommé avec succès !
harbor-background-tab-opened-toast = Nouvel onglet ouvert en arrière-plan !
harbor-workspace-renamed-toast = L'espace de travail a été renommé avec succès !
harbor-split-view-limit-toast = Impossible d'ajouter d'autres panneaux à la vue fractionnée !
harbor-toggle-compact-mode-button = 
    .label = Mode compact
    .tooltiptext = Activer/Désactiver le mode compact

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = En savoir plus
harbor-close-label = Fermer
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Rechercher...
harbor-icons-picker-emoji = 
    .label = Émojis
harbor-icons-picker-svg = 
    .label = Icônes
harbor-emojis-picker-search = 
    .placeholder = Rechercher des émojis
urlbar-search-mode-zen_actions = Actions
harbor-site-data-settings = Paramètres
harbor-generic-manage = Gérer
harbor-generic-more = Plus
harbor-generic-next = Suivant
harbor-essentials-promo-label = Ajouter aux Essentials
harbor-essentials-promo-sublabel = Accédez à vos onglets favoris en un clic
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Autorisé
harbor-site-data-setting-block = Bloqué
harbor-site-data-protections-enabled = Activé
harbor-site-data-protections-disabled = Désactivé
harbor-site-data-setting-cross-site = Cookie intersite
harbor-site-data-security-info-extension = 
    .label = Extension
harbor-site-data-security-info-secure = 
    .label = Sécurisé
harbor-site-data-security-info-not-secure = 
    .label = Non sécurisé
harbor-site-data-manage-addons = 
    .label = Gérer les extensions
harbor-site-data-get-addons = 
    .label = Ajouter des extensions
harbor-site-data-site-settings = 
    .label = Tous les paramètres du site
harbor-site-data-header-share = 
    .tooltiptext = Partager cette page
harbor-site-data-header-reader-mode = 
    .tooltiptext = Entrer en mode lecture
harbor-site-data-header-screenshot = 
    .tooltiptext = Prendre une capture d'écran
harbor-site-data-header-bookmark = 
    .tooltiptext = Marquer cette page
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copier l'URL
harbor-site-data-setting-site-protection = Protection contre le pistage

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Un nouvel endroit pour vos extensions, permissions et plus encore
harbor-site-data-panel-feature-callout-subtitle = Cliquez sur l'icône pour gérer les paramètres du site, afficher les infos de sécurité, accéder aux extensions et effectuer d'autres actions.
harbor-open-link-in-glance = 
    .label = Ouvrir le lien dans Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = Mise à jour terminée !

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Quoi de neuf dans { -brand-short-name } ?
harbor-sidebar-notification-updated-tooltip = 
    .title = Voir les notes de version
harbor-sidebar-notification-donate-label = Soutenir { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Faire un don au projet
harbor-sidebar-notification-restart-safe-mode-label = Un problème est survenu ?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Redémarrer en mode de dépannage
harbor-window-sync-migration-dialog-title = Gardez vos fenêtres synchronisées
harbor-window-sync-migration-dialog-message = Harbor synchronise désormais les fenêtres sur le même appareil, de sorte que les modifications apportées à une fenêtre sont instantanément répercutées sur les autres.
harbor-window-sync-migration-dialog-learn-more = En savoir plus
harbor-window-sync-migration-dialog-accept = J'ai compris
harbor-appmenu-new-blank-window = 
    .label = Nouvelle fenêtre vide
