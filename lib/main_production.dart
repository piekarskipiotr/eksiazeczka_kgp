import 'package:eksiazeczka_kgp/app.dart';
import 'package:eksiazeczka_kgp/bootstrap.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:eksiazeczka_kgp/services/services.dart';

void main() {
  bootstrap(useSentry: true, () {
    final authStorage = AuthStorage();
    final supabaseAuthRepository = SupabaseAuthRepository(authStorage);
    final authService = AuthService(authStorage, supabaseAuthRepository);
    final supabaseStorageRepository = SupabaseStorageRepository();
    final supabasePeaksRepository = SupabasePeaksRepository();
    final supabasePeaksUserMetadataRepository = SupabasePeaksUserMetadataRepository();
    final userPreferencesService = UserPreferencesService();
    final peaksService = PeaksService(authService, supabasePeaksRepository);
    final router = AppRouter();

    return App(
      router: router,
      userPreferencesService: userPreferencesService,
      authStorage: authStorage,
      authService: authService,
      peaksService: peaksService,
      supabaseAuthRepository: supabaseAuthRepository,
      supabaseStorageRepository: supabaseStorageRepository,
      supabasePeaksRepository: supabasePeaksRepository,
      supabasePeaksUserMetadataRepository: supabasePeaksUserMetadataRepository,
    );
  });
}
