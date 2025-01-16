import 'dart:typed_data';

import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/repositories/local/storage/local_storage_repository.dart';

class StorageRepository {
  StorageRepository(this._localStorageRepository);

  final LocalStorageRepository _localStorageRepository;

  Future<void> savePeakImage({
    required Uint8List bytes,
    required String peakId,
    QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline,
  }) async {
    await _localStorageRepository.saveUserPeakImage(bytes, peakId);
  }

  Future<String> getPeakImage({
    required String peakId,
    QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline,
  }) async {
    final path = await _localStorageRepository.getUserPeakImagePath(peakId);
    return path;
    // await _supabaseStorageRepository.uploadPeakPhoto(bytes, peakId, 'userId');
  }
}
