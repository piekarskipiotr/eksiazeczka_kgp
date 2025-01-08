// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<PeakDescription> _$PeakDescriptionFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakDescription(
      id: data['id'] as String?,
      locale: data['locale'] as String,
      text: data['text'] as String,
      peakId: data['peak_id'] as String);
}

Future<Map<String, dynamic>> _$PeakDescriptionToSupabase(
    PeakDescription instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'locale': instance.locale,
    'text': instance.text,
    'peak_id': instance.peakId
  };
}

Future<PeakDescription> _$PeakDescriptionFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PeakDescription(
      id: data['id'] as String,
      locale: data['locale'] as String,
      text: data['text'] as String,
      peakId: data['peak_id'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PeakDescriptionToSqlite(PeakDescription instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'locale': instance.locale,
    'text': instance.text,
    'peak_id': instance.peakId
  };
}

/// Construct a [PeakDescription]
class PeakDescriptionAdapter
    extends OfflineFirstWithSupabaseAdapter<PeakDescription> {
  PeakDescriptionAdapter();

  @override
  final supabaseTableName = 'peaks_description';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'locale': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'locale',
    ),
    'text': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'text',
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
    'locale': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'locale',
      iterable: false,
      type: String,
    ),
    'text': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'text',
      iterable: false,
      type: String,
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
      PeakDescription instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `PeakDescription` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'PeakDescription';

  @override
  Future<PeakDescription> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakDescriptionFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(PeakDescription input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakDescriptionToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<PeakDescription> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakDescriptionFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(PeakDescription input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakDescriptionToSqlite(input,
          provider: provider, repository: repository);
}
