part 'coordinates_sqflite.dart';

class Coordinates {
  const Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromSqflite(Map<String, dynamic> json) => _$CoordinatesFromSqflite(json);

  Map<String, dynamic> toSqflite() => _$CoordinatesToSqflite(this);

  final double latitude;
  final double longitude;
}
