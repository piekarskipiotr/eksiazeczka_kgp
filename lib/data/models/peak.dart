import 'dart:convert';

import 'package:eksiazeczka_kp/data/constants.dart';
import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/data/models/coordinates.dart';
import 'package:eksiazeczka_kp/data/models/description.dart';
import 'package:eksiazeczka_kp/data/models/peak_user_metadata.dart';
import 'package:eksiazeczka_kp/utils/utils.dart';
import 'package:uuid/uuid.dart';

part 'peak_sqflite.dart';

class Peak {
  Peak({
    required this.name,
    required this.coordinates,
    required this.location,
    required this.mountainRange,
    required this.height,
    required this.difficultyLevel,
    required this.averageAscentTime,
    required this.popularity,
    required this.descriptions,
    this.userMetadata,
    String? id,
  }) : id = id ?? const Uuid().v5(Namespace.url.value, name);

  factory Peak.fromSqflite(Map<String, dynamic> json) => _$PeakFromSqflite(json);

  Map<String, dynamic> toSqflite() => _$PeakToSqflite(this);

  final String id;
  final String name;
  final Coordinates coordinates;
  final String location;
  final String mountainRange;
  final int height;
  final DifficultyLevel difficultyLevel;
  final int averageAscentTime;
  final Popularity popularity;
  final List<Description> descriptions;
  final PeakUserMetadata? userMetadata;

  bool get isConquered => userMetadata != null;

  String get image => '$supabaseUrl/storage/v1/object/public/peaks/${name.snakeCase.normalize}.jpg';

  String get assetImage => 'assets/images/peaks/${name.snakeCase.normalize}.jpg';

  Peak updateUserMetadata(PeakUserMetadata userMetadata) {
    return Peak(
      id: id,
      name: name,
      coordinates: coordinates,
      location: location,
      mountainRange: mountainRange,
      height: height,
      difficultyLevel: difficultyLevel,
      averageAscentTime: averageAscentTime,
      popularity: popularity,
      descriptions: descriptions,
      userMetadata: userMetadata,
    );
  }

  @override
  String toString() {
    return 'Peak{id: $id, name: $name, coordinates: $coordinates, location: $location, mountainRange: $mountainRange, height: $height, difficultyLevel: $difficultyLevel, averageAscentTime: $averageAscentTime, popularity: $popularity, descriptions: $descriptions, userMetadata: $userMetadata}';
  }
}
