import 'package:eksiazeczka_kp/data/database/app_database_tables_scripts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase();

  static const _databaseName = 'ekp_database.db';
  static const _databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await AppDatabaseTablesScripts.createPeaksTable(db);
    await AppDatabaseTablesScripts.createUserMetadataTable(db);
    await AppDatabaseTablesScripts.insertPeaksData(db);
  }
}
