import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/data/repositories/local/local_repositories.dart';

class UserMetadataRepository {
  UserMetadataRepository(this._localUserMetadataRepository);

  final LocalUserMetadataRepository _localUserMetadataRepository;

  Future<PeakUserMetadata> insert({
    required String peakId,
    DateTime? conqueredDate,
    QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline,
  }) async {
    return _localUserMetadataRepository.insert(peakId: peakId, conqueredDate: conqueredDate);
  }
}
