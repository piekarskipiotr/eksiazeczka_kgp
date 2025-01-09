// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Peak> _$PeakFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Peak(
      id: data['id'] as String?,
      name: data['name'] as String,
      coordinates: await PeakCoordinatesAdapter().fromSupabase(
          data['coordinates'],
          provider: provider,
          repository: repository),
      location: data['location'] as String,
      mountainRange: data['mountain_range'] as String,
      height: data['height'] as int,
      difficultyLevel: DifficultyLevel.values[data['difficulty_level'] as int],
      averageAscentTime: data['average_ascent_time'] as int,
      popularity: Popularity.values[data['popularity'] as int],
      descriptions: await Future.wait<PeakDescription>(data['descriptions']
              ?.map((d) => PeakDescriptionAdapter()
                  .fromSupabase(d, provider: provider, repository: repository))
              .toList()
              .cast<Future<PeakDescription>>() ??
          []),
      userMetadata: data['user_metadata'] == null
          ? null
          : await PeakUserMetadataAdapter().fromSupabase(data['user_metadata'],
              provider: provider, repository: repository));
}

Future<Map<String, dynamic>> _$PeakToSupabase(Peak instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'location': instance.location,
    'mountain_range': instance.mountainRange,
    'height': instance.height,
    'difficulty_level':
        DifficultyLevel.values.indexOf(instance.difficultyLevel),
    'average_ascent_time': instance.averageAscentTime,
    'popularity': Popularity.values.indexOf(instance.popularity)
  };
}

Future<Peak> _$PeakFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Peak(
      id: data['id'] as String,
      name: data['name'] as String,
      coordinates: (await repository!.getAssociation<PeakCoordinates>(
        Query.where(
            'primaryKey', data['coordinates_PeakCoordinates_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      location: data['location'] as String,
      mountainRange: data['mountain_range'] as String,
      height: data['height'] as int,
      difficultyLevel: DifficultyLevel.values[data['difficulty_level'] as int],
      averageAscentTime: data['average_ascent_time'] as int,
      popularity: Popularity.values[data['popularity'] as int],
      descriptions: (await provider.rawQuery(
              'SELECT DISTINCT `f_PeakDescription_brick_id` FROM `_brick_Peak_descriptions` WHERE l_Peak_brick_id = ?',
              [data['_brick_id'] as int]).then((results) {
        final ids = results.map((r) => r['f_PeakDescription_brick_id']);
        return Future.wait<PeakDescription>(ids.map((primaryKey) => repository
            .getAssociation<PeakDescription>(
              Query.where('primaryKey', primaryKey, limit1: true),
            )
            .then((r) => r!.first)));
      }))
          .toList()
          .cast<PeakDescription>(),
      userMetadata: data['user_metadata_PeakUserMetadata_brick_id'] == null
          ? null
          : (data['user_metadata_PeakUserMetadata_brick_id'] > -1
              ? (await repository.getAssociation<PeakUserMetadata>(
                  Query.where('primaryKey',
                      data['user_metadata_PeakUserMetadata_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PeakToSqlite(Peak instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'coordinates_PeakCoordinates_brick_id': instance.coordinates.primaryKey ??
        await provider.upsert<PeakCoordinates>(instance.coordinates,
            repository: repository),
    'location': instance.location,
    'mountain_range': instance.mountainRange,
    'height': instance.height,
    'difficulty_level':
        DifficultyLevel.values.indexOf(instance.difficultyLevel),
    'average_ascent_time': instance.averageAscentTime,
    'popularity': Popularity.values.indexOf(instance.popularity),
    'user_metadata_PeakUserMetadata_brick_id': instance.userMetadata != null
        ? instance.userMetadata!.primaryKey ??
            await provider.upsert<PeakUserMetadata>(instance.userMetadata!,
                repository: repository)
        : null
  };
}

/// Construct a [Peak]
class PeakAdapter extends OfflineFirstWithSupabaseAdapter<Peak> {
  PeakAdapter();

  @override
  final supabaseTableName = 'peaks';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
    ),
    'coordinates': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'coordinates',
      associationType: PeakCoordinates,
      associationIsNullable: false,
      foreignKey: 'peak_id',
    ),
    'location': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'location',
    ),
    'mountainRange': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'mountain_range',
    ),
    'height': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'height',
    ),
    'difficultyLevel': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'difficulty_level',
    ),
    'averageAscentTime': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'average_ascent_time',
    ),
    'popularity': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'popularity',
    ),
    'descriptions': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'descriptions',
      associationType: PeakDescription,
      associationIsNullable: false,
      foreignKey: 'peak_id',
    ),
    'userMetadata': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'user_metadata',
      associationType: PeakUserMetadata,
      associationIsNullable: true,
      foreignKey: 'peak_id',
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
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    ),
    'coordinates': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'coordinates_PeakCoordinates_brick_id',
      iterable: false,
      type: PeakCoordinates,
    ),
    'location': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'location',
      iterable: false,
      type: String,
    ),
    'mountainRange': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'mountain_range',
      iterable: false,
      type: String,
    ),
    'height': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'height',
      iterable: false,
      type: int,
    ),
    'difficultyLevel': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'difficulty_level',
      iterable: false,
      type: DifficultyLevel,
    ),
    'averageAscentTime': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'average_ascent_time',
      iterable: false,
      type: int,
    ),
    'popularity': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'popularity',
      iterable: false,
      type: Popularity,
    ),
    'descriptions': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'descriptions',
      iterable: true,
      type: PeakDescription,
    ),
    'userMetadata': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'user_metadata_PeakUserMetadata_brick_id',
      iterable: false,
      type: PeakUserMetadata,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      Peak instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Peak` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Peak';
  @override
  Future<void> afterSave(instance, {required provider, repository}) async {
    if (instance.primaryKey != null) {
      final descriptionsOldColumns = await provider.rawQuery(
          'SELECT `f_PeakDescription_brick_id` FROM `_brick_Peak_descriptions` WHERE `l_Peak_brick_id` = ?',
          [instance.primaryKey]);
      final descriptionsOldIds =
          descriptionsOldColumns.map((a) => a['f_PeakDescription_brick_id']);
      final descriptionsNewIds =
          instance.descriptions.map((s) => s.primaryKey).whereType<int>();
      final descriptionsIdsToDelete =
          descriptionsOldIds.where((id) => !descriptionsNewIds.contains(id));

      await Future.wait<void>(descriptionsIdsToDelete.map((id) async {
        return await provider.rawExecute(
            'DELETE FROM `_brick_Peak_descriptions` WHERE `l_Peak_brick_id` = ? AND `f_PeakDescription_brick_id` = ?',
            [instance.primaryKey, id]).catchError((e) => null);
      }));

      await Future.wait<int?>(instance.descriptions.map((s) async {
        final id = s.primaryKey ??
            await provider.upsert<PeakDescription>(s, repository: repository);
        return await provider.rawInsert(
            'INSERT OR IGNORE INTO `_brick_Peak_descriptions` (`l_Peak_brick_id`, `f_PeakDescription_brick_id`) VALUES (?, ?)',
            [instance.primaryKey, id]);
      }));
    }
  }

  @override
  Future<Peak> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Peak input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakToSupabase(input, provider: provider, repository: repository);
  @override
  Future<Peak> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakFromSqlite(input, provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Peak input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PeakToSqlite(input, provider: provider, repository: repository);
}
