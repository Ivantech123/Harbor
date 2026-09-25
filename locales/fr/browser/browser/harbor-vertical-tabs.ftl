# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-toolbar-context-tabs-right = 
    .label = Onglets à droite
    .accesskey = R
harbor-toolbar-context-compact-mode = 
    .label = Mode compact
harbor-toolbar-context-compact-mode-enable = 
    .label = Activer le mode compact
    .accesskey = D
harbor-toolbar-context-compact-mode-just-tabs = 
    .label = Masquer la barre latérale
harbor-toolbar-context-compact-mode-just-toolbar = 
    .label = Masquer la barre d’outils
harbor-toolbar-context-compact-mode-hide-both = 
    .label = Masquer les deux
    .accesskey = H
harbor-toolbar-context-move-to-folder = 
    .label = Déplacer vers le dossier...
    .accesskey = M
harbor-toolbar-context-new-folder = 
    .label = Nouveau dossier
    .accesskey = N
sidebar-harbor-expand = 
    .label = Étendre la barre latérale
sidebar-harbor-create-new = 
    .label = Créer...
tabbrowser-unload-tab-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Décharger et passer à l’onglet
           *[other] Décharger les { $tabCount } onglets et passer au premier
        }
tabbrowser-reset-pin-button = 
    .tooltiptext =
        { $tabCount ->
            [one] Rétablir et épingler l'onglet
           *[other] Rétablir et épingler { $tabCount } onglets
        }
harbor-tab-sublabel =
    { $tabSubtitle ->
        [harbor-default-pinned] Retour à l'URL épinglée
        [harbor-default-pinned-cmd] Séparer de l'onglet épinglé
       *[other] { $tabSubtitle }
    }
