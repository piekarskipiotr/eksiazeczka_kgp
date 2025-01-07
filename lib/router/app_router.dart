import 'package:eksiazeczka_kgp/presentation/medals/view/medals_page.dart';
import 'package:eksiazeczka_kgp/presentation/more/view/more_page.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/view/peaks_page.dart';
import 'package:eksiazeczka_kgp/presentation/root/view/root_page.dart';
import 'package:eksiazeczka_kgp/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _peaksNavigatorKey = GlobalKey<NavigatorState>();
  final _medalsNavigatorKey = GlobalKey<NavigatorState>();
  final _moreNavigatorKey = GlobalKey<NavigatorState>();

  late final instance = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/${AppRoutes.peaks}',
    routes: [
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
    ],
  );
}
