import 'package:eksiazeczka_kgp/app.dart';
import 'package:eksiazeczka_kgp/bootstrap.dart';
import 'package:eksiazeczka_kgp/data/database/database.dart';
import 'package:eksiazeczka_kgp/data/repositories/local/local_repositories.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:eksiazeczka_kgp/services/dataRefreshService/data_refresh_service.dart';
import 'package:eksiazeczka_kgp/services/services.dart';

void main() {
  bootstrap(() async {
    final appDatabase = await AppDatabase().database;
    final localPeaksRepository = LocalPeaksRepository(appDatabase);
    final localUserMetadataRepository = LocalUserMetadataRepository(appDatabase);
    final peaksRepository = PeaksRepository(localPeaksRepository);
    final userMetadataRepository = UserMetadataRepository(localUserMetadataRepository);
    final authStorage = AuthStorage();
    final supabaseAuthRepository = SupabaseAuthRepository(authStorage);
    final authService = AuthService(authStorage, supabaseAuthRepository);
    final dataRefreshService = DataRefreshService();
    final supabaseStorageRepository = SupabaseStorageRepository();
    final userPreferencesService = UserPreferencesService();
    final router = AppRouter();

    return App(
      router: router,
      userPreferencesService: userPreferencesService,
      authStorage: authStorage,
      authService: authService,
      dataRefreshService: dataRefreshService,
      supabaseAuthRepository: supabaseAuthRepository,
      supabaseStorageRepository: supabaseStorageRepository,
      peaksRepository: peaksRepository,
      userMetadataRepository: userMetadataRepository,
    );
  });
}
