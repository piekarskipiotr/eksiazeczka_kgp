import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/presentation/appLanguageSettings/view/app_language_settings_page.dart';
import 'package:eksiazeczka_kp/presentation/attributions/view/attributions_page.dart';
import 'package:eksiazeczka_kp/presentation/darkModeSettings/view/dark_mode_settings_page.dart';
import 'package:eksiazeczka_kp/presentation/faq/view/faq_page.dart';
import 'package:eksiazeczka_kp/presentation/licenses/view/licenses_page.dart';
import 'package:eksiazeczka_kp/presentation/medals/view/medals_page.dart';
import 'package:eksiazeczka_kp/presentation/menageAccountSettings/view/menage_account_settings_page.dart';
import 'package:eksiazeczka_kp/presentation/more/view/more_page.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/view/peak_details_page.dart';
import 'package:eksiazeczka_kp/presentation/peaks/view/peaks_page.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/view/peaks_onboarding_page.dart';
import 'package:eksiazeczka_kp/presentation/root/view/root_page.dart';
import 'package:eksiazeczka_kp/router/app_routes.dart';
import 'package:eksiazeczka_kp/services/services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  AppRouter(this._userPreferencesService);

  final UserPreferencesService _userPreferencesService;
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _peaksNavigatorKey = GlobalKey<NavigatorState>();
  final _medalsNavigatorKey = GlobalKey<NavigatorState>();
  final _moreNavigatorKey = GlobalKey<NavigatorState>();

  late final instance = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          final isPeaksOnboardingCompleted = await _userPreferencesService.isPeaksOnboardingCompleted();
          return isPeaksOnboardingCompleted ? '/${AppRoutes.peaks}' : '/${AppRoutes.peaksOnboarding}';
        },
      ),
      GoRoute(
        name: AppRoutes.peaksOnboarding,
        path: '/${AppRoutes.peaksOnboarding}',
        builder: (context, state) {
          return const PeaksOnboardingPage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootPage(key: state.pageKey, navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _peaksNavigatorKey,
            routes: [
              GoRoute(
                name: AppRoutes.peaks,
                path: '/${AppRoutes.peaks}',
                builder: (context, state) {
                  return const PeaksPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _medalsNavigatorKey,
            routes: [
              GoRoute(
                name: AppRoutes.medals,
                path: '/${AppRoutes.medals}',
                builder: (context, state) {
                  return const MedalsPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _moreNavigatorKey,
            routes: [
              GoRoute(
                name: AppRoutes.more,
                path: '/${AppRoutes.more}',
                builder: (context, state) {
                  return const MorePage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.peakDetails,
        path: '/${AppRoutes.peakDetails}',
        builder: (context, state) {
          final peak = state.extra! as Peak;
          return PeakDetailsPage(peak: peak);
        },
      ),
      GoRoute(
        name: AppRoutes.darkModeSettings,
        path: '/${AppRoutes.darkModeSettings}',
        builder: (context, state) {
          return const DarkModeSettingsPage();
        },
      ),
      GoRoute(
        name: AppRoutes.appLanguageSettings,
        path: '/${AppRoutes.appLanguageSettings}',
        builder: (context, state) {
          return const AppLanguageSettingsPage();
        },
      ),
      GoRoute(
        name: AppRoutes.faq,
        path: '/${AppRoutes.faq}',
        builder: (context, state) {
          return const FaqPage();
        },
      ),
      GoRoute(
        name: AppRoutes.licenses,
        path: '/${AppRoutes.licenses}',
        builder: (context, state) {
          return const LicensesPage();
        },
      ),
      GoRoute(
        name: AppRoutes.attributions,
        path: '/${AppRoutes.attributions}',
        builder: (context, state) {
          return const AttributionsPage();
        },
      ),
      GoRoute(
        name: AppRoutes.manageAccount,
        path: '/${AppRoutes.manageAccount}',
        builder: (context, state) {
          final user = state.extra! as User;
          return MenageAccountSettingsPage(user: user);
        },
      ),
    ],
  );
}
