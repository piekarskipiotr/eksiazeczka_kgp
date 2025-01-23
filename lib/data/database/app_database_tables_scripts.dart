import 'dart:convert';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class AppDatabaseTablesScripts {
  static Future<void> createPeaksTable(Database db) async {
    await db.execute('''
    CREATE TABLE peaks (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      coordinates TEXT NOT NULL,
      location TEXT NOT NULL,
      mountain_range TEXT NOT NULL,
      height INTEGER NOT NULL,
      difficulty_level INTEGER NOT NULL,
      average_ascent_time INTEGER NOT NULL,
      popularity INTEGER NOT NULL,
      descriptions TEXT NOT NULL
    )
  ''');
  }


  static Future<void> createUserMetadataTable(Database db) async {
    await db.execute('''
    CREATE TABLE user_metadata (
      id TEXT PRIMARY KEY,
      user_id TEXT,
      peak_id TEXT NOT NULL,
      conquered_date TEXT NOT NULL,
      FOREIGN KEY (peak_id) REFERENCES peaks (id)
    )
  ''');
  }

  static Future<void> insertPeaksData(Database db) async {
    final batch = db.batch();
    final jsonString = await rootBundle.loadString(Jsons.peaks);
    final jsonData = (jsonDecode(jsonString) as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();

    for (final peak in jsonData) {
      final formattedPeak = {
        'id': const Uuid().v5(Namespace.url.value, peak['name'] as String),
        'name': peak['name'],
        'coordinates': jsonEncode(peak['coordinates']),
        'location': peak['location'],
        'mountain_range': peak['mountain_range'],
        'height': peak['height'],
        'difficulty_level': peak['difficulty_level'],
        'average_ascent_time': peak['average_ascent_time'],
        'popularity': peak['popularity'],
        'descriptions': jsonEncode(peak['descriptions']),
      };

      batch.insert('peaks', formattedPeak);
    }

    await batch.commit(noResult: true);
  }
}
