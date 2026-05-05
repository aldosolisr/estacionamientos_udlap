# 04 - Servicios y estado de la aplicación

## AppServices

Contenedor de servicios de aplicación:

- `PreferencesService`
- `RecentParkingsService`
- `OccupancyService`
- `NotificationsService`
- `DestinationTracker`

También centraliza `bootstrap()` y `dispose()`.

## PreferencesService

Persistencia local de:

- Último tipo de usuario (`last_user_type`).
- Modo de tema (`theme_mode`: system/light/dark).

Exposición reactiva con `ChangeNotifier`.

## RecentParkingsService

Maneja historial reciente de estacionamientos:

- Guarda hasta `maxEntries = 5`.
- Formato persistido: `"lotId|timestamp"` en `StringList`.
- Al insertar, elimina duplicados y agrega al inicio.

## OccupancyService

Responsable de snapshots de ocupación:

- Define intervalos de tick (en bootstrap: 1 minuto).
- Programación con `Timer` para notificar en cada tick.
- Solo mantiene timer activo cuando hay listeners.

Expone:

- `snapshotFor(lot)`
- `nextChangeAt`

## NotificationsService

Encapsula `flutter_local_notifications`:

- Inicializa plugin por plataforma.
- Crea canal Android para cambios de destino.
- Permite enviar notificaciones con `show(title, body)`.
- Falla silenciosamente con `debugPrint` ante errores.

## DestinationTracker

Orquesta destino activo:

- Guarda `ParkingLot` destino.
- Se suscribe a `OccupancyService` al tener destino.
- Detecta cambio de nivel y notifica al usuario.
- Permite limpiar destino (`clear`).
