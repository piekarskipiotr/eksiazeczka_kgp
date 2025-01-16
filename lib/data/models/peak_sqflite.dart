part of 'peak.dart';

Peak _$PeakFromSqflite(Map<String, dynamic> json) => Peak(
      id: json['id'] as String,
      name: json['name'] as String,
      coordinates: Coordinates.fromSqflite(jsonDecode(json['coordinates'] as String) as Map<String, dynamic>),
      location: json['location'] as String,
      mountainRange: json['mountain_range'] as String,
      height: json['height'] as int,
      difficultyLevel: DifficultyLevel.values[json['difficulty_level'] as int],
      averageAscentTime: json['average_ascent_time'] as int,
      popularity: Popularity.values[json['popularity'] as int],
      descriptions: (jsonDecode(json['descriptions'] as String) as List<dynamic>)
          .map((e) => Description.fromSqflite(e as Map<String, dynamic>))
          .toList(),
      userMetadata: json['user_metadata'] != null
          ? PeakUserMetadata.fromSqflite(jsonDecode(json['user_metadata'] as String) as Map<String, dynamic>)
          : null,
    );

Map<String, dynamic> _$PeakToSqflite(Peak instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coordinates': jsonEncode(instance.coordinates.toSqflite()),
      'location': instance.location,
      'mountain_range': instance.mountainRange,
      'height': instance.height,
      'difficulty_level': instance.difficultyLevel.index,
      'average_ascent_time': instance.averageAscentTime,
      'popularity': instance.popularity.index,
      'descriptions': jsonEncode(instance.descriptions.map((e) => e.toSqflite()).toList()),
    };
