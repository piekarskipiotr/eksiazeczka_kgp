import 'package:eksiazeczka_kgp/app.dart';
import 'package:eksiazeczka_kgp/bootstrap.dart';
import 'package:eksiazeczka_kgp/data/database/database.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:eksiazeczka_kgp/services/services.dart';

void main() {
  bootstrap(() async {
    // Database
    final appDatabase = await AppDatabase().database;

    // Local repositories
    final localPeaksRepository = LocalPeaksRepository(appDatabase);
    final localUserMetadataRepository = LocalUserMetadataRepository(appDatabase);
    final localStorageRepository = LocalStorageRepository();

    // Cross repositories
    final storageRepository = StorageRepository(localStorageRepository);
    final peaksRepository = PeaksRepository(localPeaksRepository);
    final userMetadataRepository = UserMetadataRepository(localUserMetadataRepository);

    // Services
    final dataRefreshService = DataRefreshService();
    final userPreferencesService = UserPreferencesService();

    // Router
    final router = AppRouter();

    return App(
      router: router,
      storageRepository: storageRepository,
      peaksRepository: peaksRepository,
      userMetadataRepository: userMetadataRepository,
      dataRefreshService: dataRefreshService,
      userPreferencesService: userPreferencesService,
    );
  });
}
