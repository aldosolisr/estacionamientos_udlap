import '../models/parking_lot.dart';
import '../models/parking_zone.dart';

const List<ParkingZone> kParkingZones = [
  ParkingZone(
    id: 'canchas',
    name: 'Canchas y Salud',
    subtitle: 'Zona deportiva y servicios médicos',
    imageAsset: 'assets/images/canchas.png',
    lots: [
      ParkingLot(
        id: 1,
        code: 'E1',
        name: 'Estacionamiento 1',
        googleMapsUrl: 'https://maps.app.goo.gl/uMPi7T9e2sJyCiHT8',
      ),
      ParkingLot(
        id: 2,
        code: 'E2',
        name: 'Estacionamiento 2',
        googleMapsUrl: 'https://maps.app.goo.gl/e47YzjRKaTZpN11w8',
      ),
      ParkingLot(
        id: 3,
        code: 'E3',
        name: 'Estacionamiento 3',
        googleMapsUrl: 'https://maps.app.goo.gl/bCYwZDB1JqM63NzV7',
      ),
      ParkingLot(
        id: 4,
        code: 'E4',
        name: 'Estacionamiento 4',
        googleMapsUrl: 'https://maps.app.goo.gl/oKC2oZCPp9aBoVdH6',
      ),
      ParkingLot(
        id: 5,
        code: 'E5',
        name: 'Estacionamiento 5',
        googleMapsUrl: 'https://maps.app.goo.gl/1xN3RWcRp6D2s8N46',
      ),
    ],
  ),
  ParkingZone(
    id: 'ingenierias',
    name: 'Ciencias e Ingenierías',
    subtitle: 'Edificios de ciencias, cómputo e ingenierías',
    imageAsset: 'assets/images/ingenierias.png',
    lots: [
      ParkingLot(
        id: 6,
        code: 'E6',
        name: 'Estacionamiento 6',
        googleMapsUrl: 'https://maps.app.goo.gl/R343HwjaHwuNGnr67',
      ),
      ParkingLot(
        id: 7,
        code: 'E7',
        name: 'Estacionamiento 7',
        googleMapsUrl: 'https://maps.app.goo.gl/n43pTKqBhpz4MvAv8',
      ),
      ParkingLot(
        id: 8,
        code: 'E8',
        name: 'Estacionamiento 8',
        googleMapsUrl: 'https://maps.app.goo.gl/8y2w9Dnh9zfBxnmj6',
      ),
      ParkingLot(
        id: 9,
        code: 'E9',
        name: 'Estacionamiento 9',
        googleMapsUrl: 'https://maps.app.goo.gl/B9BAVRW16QQrHeLC8',
      ),
      ParkingLot(
        id: 10,
        code: 'E10',
        name: 'Estacionamiento 10',
        googleMapsUrl: 'https://maps.app.goo.gl/nuoc7pEqyhPjyZTz8',
      ),
    ],
  ),
  ParkingZone(
    id: 'humanidades',
    name: 'Humanidades',
    subtitle: 'Edificios de humanidades y artes',
    imageAsset: 'assets/images/humanidades.png',
    lots: [
      ParkingLot(
        id: 11,
        code: 'E11',
        name: 'Estacionamiento 11',
        googleMapsUrl: 'https://maps.app.goo.gl/1xmtFqa5oD4LVu2y8',
      ),
      ParkingLot(
        id: 12,
        code: 'E12',
        name: 'Estacionamiento 12',
        googleMapsUrl: 'https://maps.app.goo.gl/EKooqwLs1TB7FH6A6',
      ),
      ParkingLot(
        id: 13,
        code: 'E13',
        name: 'Estacionamiento 13',
        googleMapsUrl: 'https://maps.app.goo.gl/jteZVEQfMJtPkySf7',
      ),
      ParkingLot(
        id: 14,
        code: 'E14',
        name: 'Estacionamiento 14',
        googleMapsUrl: 'https://maps.app.goo.gl/1arFVy59WzbQraR88',
      ),
      ParkingLot(
        id: 15,
        code: 'E15',
        name: 'Estacionamiento 15',
        googleMapsUrl: 'https://maps.app.goo.gl/CTgBbAuM85XeKtBN7',
      ),
    ],
  ),
  ParkingZone(
    id: 'negocios',
    name: 'Negocios y Ciencias Sociales',
    subtitle: 'Edificios de negocios y ciencias sociales',
    imageAsset: 'assets/images/negocios.png',
    lots: [
      ParkingLot(
        id: 16,
        code: 'E16',
        name: 'Estacionamiento 16',
        googleMapsUrl: 'https://maps.app.goo.gl/vGzR6T4jJCNGx54b7',
      ),
      ParkingLot(
        id: 17,
        code: 'E17',
        name: 'Estacionamiento 17',
        googleMapsUrl: 'https://maps.app.goo.gl/tbfxRczi28m1Db1Q6',
      ),
      ParkingLot(
        id: 18,
        code: 'E18',
        name: 'Estacionamiento 18',
        googleMapsUrl: 'https://maps.app.goo.gl/ioxJXoKZyRs56Fb2A',
      ),
      ParkingLot(
        id: 19,
        code: 'E19',
        name: 'Estacionamiento 19',
        googleMapsUrl: 'https://maps.app.goo.gl/WEo9Vw3uj6aryoGt8',
      ),
    ],
  ),
];

const List<String> kUserTypes = <String>[
  'Alumno',
  'Profesores',
  'Trabajadores',
  'Visitas',
];
