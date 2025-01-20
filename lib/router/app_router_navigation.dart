import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/router/app_router.dart';
import 'package:eksiazeczka_kgp/router/app_routes.dart';
import 'package:eksiazeczka_kgp/router/transparent_fade_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension AppRouterNavigation on AppRouter {
  void showPeaks() => instance.goNamed(AppRoutes.peaks);

  void showPeakDetails({required Peak peak}) => instance.pushNamed(AppRoutes.peakDetails, extra: peak);

  void showMedals() => instance.goNamed(AppRoutes.medals);

  void showMore() => instance.goNamed(AppRoutes.more);

  void showDarkModeSettings() => instance.pushNamed(AppRoutes.darkModeSettings);

  void showAppLanguageSettings() => instance.pushNamed(AppRoutes.appLanguageSettings);

  void showManageAccount({required User user}) => instance.pushNamed(AppRoutes.manageAccount, extra: user);

  void showFaq() => instance.pushNamed(AppRoutes.faq);

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
