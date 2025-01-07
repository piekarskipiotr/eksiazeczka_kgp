import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/router/app_routes.dart';

extension AppRouterNavigation on AppRouter {
  void showPeaks() => instance.goNamed('/${AppRoutes.peaks}');

  void showMedals() => instance.goNamed('/${AppRoutes.medals}');

  void showMore() => instance.goNamed('/${AppRoutes.more}');

  void pop() => instance.pop();
}
