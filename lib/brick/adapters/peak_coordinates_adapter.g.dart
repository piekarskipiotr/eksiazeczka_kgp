// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<PeakCoordinates> _$PeakCoordinatesFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakCoordinates(
      coordinatesLat: data['coordinates_lat'] as double,
      coordinatesLng: data['coordinates_lng'] as double,
      peakId: data['peak_id'] as String);
}

Future<Map<String, dynamic>> _$PeakCoordinatesToSupabase(
    PeakCoordinates instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'coordinates_lat': instance.coordinatesLat,
    'coordinates_lng': instance.coordinatesLng,
    'peak_id': instance.peakId
  };
}

Future<PeakCoordinates> _$PeakCoordinatesFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakCoordinates(
      coordinatesLat: data['coordinates_lat'] as double,
      coordinatesLng: data['coordinates_lng'] as double,
      peakId: data['peak_id'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PeakCoordinatesToSqlite(PeakCoordinates instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'coordinates_lat': instance.coordinatesLat,
    'coordinates_lng': instance.coordinatesLng,
    'peak_id': instance.peakId
  };
}

/// Construct a [PeakCoordinates]
class PeakCoordinatesAdapter
    extends OfflineFirstWithSupabaseAdapter<PeakCoordinates> {
  PeakCoordinatesAdapter();

  @override
  final supabaseTableName = 'peak_coordinates';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'coordinatesLat': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'coordinates_lat',
    ),
    'coordinatesLng': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'coordinates_lng',
    ),
    'peakId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'peak_id',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'coordinatesLat': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'coordinates_lat',
      iterable: false,
      type: double,
    ),
    'coordinatesLng': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'coordinates_lng',
      iterable: false,
      type: double,
    ),
    'peakId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'peak_id',
      iterable: false,
      type: String,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
          PeakCoordinates instance, DatabaseExecutor executor) async =>
      instance.primaryKey;
  @override
  final String tableName = 'PeakCoordinates';

  @override
  Future<PeakCoordinates> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakCoordinatesFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(PeakCoordinates input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakCoordinatesToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<PeakCoordinates> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakCoordinatesFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(PeakCoordinates input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakCoordinatesToSqlite(input,
          provider: provider, repository: repository);
}
