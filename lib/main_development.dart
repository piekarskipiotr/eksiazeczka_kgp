import 'package:eksiazeczka_kgp/app.dart';
import 'package:eksiazeczka_kgp/bootstrap.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:eksiazeczka_kgp/services/auth_service/auth_service.dart';
import 'package:eksiazeczka_kgp/services/auth_service/auth_storage.dart';

void main() {
  bootstrap(() {
    final authStorage = AuthStorage();
    final supabaseAuthRepository = SupabaseAuthRepository(authStorage);
    final authService = AuthService(authStorage, supabaseAuthRepository);
    final supabaseStorageRepository = SupabaseStorageRepository();
    final supabasePeaksRepository = SupabasePeaksRepository();
    final supabasePeaksUserMetadataRepository = SupabasePeaksUserMetadataRepository();
    final router = AppRouter();

    return App(
      router: router,
      authStorage: authStorage,
      authService: authService,
      supabaseAuthRepository: supabaseAuthRepository,
      supabaseStorageRepository: supabaseStorageRepository,
      supabasePeaksRepository: supabasePeaksRepository,
      supabasePeaksUserMetadataRepository: supabasePeaksUserMetadataRepository,
    );
  });
}
