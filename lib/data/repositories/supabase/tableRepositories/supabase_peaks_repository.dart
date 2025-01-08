import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/supabase/supabase_repository.dart';

class SupabasePeaksRepository {
  SupabasePeaksRepository();

  final _instance = SupabaseRepository();

  Future<Stream<List<Peak>>> subscribe({required String userId}) async {
    try {
      // TODO(Piotr): handle query for userID
      return _instance.subscribeToRealtime<Peak>();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
