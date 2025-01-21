import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/data/repositories/local/local_peaks_repository.dart';

class PeaksRepository {
  PeaksRepository(this._localPeaksRepository);

  final LocalPeaksRepository _localPeaksRepository;

  Future<List<Peak>> select({QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline}) async {
    return _localPeaksRepository.select();
  }
}
