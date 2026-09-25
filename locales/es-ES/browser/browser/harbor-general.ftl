# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

harbor-panel-ui-current-profile-text = perfil actual
unified-extensions-description = Las extensiones se utilizan para agregar más funcionalidades a { -brand-short-name }.
tab-context-harbor-reset-pinned-tab = 
    .label =
        { $isEssential ->
            [true] Restablecer pestaña esencial
           *[false] Restablecer pestaña fijada
        }
    .accesskey = R
tab-context-harbor-add-essential = 
    .label = Añadir a esenciales
    .accesskey = E
tab-context-harbor-add-essential-badge = { $num } / { $max } huecos llenos
tab-context-harbor-remove-essential = 
    .label = Quitar de esenciales
    .accesskey = R
tab-context-harbor-edit-pinned-page = 
    .label =
        { $isEssential ->
            [true] Editar URL esencial
           *[false] Editar URL fijada
        }
    .accesskey = P
tab-context-harbor-replace-pinned-url-with-current = 
    .label = Reemplazar con la URL actual
    .accesskey = C
tab-context-harbor-edit-pinned-url = 
    .label = Editar…
    .accesskey = E
tab-context-harbor-edit-title = 
    .label = Cambiar etiqueta...
tab-context-harbor-edit-icon = 
    .label = Cambiar icono...
harbor-themes-corrupted = Su archivo de mods de { -brand-short-name } está dañado. Se ha restablecido el tema por defecto.
harbor-shortcuts-corrupted = Su archivo de atajos de { -brand-short-name } está dañado. Se han restablecido los atajos por defecto.
# note: Do not translate the "<br/>" tags in the following string
harbor-new-urlbar-notification =
    Se ha habilitado la nueva barra de direcciones, eliminando la necesidad de la página de nueva pestaña.<br/><br/>
    ¡Pruebe a abrir una nueva pestaña para ver la nueva barra de direcciones en acción!
harbor-disable = Deshabilitar
pictureinpicture-minimize-btn = 
    .aria-label = Minimizar
    .tooltip = Minimizar
harbor-panel-ui-gradient-generator-custom-color = Color personalizado
harbor-copy-current-url-confirmation = ¡URL actual copiada!
harbor-copy-current-url-as-markdown-confirmation = ¡La URL actual se copió como Markdown!
harbor-general-cancel-label = 
    .label = Cancelar
harbor-general-confirm = 
    .label = Confirmar
harbor-pinned-tab-replaced = La URL de la pestaña fijada se ha reemplazado por la URL actual.
harbor-pinned-tab-url-edited = ¡La URL de la pestaña fijada ha sido actualizada!
harbor-pinned-tab-url-invalid = Eso no parece una URL válida.
harbor-pinned-tab-edit-url-title = Editar URL fijada
harbor-pinned-tab-edit-url-label = Introduzca la URL a la que debe apuntar esta pestaña fijada:
harbor-tabs-renamed = ¡La pestaña se ha renombrado con éxito!
harbor-background-tab-opened-toast = ¡Nueva pestaña abierta en segundo plano!
harbor-workspace-renamed-toast = ¡El espacio de trabajo ha sido renombrado con éxito!
harbor-split-view-limit-toast = ¡No se pueden añadir más paneles a la vista dividida!
harbor-toggle-compact-mode-button = 
    .label = Modo compacto
    .tooltiptext = Alternar modo compacto

# note: Do not translate the "<br/>" tags in the following string

harbor-learn-more-text = Más información
harbor-close-label = Cerrar
harbor-singletoolbar-urlbar-placeholder-with-name = 
    .placeholder = Buscar...
harbor-icons-picker-emoji = 
    .label = Emojis
harbor-icons-picker-svg = 
    .label = Iconos
harbor-emojis-picker-search = 
    .placeholder = Buscar emojis
urlbar-search-mode-zen_actions = Acciones
harbor-site-data-settings = Ajustes
harbor-generic-manage = Administrar
harbor-generic-more = Más
harbor-generic-next = Siguiente
harbor-essentials-promo-label = Añadir a esenciales
harbor-essentials-promo-sublabel = Mantenga sus pestañas favoritas a solo un clic de distancia
# These labels will be used for the site data panel settings
harbor-site-data-setting-allow = Permitido
harbor-site-data-setting-block = Bloqueado
harbor-site-data-protections-enabled = Activada
harbor-site-data-protections-disabled = Desactivada
harbor-site-data-setting-cross-site = Cookie de terceros
harbor-site-data-security-info-extension = 
    .label = Extensión
harbor-site-data-security-info-secure = 
    .label = Seguro
harbor-site-data-security-info-not-secure = 
    .label = No seguro
harbor-site-data-manage-addons = 
    .label = Administrar extensiones
harbor-site-data-get-addons = 
    .label = Añadir extensión
harbor-site-data-site-settings = 
    .label = Todas las configuraciones del sitio
harbor-site-data-header-share = 
    .tooltiptext = Compartir esta página
harbor-site-data-header-reader-mode = 
    .tooltiptext = Entrar en modo lectura
harbor-site-data-header-screenshot = 
    .tooltiptext = Tomar una captura de pantalla
harbor-site-data-header-bookmark = 
    .tooltiptext = Añadir esta página a marcadores
harbor-urlbar-copy-url-button = 
    .tooltiptext = Copiar URL
harbor-site-data-setting-site-protection = Protección contra el rastreo

# Section: Feature callouts

harbor-site-data-panel-feature-callout-title = Un nuevo hogar para complementos, permisos y más
harbor-site-data-panel-feature-callout-subtitle = Haga clic en el icono para administrar la configuración del sitio, ver información de seguridad, acceder a extensiones, y realizar acciones comunes.
harbor-open-link-in-glance = 
    .label = Abrir enlace en Glance
    .accesskey = G
harbor-sidebar-notification-updated-heading = ¡Actualización completada!

# See HarborSidebarNotification.mjs to see how these would be used

harbor-sidebar-notification-updated-label = Novedades en { -brand-short-name }
harbor-sidebar-notification-updated-tooltip = 
    .title = Ver notas de la versión
harbor-sidebar-notification-donate-label = Soporte { -brand-short-name }
harbor-sidebar-notification-donate-tooltip = 
    .title = Donar al proyecto
harbor-sidebar-notification-restart-safe-mode-label = ¿Algo dejó de funcionar?
harbor-sidebar-notification-restart-safe-mode-tooltip = 
    .title = Reiniciar en modo seguro
harbor-window-sync-migration-dialog-title = Mantenga sus ventanas sincronizadas
harbor-window-sync-migration-dialog-message = Ahora Harbor sincroniza las ventanas en el mismo dispositivo, por lo que los cambios en una ventana se reflejan en las demás instantáneamente.
harbor-window-sync-migration-dialog-learn-more = Más información
harbor-window-sync-migration-dialog-accept = Entendido
harbor-appmenu-new-blank-window = 
    .label = Nueva ventana en blanco
