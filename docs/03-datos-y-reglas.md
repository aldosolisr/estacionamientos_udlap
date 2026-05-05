# 03 - Datos y reglas de negocio

## Catálogo de estacionamientos

`parking_data.dart` define 19 estacionamientos (`E1` ... `E19`) con:

- `id`
- `code`
- `name`
- `googleMapsUrl`
- `baseOccupancyPercent`

## Zonas de campus

Hay 4 zonas principales:

- Canchas y Salud
- Ciencias e Ingenierías
- Humanidades
- Negocios y Ciencias Sociales

Cada zona incluye:

- Imagen (`assets/images/*.png`)
- Relación de aspecto para render responsivo
- Marcadores normalizados (`dx`, `dy`) vinculados a un estacionamiento

## Tipos de usuario

Tipos configurados:

- Alumno
- Profesores
- Trabajadores
- Visitas

## Regla de "no mapeados"

`kUnmappedParkingLots` calcula los estacionamientos que existen en el catálogo pero no aparecen en ningún marcador de zona.

Esto permite mostrarlos en Dashboard como lista alternativa.

## Ocupación simulada

La ocupación no viene de backend; se simula con una variación pseudoaleatoria por tiempo:

- Parte de `baseOccupancyPercent`.
- Aplica delta en rango `[-25, +25]`.
- Usa una mezcla hash de `lot.id` y "tick" actual.

### Niveles

- `low`: < 45%
- `medium`: 45% - 74%
- `high`: 75% - 94%
- `full`: >= 95%

Cada nivel tiene color y etiqueta para UI.
