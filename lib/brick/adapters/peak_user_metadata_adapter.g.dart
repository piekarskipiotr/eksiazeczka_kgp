// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<PeakUserMetadata> _$PeakUserMetadataFromSupabase(
    Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakUserMetadata(
      id: data['id'] as String?,
      conqueredDate: DateTime.parse(data['conquered_date'] as String),
      peakId: data['peak_id'] as String,
      userId: data['user_id'] as String);
}

Future<Map<String, dynamic>> _$PeakUserMetadataToSupabase(
    PeakUserMetadata instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'conquered_date': instance.conqueredDate.toIso8601String(),
    'peak_id': instance.peakId,
    'user_id': instance.userId
  };
}

Future<PeakUserMetadata> _$PeakUserMetadataFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakUserMetadata(
      id: data['id'] as String,
      conqueredDate: DateTime.parse(data['conquered_date'] as String),
      peakId: data['peak_id'] as String,
      userId: data['user_id'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PeakUserMetadataToSqlite(
    PeakUserMetadata instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'conquered_date': instance.conqueredDate.toIso8601String(),
    'peak_id': instance.peakId,
    'user_id': instance.userId
  };
}

/// Construct a [PeakUserMetadata]
class PeakUserMetadataAdapter
    extends OfflineFirstWithSupabaseAdapter<PeakUserMetadata> {
  PeakUserMetadataAdapter();

  @override
  final supabaseTableName = 'peaks_user_metadata';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'conqueredDate': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'conquered_date',
    ),
    'peakId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'peak_id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
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
    'conqueredDate': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'conquered_date',
      iterable: false,
      type: DateTime,
    ),
    'peakId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'peak_id',
      iterable: false,
      type: String,
    ),
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      PeakUserMetadata instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `PeakUserMetadata` WHERE id = ? LIMIT 1''',
        [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'PeakUserMetadata';

  @override
  Future<PeakUserMetadata> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakUserMetadataFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(PeakUserMetadata input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakUserMetadataToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<PeakUserMetadata> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakUserMetadataFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(PeakUserMetadata input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakUserMetadataToSqlite(input,
          provider: provider, repository: repository);
}
