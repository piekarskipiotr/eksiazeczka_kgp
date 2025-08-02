import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/router/app_router.dart';
import 'package:eksiazeczka_kp/router/app_routes.dart';
import 'package:eksiazeczka_kp/router/transparent_fade_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

extension AppRouterNavigation on AppRouter {
  void showPeaks() => instance.goNamed(AppRoutes.peaks);

  void showPeakDetails({required Peak peak}) => instance.pushNamed(AppRoutes.peakDetails, extra: peak);

  void showMedals() => instance.goNamed(AppRoutes.medals);

  void showMore() => instance.goNamed(AppRoutes.more);

  void showDarkModeSettings() => instance.pushNamed(AppRoutes.darkModeSettings);

  void showAppLanguageSettings() => instance.pushNamed(AppRoutes.appLanguageSettings);

  void showFaq() => instance.pushNamed(AppRoutes.faq);

  void showLicenses() => instance.pushNamed(AppRoutes.licenses);

  void showAttributions() => instance.pushNamed(AppRoutes.attributions);

  void showTransparentDialog({required BuildContext context, required Widget child}) =>
      Navigator.of(context, rootNavigator: true).push(
        TransparentFadeRoute(
          builder: (_) => CupertinoScaffold(
            transitionBackgroundColor: AppColors.transparent,
            body: child,
          ),
        ),
      );

  void pop() => instance.pop();
}
