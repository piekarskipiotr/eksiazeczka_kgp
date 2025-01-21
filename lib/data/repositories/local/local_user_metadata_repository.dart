import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:sqflite/sqflite.dart';

class LocalUserMetadataRepository {
  const LocalUserMetadataRepository(this._database);

  final Database _database;
  static const _tableName = 'user_metadata';

  Future<PeakUserMetadata> insert({required String peakId}) async {
    try {
      final metadata = PeakUserMetadata(peakId: peakId);
      await _database.insert(_tableName, metadata.toSqflite());
      return metadata;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
