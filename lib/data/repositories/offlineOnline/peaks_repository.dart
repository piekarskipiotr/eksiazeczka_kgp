import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/local/databaseTables/local_peaks_repository.dart';

class PeaksRepository {
  PeaksRepository(this._localPeaksRepository);

  final LocalPeaksRepository _localPeaksRepository;

  Future<List<Peak>> select({QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline}) async {
    final peaks = await _localPeaksRepository.select();
    return peaks;
  }
}
