# 06 - Configuración, ejecución y mantenimiento

## Dependencias relevantes

En `pubspec.yaml`:

- `url_launcher`
- `shared_preferences`
- `flutter_local_notifications`

## Assets

Las imágenes usadas por zonas están en:

- `assets/images/`

Declaradas en:

- `pubspec.yaml` (`flutter/assets`).

## Ejecución local

Comandos típicos:

```bash
flutter pub get
flutter run
```

## Calidad y pruebas

Actualmente existe prueba base en:

- `test/widget_test.dart`

Recomendado en mantenimiento:

- Añadir pruebas unitarias para `OccupancyService`, `RecentParkingsService` y `DestinationTracker`.
- Añadir golden/smoke tests para flujos de pantalla.

## Extensiones recomendadas

1. Integrar backend real de disponibilidad de estacionamientos.
2. Asociar capacidad total por estacionamiento para estimar cajones libres.
3. Añadir filtros por distancia, horario o preferencia de usuario.
4. Registrar analítica de uso (zonas y estacionamientos más consultados).
5. Internacionalización (ES/EN) y accesibilidad reforzada.
