// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_core/query.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/db.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/brick_sqlite.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_supabase/brick_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:eksiazeczka_kgp/data/models/peak_coordinates.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:eksiazeczka_kgp/data/models/peak_description.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:eksiazeczka_kgp/data/models/peak_user_metadata.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:uuid/uuid.dart';// GENERATED CODE DO NOT EDIT
// ignore: unused_import
import 'dart:convert';
import 'package:brick_sqlite/brick_sqlite.dart' show SqliteModel, SqliteAdapter, SqliteModelDictionary, RuntimeSqliteColumnDefinition, SqliteProvider;
import 'package:brick_supabase/brick_supabase.dart' show SupabaseProvider, SupabaseModel, SupabaseAdapter, SupabaseModelDictionary;
// ignore: unused_import, unused_shown_name
import 'package:brick_offline_first/brick_offline_first.dart' show RuntimeOfflineFirstDefinition;
// ignore: unused_import, unused_shown_name
import 'package:sqflite_common/sqlite_api.dart' show DatabaseExecutor;

import '../data/models/peak.model.dart';
import '../data/models/peak_description.model.dart';
import '../data/models/peak_coordinates.model.dart';
import '../data/models/peak_user_metadata.model.dart';

part 'adapters/peak_adapter.g.dart';
part 'adapters/peak_description_adapter.g.dart';
part 'adapters/peak_coordinates_adapter.g.dart';
part 'adapters/peak_user_metadata_adapter.g.dart';

/// Supabase mappings should only be used when initializing a [SupabaseProvider]
final Map<Type, SupabaseAdapter<SupabaseModel>> supabaseMappings = {
  Peak: PeakAdapter(),
  PeakDescription: PeakDescriptionAdapter(),
  PeakCoordinates: PeakCoordinatesAdapter(),
  PeakUserMetadata: PeakUserMetadataAdapter()
};
final supabaseModelDictionary = SupabaseModelDictionary(supabaseMappings);

/// Sqlite mappings should only be used when initializing a [SqliteProvider]
final Map<Type, SqliteAdapter<SqliteModel>> sqliteMappings = {
  Peak: PeakAdapter(),
  PeakDescription: PeakDescriptionAdapter(),
  PeakCoordinates: PeakCoordinatesAdapter(),
  PeakUserMetadata: PeakUserMetadataAdapter()
};
final sqliteModelDictionary = SqliteModelDictionary(sqliteMappings);
