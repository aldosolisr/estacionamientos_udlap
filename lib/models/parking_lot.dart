class ParkingLot {
  const ParkingLot({
    required this.id,
    required this.code,
    required this.name,
    required this.googleMapsUrl,
  });

  final int id;
  final String code;
  final String name;
  final String googleMapsUrl;
}
