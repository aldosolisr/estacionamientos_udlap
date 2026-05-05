# 05 - Pantallas y componentes UI

## Pantallas

### LandingScreen

- Hero de marca UDLAP.
- Selector de tipo de usuario.
- Tarjeta "continuar como" si existe sesión previa.
- Acceso rápido para visitas (`VisitorAccessCard`).

### DashboardScreen

- Saludo por tipo de usuario.
- Toggle de tema (system → light → dark).
- Banner de destino activo (`DestinationBanner`).
- Grid de zonas.
- Lista de recientes con opción de borrar.
- Lista de estacionamientos no mapeados.

### ZoneScreen

- Cabecera con subtítulo de zona.
- `ParkingMap` con marcadores tocables (E#).
- Leyenda de ocupación y próximo cambio.
- Lista de estacionamientos de la zona.

## Componentes clave

- `ParkingButton`: botón de estacionamiento con ocupación en tiempo real.
- `ParkingMap`: render de imagen + marcadores por coordenadas normalizadas.
- `DestinationBanner`: estado del destino actual y acciones (cancelar/llegué).
- `OccupancyLegend`: equivalencia color ↔ nivel.
- `NextTickLabel`: hora del próximo recálculo.
- `VisitorAccessCard`: CTA para portal externo de accesos.

## Comportamiento de enlaces externos

`openExternalUrl()` abre URLs con `LaunchMode.externalApplication`.
Si falla, muestra `SnackBar` de error.
