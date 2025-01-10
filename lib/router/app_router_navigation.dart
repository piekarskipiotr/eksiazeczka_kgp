import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/router/app_routes.dart';

extension AppRouterNavigation on AppRouter {
  void showPeaks() => instance.goNamed(AppRoutes.peaks);

  void showMedals() => instance.goNamed(AppRoutes.medals);

  void showMore() => instance.goNamed(AppRoutes.more);

  void showDarkModeSettings() => instance.pushNamed(AppRoutes.darkModeSettings);

  void showAppLanguageSettings() => instance.pushNamed(AppRoutes.appLanguageSettings);

  void showManageAccount() => instance.pushNamed(AppRoutes.manageAccount);

  void showFaq() => instance.pushNamed(AppRoutes.faq);

  void pop() => instance.pop();
}
