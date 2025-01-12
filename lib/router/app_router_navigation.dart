import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/router/app_routes.dart';

extension AppRouterNavigation on AppRouter {
  void showPeaks() => instance.goNamed(AppRoutes.peaks);

  void showPeakDetails({required Peak peak}) => instance.pushNamed(AppRoutes.peakDetails, extra: peak);

  void showMedals() => instance.goNamed(AppRoutes.medals);

  void showMore() => instance.goNamed(AppRoutes.more);

  void showDarkModeSettings() => instance.pushNamed(AppRoutes.darkModeSettings);

  void showAppLanguageSettings() => instance.pushNamed(AppRoutes.appLanguageSettings);

  void showManageAccount() => instance.pushNamed(AppRoutes.manageAccount);

  void showFaq() => instance.pushNamed(AppRoutes.faq);

  void pop() => instance.pop();
}
