import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/services/auth_service/auth_service.dart';
import 'package:eksiazeczka_kgp/services/auth_service/auth_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required AppRouter router,
    required AuthStorage authStorage,
    required AuthService authService,
    required SupabaseAuthRepository supabaseAuthRepository,
    required SupabaseStorageRepository supabaseStorageRepository,
    required SupabasePeaksRepository supabasePeaksRepository,
    required SupabasePeaksUserMetadataRepository supabasePeaksUserMetadataRepository,
    super.key,
  })  : _router = router,
        _authStorage = authStorage,
        _authService = authService,
        _supabaseAuthRepository = supabaseAuthRepository,
        _supabaseStorageRepository = supabaseStorageRepository,
        _supabasePeaksRepository = supabasePeaksRepository,
        _supabasePeaksUserMetadataRepository = supabasePeaksUserMetadataRepository;

  final AppRouter _router;
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
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationProvider: _router.instance.routeInformationProvider,
        routeInformationParser: _router.instance.routeInformationParser,
        routerDelegate: _router.instance.routerDelegate,
      ),
    );
  }
}
