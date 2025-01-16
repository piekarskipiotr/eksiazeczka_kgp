import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:sqflite/sqflite.dart';

class LocalPeaksRepository {
  const LocalPeaksRepository(this._database);

  final Database _database;
  static const _tableName = 'peaks';

  Future<List<Peak>> select() async {
    try {
      final peaks = await _database.query(_tableName);
      return List<Peak>.from(peaks.map(Peak.fromSqflite));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
