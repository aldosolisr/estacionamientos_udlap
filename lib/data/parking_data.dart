import '../models/parking_lot.dart';
import '../models/parking_zone.dart';

const ParkingLot _e1 = ParkingLot(
  id: 1,
  code: 'E1',
  name: 'Estacionamiento 1',
  googleMapsUrl: 'https://maps.app.goo.gl/uMPi7T9e2sJyCiHT8',
  baseOccupancyPercent: 32,
);
const ParkingLot _e2 = ParkingLot(
  id: 2,
  code: 'E2',
  name: 'Estacionamiento 2',
  googleMapsUrl: 'https://maps.app.goo.gl/e47YzjRKaTZpN11w8',
  baseOccupancyPercent: 58,
);
const ParkingLot _e3 = ParkingLot(
  id: 3,
  code: 'E3',
  name: 'Estacionamiento 3',
  googleMapsUrl: 'https://maps.app.goo.gl/bCYwZDB1JqM63NzV7',
  baseOccupancyPercent: 81,
);
const ParkingLot _e4 = ParkingLot(
  id: 4,
  code: 'E4',
  name: 'Estacionamiento 4',
  googleMapsUrl: 'https://maps.app.goo.gl/oKC2oZCPp9aBoVdH6',
  baseOccupancyPercent: 22,
);
const ParkingLot _e5 = ParkingLot(
  id: 5,
  code: 'E5',
  name: 'Estacionamiento 5',
  googleMapsUrl: 'https://maps.app.goo.gl/1xN3RWcRp6D2s8N46',
  baseOccupancyPercent: 67,
);
const ParkingLot _e6 = ParkingLot(
  id: 6,
  code: 'E6',
  name: 'Estacionamiento 6',
  googleMapsUrl: 'https://maps.app.goo.gl/R343HwjaHwuNGnr67',
  baseOccupancyPercent: 49,
);
const ParkingLot _e7 = ParkingLot(
  id: 7,
  code: 'E7',
  name: 'Estacionamiento 7',
  googleMapsUrl: 'https://maps.app.goo.gl/n43pTKqBhpz4MvAv8',
  baseOccupancyPercent: 15,
);
const ParkingLot _e8 = ParkingLot(
  id: 8,
  code: 'E8',
  name: 'Estacionamiento 8',
  googleMapsUrl: 'https://maps.app.goo.gl/8y2w9Dnh9zfBxnmj6',
  baseOccupancyPercent: 73,
);
const ParkingLot _e9 = ParkingLot(
  id: 9,
  code: 'E9',
  name: 'Estacionamiento 9',
  googleMapsUrl: 'https://maps.app.goo.gl/B9BAVRW16QQrHeLC8',
  baseOccupancyPercent: 96,
);
const ParkingLot _e10 = ParkingLot(
  id: 10,
  code: 'E10',
  name: 'Estacionamiento 10',
  googleMapsUrl: 'https://maps.app.goo.gl/nuoc7pEqyhPjyZTz8',
  baseOccupancyPercent: 41,
);
const ParkingLot _e11 = ParkingLot(
  id: 11,
  code: 'E11',
  name: 'Estacionamiento 11',
  googleMapsUrl: 'https://maps.app.goo.gl/1xmtFqa5oD4LVu2y8',
  baseOccupancyPercent: 28,
);
const ParkingLot _e12 = ParkingLot(
  id: 12,
  code: 'E12',
  name: 'Estacionamiento 12',
  googleMapsUrl: 'https://maps.app.goo.gl/EKooqwLs1TB7FH6A6',
  baseOccupancyPercent: 84,
);
const ParkingLot _e13 = ParkingLot(
  id: 13,
  code: 'E13',
  name: 'Estacionamiento 13',
  googleMapsUrl: 'https://maps.app.goo.gl/jteZVEQfMJtPkySf7',
  baseOccupancyPercent: 55,
);
const ParkingLot _e14 = ParkingLot(
  id: 14,
  code: 'E14',
  name: 'Estacionamiento 14',
  googleMapsUrl: 'https://maps.app.goo.gl/1arFVy59WzbQraR88',
  baseOccupancyPercent: 38,
);
const ParkingLot _e15 = ParkingLot(
  id: 15,
  code: 'E15',
  name: 'Estacionamiento 15',
  googleMapsUrl: 'https://maps.app.goo.gl/CTgBbAuM85XeKtBN7',
  baseOccupancyPercent: 12,
);
const ParkingLot _e16 = ParkingLot(
  id: 16,
  code: 'E16',
  name: 'Estacionamiento 16',
  googleMapsUrl: 'https://maps.app.goo.gl/vGzR6T4jJCNGx54b7',
  baseOccupancyPercent: 62,
);
const ParkingLot _e17 = ParkingLot(
  id: 17,
  code: 'E17',
  name: 'Estacionamiento 17',
  googleMapsUrl: 'https://maps.app.goo.gl/tbfxRczi28m1Db1Q6',
  baseOccupancyPercent: 45,
);
const ParkingLot _e18 = ParkingLot(
  id: 18,
  code: 'E18',
  name: 'Estacionamiento 18',
  googleMapsUrl: 'https://maps.app.goo.gl/ioxJXoKZyRs56Fb2A',
  baseOccupancyPercent: 78,
);
const ParkingLot _e19 = ParkingLot(
  id: 19,
  code: 'E19',
  name: 'Estacionamiento 19',
  googleMapsUrl: 'https://maps.app.goo.gl/WEo9Vw3uj6aryoGt8',
  baseOccupancyPercent: 33,
);

