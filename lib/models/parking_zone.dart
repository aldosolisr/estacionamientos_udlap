import 'package:flutter/foundation.dart';

import 'parking_lot.dart';

@immutable
class ParkingZone {
  const ParkingZone({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imageAsset,
    required this.lots,
  });

  final String id;
  final String name;
  final String subtitle;
  final String imageAsset;
  final List<ParkingLot> lots;
}
