import 'package:eksiazeczka_kp/app.dart';
import 'package:eksiazeczka_kp/bootstrap.dart';
import 'package:eksiazeczka_kp/data/database/database.dart';
import 'package:eksiazeczka_kp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:eksiazeczka_kp/services/services.dart';

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
    final analyticsService = AnalyticsService();
    final dataRefreshService = DataRefreshService();
    final userPreferencesService = UserPreferencesService();

    // Router
    final router = AppRouter(userPreferencesService);

    return App(
      router: router,
      storageRepository: storageRepository,
      peaksRepository: peaksRepository,
      userMetadataRepository: userMetadataRepository,
      analyticsService: analyticsService,
      dataRefreshService: dataRefreshService,
      userPreferencesService: userPreferencesService,
    );
  });
}
