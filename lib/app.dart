import 'package:eksiazeczka_kp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/appLanguageSettings/bloc/app_language_settings_bloc.dart';
import 'package:eksiazeczka_kp/presentation/darkModeSettings/bloc/dark_mode_settings_bloc.dart';
import 'package:eksiazeczka_kp/presentation/medals/bloc/medals_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kp/presentation/root/bloc/root_bloc.dart';
import 'package:eksiazeczka_kp/router/app_router.dart';
import 'package:eksiazeczka_kp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required AppRouter router,
    required StorageRepository storageRepository,
    required PeaksRepository peaksRepository,
    required UserMetadataRepository userMetadataRepository,
    required DataRefreshService dataRefreshService,
    required UserPreferencesService userPreferencesService,
    super.key,
  })  : _router = router,
        _storageRepository = storageRepository,
        _peaksRepository = peaksRepository,
        _userMetadataRepository = userMetadataRepository,
        _dataRefreshService = dataRefreshService,
        _userPreferencesService = userPreferencesService;

  final AppRouter _router;
  final StorageRepository _storageRepository;
  final PeaksRepository _peaksRepository;
  final UserMetadataRepository _userMetadataRepository;
  final DataRefreshService _dataRefreshService;
  final UserPreferencesService _userPreferencesService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _router),
        RepositoryProvider.value(value: _storageRepository),
        RepositoryProvider.value(value: _peaksRepository),
        RepositoryProvider.value(value: _userMetadataRepository),
        RepositoryProvider.value(value: _dataRefreshService),
        RepositoryProvider.value(value: _userPreferencesService),
        BlocProvider(
          create: (_) {
            return RootBloc(
              dataRefreshService: _dataRefreshService,
              peaksRepository: _peaksRepository,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return PeaksBloc(
              dataRefreshService: _dataRefreshService,
              peaksRepository: _peaksRepository,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return MedalsBloc(
              dataRefreshService: _dataRefreshService,
              peaksRepository: _peaksRepository,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return DarkModeSettingsBloc(userPreferencesService: _userPreferencesService);
          },
        ),
        BlocProvider(
          create: (_) {
            return AppLanguageSettingsBloc(userPreferencesService: _userPreferencesService);
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeMode = context.watch<DarkModeSettingsBloc>().state.themeMode;
          final locale = context.watch<AppLanguageSettingsBloc>().state.locale;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            locale: Locale(locale),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationProvider: _router.instance.routeInformationProvider,
            routeInformationParser: _router.instance.routeInformationParser,
            routerDelegate: _router.instance.routerDelegate,
          );
        },
      ),
    );
  }
}
