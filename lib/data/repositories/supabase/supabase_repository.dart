import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
import 'package:brick_supabase/brick_supabase.dart' hide Supabase;
import 'package:eksiazeczka_kgp/brick/brick.g.dart';
import 'package:eksiazeczka_kgp/brick/db/schema.g.dart';
import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepository extends OfflineFirstWithSupabaseRepository {
  factory SupabaseRepository() => _instance!;

  SupabaseRepository._({
    required super.supabaseProvider,
    required super.sqliteProvider,
    required super.migrations,
    required super.offlineRequestQueue,
    super.memoryCacheProvider,
    super.autoHydrate,
  });

  static late SupabaseRepository? _instance;

  static String get _databaseName => '${flavor}_eksiazeczka_kgp_database.sqlite';

  static Future<void> configure(DatabaseFactory databaseFactory) async {
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(databaseFactory: databaseFactory);
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey, httpClient: client);

    _instance = SupabaseRepository._(
      supabaseProvider: SupabaseProvider(
        Supabase.instance.client,
        modelDictionary: supabaseModelDictionary,
      ),
      sqliteProvider: SqliteProvider(
        _databaseName,
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      offlineRequestQueue: queue,
      migrations: migrations,
      memoryCacheProvider: MemoryCacheProvider(),
      autoHydrate: true,
    );
  }
}
