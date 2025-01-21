import 'dart:convert';

import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:sqflite/sqflite.dart';

class LocalPeaksRepository {
  const LocalPeaksRepository(this._database);

  final Database _database;
  static const _tableName = 'peaks';
  static const _userMetadataTableName = 'user_metadata';

  Future<List<Peak>> select() async {
    const rawQuery = '''
      SELECT 
        peaks.id,
        peaks.name,
        peaks.coordinates,
        peaks.location,
        peaks.mountain_range,
        peaks.height,
        peaks.difficulty_level,
        peaks.average_ascent_time,
        peaks.popularity,
        peaks.descriptions,
        user_metadata.id AS user_metadata_id,
        user_metadata.user_id AS user_metadata_user_id,
        user_metadata.peak_id AS user_metadata_peak_id,
        user_metadata.conquered_date
      FROM $_tableName AS peaks
      LEFT JOIN $_userMetadataTableName AS user_metadata 
      ON peaks.id = user_metadata.peak_id
    ''';

    try {
      final result = await _database.rawQuery(rawQuery);
      return List<Peak>.from(
        result.map((row) {
          final peakData = {
            'id': row['id'],
            'name': row['name'],
            'coordinates': row['coordinates'],
            'location': row['location'],
            'mountain_range': row['mountain_range'],
            'height': row['height'],
            'difficulty_level': row['difficulty_level'],
            'average_ascent_time': row['average_ascent_time'],
            'popularity': row['popularity'],
            'descriptions': row['descriptions'],
            'user_metadata': row['user_metadata_id'] != null
                ? jsonEncode({
                    'id': row['user_metadata_id'],
                    'user_id': row['user_metadata_user_id'],
                    'peak_id': row['user_metadata_peak_id'],
                    'conquered_date': row['conquered_date'],
                  })
                : null,
          };

          return Peak.fromSqflite(peakData);
        }),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
