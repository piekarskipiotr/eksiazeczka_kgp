part of 'coordinates.dart';

Coordinates _$CoordinatesFromSqflite(Map<String, dynamic> json) => Coordinates(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );

Map<String, dynamic> _$CoordinatesToSqflite(Coordinates instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