const List<ParkingLot> kAllParkingLots = [
  _e1, _e2, _e3, _e4, _e5, _e6, _e7, _e8, _e9, _e10,
  _e11, _e12, _e13, _e14, _e15, _e16, _e17, _e18, _e19,
];

const List<ParkingZone> kParkingZones = [
  ParkingZone(
    id: 'canchas',
    name: 'Canchas y Salud',
    subtitle: 'Zona deportiva y servicios médicos',
    imageAsset: 'assets/images/canchas.png',
    imageAspectRatio: 949 / 551,
    markers: [
      ZoneMarker(lot: _e7, dx: 0.513, dy: 0.202),
      ZoneMarker(lot: _e18, dx: 0.526, dy: 0.438),
      ZoneMarker(lot: _e16, dx: 0.326, dy: 0.854),
    ],
  ),
  ParkingZone(
    id: 'ingenierias',
    name: 'Ciencias e Ingenierías',
    subtitle: 'Edificios de ciencias, cómputo e ingenierías',
    imageAsset: 'assets/images/ingenierias.png',
    imageAspectRatio: 904 / 390,
    markers: [
      ZoneMarker(lot: _e8, dx: 0.826, dy: 0.422),
      ZoneMarker(lot: _e3, dx: 0.158, dy: 0.530),
      ZoneMarker(lot: _e2, dx: 0.400, dy: 0.596),
      ZoneMarker(lot: _e1, dx: 0.628, dy: 0.647),
      ZoneMarker(lot: _e11, dx: 0.091, dy: 0.657),
      ZoneMarker(lot: _e9, dx: 0.793, dy: 0.802),
      ZoneMarker(lot: _e10, dx: 0.550, dy: 0.859),
    ],
  ),
  ParkingZone(
    id: 'humanidades',
    name: 'Humanidades',
    subtitle: 'Edificios de humanidades y artes',
    imageAsset: 'assets/images/humanidades.png',
    imageAspectRatio: 596 / 552,
    markers: [
      ZoneMarker(lot: _e19, dx: 0.244, dy: 0.212),
      ZoneMarker(lot: _e13, dx: 0.162, dy: 0.436),
      ZoneMarker(lot: _e12, dx: 0.177, dy: 0.606),
      ZoneMarker(lot: _e3, dx: 0.480, dy: 0.708),
      ZoneMarker(lot: _e2, dx: 0.829, dy: 0.777),
      ZoneMarker(lot: _e4, dx: 0.611, dy: 0.193),
    ],
  ),
  ParkingZone(
    id: 'negocios',
    name: 'Negocios y Ciencias Sociales',
    subtitle: 'Edificios de negocios y ciencias sociales',
    imageAsset: 'assets/images/negocios.png',
    imageAspectRatio: 880 / 302,
    markers: [
      ZoneMarker(lot: _e14, dx: 0.866, dy: 0.144),
      ZoneMarker(lot: _e5, dx: 0.524, dy: 0.310),
      ZoneMarker(lot: _e6, dx: 0.700, dy: 0.443),
      ZoneMarker(lot: _e4, dx: 0.220, dy: 0.509),
    ],
  ),
];

const List<String> kUserTypes = <String>[
  'Alumno',
  'Profesores',
  'Trabajadores',
  'Visitas',
];

List<ParkingLot> get kUnmappedParkingLots {
  final mapped = <int>{
    for (final z in kParkingZones)
      for (final m in z.markers) m.lot.id,
  };
  return [for (final lot in kAllParkingLots) if (!mapped.contains(lot.id)) lot];
}
