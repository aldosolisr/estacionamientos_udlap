import 'package:flutter/foundation.dart';

import 'parking_lot.dart';

@immutable
class ZoneMarker {
  const ZoneMarker({
    required this.lot,
    required this.dx,
    required this.dy,
  });

  final ParkingLot lot;
  final double dx;
  final double dy;
}

@immutable
class ParkingZone {
  const ParkingZone({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imageAsset,
    required this.imageAspectRatio,
    required this.markers,
  });

  final String id;
  final String name;
  final String subtitle;
  final String imageAsset;
  final double imageAspectRatio;
  final List<ZoneMarker> markers;

  List<ParkingLot> get lots => [for (final m in markers) m.lot];
}
