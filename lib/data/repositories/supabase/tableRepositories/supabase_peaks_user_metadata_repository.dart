import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/supabase/supabase_repository.dart';

class SupabasePeaksUserMetadataRepository {
  SupabasePeaksUserMetadataRepository();

  final _instance = SupabaseRepository();

  Future<PeakUserMetadata> insert({required String peakId, required String userId}) async {
    try {
      final userMetaData = PeakUserMetadata(peakId: peakId, userId: userId);
      return await _instance.upsert<PeakUserMetadata>(userMetaData);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
