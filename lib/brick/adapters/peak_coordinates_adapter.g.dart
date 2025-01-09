// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<PeakCoordinates> _$PeakCoordinatesFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakCoordinates(
      id: data['id'] as String?,
      lat: data['lat'] as double,
      lng: data['lng'] as double,
      peakId: data['peak_id'] as String);
}

Future<Map<String, dynamic>> _$PeakCoordinatesToSupabase(
    PeakCoordinates instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'lat': instance.lat,
    'lng': instance.lng,
    'peak_id': instance.peakId
  };
}

Future<PeakCoordinates> _$PeakCoordinatesFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakCoordinates(
      id: data['id'] as String,
      lat: data['lat'] as double,
      lng: data['lng'] as double,
      peakId: data['peak_id'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PeakCoordinatesToSqlite(PeakCoordinates instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'lat': instance.lat,
    'lng': instance.lng,
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
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'lat': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'lat',
    ),
    'lng': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'lng',
    ),
    'peakId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'peak_id',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'id'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'id': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'id',
      iterable: false,
      type: String,
    ),
    'lat': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'lat',
      iterable: false,
      type: double,
    ),
    'lng': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'lng',
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
      PeakCoordinates instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `PeakCoordinates` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

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
