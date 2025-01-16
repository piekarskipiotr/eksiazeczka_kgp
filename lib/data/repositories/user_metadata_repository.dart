import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/local/local_repositories.dart';

class UserMetadataRepository {
  UserMetadataRepository(this._localUserMetadataRepository);

  final LocalUserMetadataRepository _localUserMetadataRepository;

  Future<PeakUserMetadata> insert({
    required String peakId,
    QueryOnlineOfflinePolicy policy = QueryOnlineOfflinePolicy.offline,
  }) async {
    return _localUserMetadataRepository.insert(peakId: peakId);
  }
}
