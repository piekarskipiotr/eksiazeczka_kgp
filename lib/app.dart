import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/appLanguageSettings/bloc/app_language_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/darkModeSettings/bloc/dark_mode_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/more/bloc/more_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required AppRouter router,
    required UserPreferencesService userPreferencesService,
    required AuthStorage authStorage,
    required AuthService authService,
    required SupabaseAuthRepository supabaseAuthRepository,
    required SupabaseStorageRepository supabaseStorageRepository,
    required SupabasePeaksRepository supabasePeaksRepository,
    required SupabasePeaksUserMetadataRepository supabasePeaksUserMetadataRepository,
    super.key,
  })  : _router = router,
        _userPreferencesService = userPreferencesService,
        _authStorage = authStorage,
        _authService = authService,
        _supabaseAuthRepository = supabaseAuthRepository,
        _supabaseStorageRepository = supabaseStorageRepository,
        _supabasePeaksRepository = supabasePeaksRepository,
        _supabasePeaksUserMetadataRepository = supabasePeaksUserMetadataRepository;

  final AppRouter _router;
  final UserPreferencesService _userPreferencesService;
  final AuthStorage _authStorage;
  final AuthService _authService;
  final SupabaseAuthRepository _supabaseAuthRepository;
  final SupabaseStorageRepository _supabaseStorageRepository;
  final SupabasePeaksRepository _supabasePeaksRepository;
  final SupabasePeaksUserMetadataRepository _supabasePeaksUserMetadataRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _router),
        RepositoryProvider.value(value: _userPreferencesService),
        RepositoryProvider.value(value: _authStorage),
        RepositoryProvider.value(value: _authService),
        RepositoryProvider.value(value: _supabaseAuthRepository),
        RepositoryProvider.value(value: _supabaseStorageRepository),
        RepositoryProvider.value(value: _supabasePeaksRepository),
        RepositoryProvider.value(value: _supabasePeaksUserMetadataRepository),
        BlocProvider(
          create: (_) {
            return PeaksBloc(
              authService: _authService,
              supabasePeaksRepository: _supabasePeaksRepository,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return MoreBloc(
              authService: _authService,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return DarkModeSettingsBloc(
              userPreferencesService: _userPreferencesService,
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return AppLanguageSettingsBloc(
              userPreferencesService: _userPreferencesService,
            );
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeMode = context.watch<DarkModeSettingsBloc>().state.themeMode;
          final locale = context.watch<AppLanguageSettingsBloc>().state.locale;

          return MaterialApp.router(
            themeMode: themeMode,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            debugShowCheckedModeBanner: false,
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
