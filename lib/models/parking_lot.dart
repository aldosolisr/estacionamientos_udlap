enum OccupancyLevel { low, medium, high, full }

class ParkingLot {
  const ParkingLot({
    required this.id,
    required this.code,
    required this.name,
    required this.googleMapsUrl,
    required this.baseOccupancyPercent,
  });

  final int id;
  final String code;
  final String name;
  final String googleMapsUrl;
  final int baseOccupancyPercent;
}
