# 02 - Arquitectura y flujo de navegación

## Inicialización

En `main()`, la app:

1. Inicializa binding de Flutter.
2. Ejecuta `AppServices.bootstrap()` para preparar servicios.
3. Inyecta servicios con `AppServicesScope`.
4. Construye `MaterialApp` reactivo a cambios de tema.

## Patrón de estado usado

Se emplea una aproximación ligera con:

- `InheritedWidget` (`AppServicesScope`) para inyección de dependencias.
- `ChangeNotifier` y `ListenableBuilder` para reactividad.

No hay gestor de estado externo (Provider/BLoC/Riverpod); el control está en servicios propios.

## Flujo de navegación

1. **LandingScreen**: selección de tipo de usuario.
2. **DashboardScreen**: zonas, destino actual, recientes y estacionamientos no mapeados.
3. **ZoneScreen**: mapa por zona con marcadores interactivos y lista de estacionamientos.
4. **Google Maps**: se abre en app externa al seleccionar un estacionamiento.

## Flujo de destino

- Al abrir un estacionamiento:
  - Se marca como destino activo.
  - Se registra en recientes.
  - Se lanza Google Maps.
- Mientras hay destino activo, la app escucha cambios de ocupación.
- Si cambia el nivel (ej. de medio a alto), envía notificación local.
