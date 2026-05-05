# 01 - Resumen del sistema

## ¿Qué hace la app?

La app ayuda a usuarios de UDLAP a:

1. Elegir su tipo de usuario.
2. Navegar por zonas del campus.
3. Ver estacionamientos por zona.
4. Consultar un estado de ocupación simulado (por color y porcentaje).
5. Abrir rápidamente cada estacionamiento en Google Maps.
6. Guardar estacionamientos recientes y un destino activo.

## Objetivos funcionales

- Mejorar la decisión de a qué estacionamiento ir.
- Reducir el tiempo para abrir navegación externa.
- Mantener continuidad con historial reciente y último tipo de usuario.
- Mostrar variaciones temporales de ocupación.

## Tecnologías clave

- **Flutter** (Material 3).
- **shared_preferences** para persistencia local.
- **url_launcher** para abrir URLs externas.
- **flutter_local_notifications** para avisos de cambio de estado del destino.

## Módulos principales

- `data/`: catálogo de estacionamientos, zonas, marcadores y constantes globales.
- `models/`: entidades inmutables del dominio.
- `services/`: lógica de estado, persistencia, ocupación y notificaciones.
- `screens/`: flujo de pantallas principales.
- `widgets/`: componentes visuales reutilizables.
- `theme/`: paleta y temas claro/oscuro.
