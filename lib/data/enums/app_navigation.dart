import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';

enum AppNavigation {
  peaks,
  medals,
  more;

  String getLabel(AppLocalizations l10n) => switch (this) {
        AppNavigation.peaks => l10n.peaks,
        AppNavigation.medals => l10n.medals,
        AppNavigation.more => l10n.more,
      };

  String get icon => switch (this) {
        AppNavigation.peaks => IconImages.landscape,
        AppNavigation.medals => IconImages.medals,
        AppNavigation.more => IconImages.menu,
      };

  String get activeIcon => switch (this) {
        AppNavigation.peaks => IconImages.landscapeFilled,
        AppNavigation.medals => IconImages.medalsFilled,
        AppNavigation.more => IconImages.menuFilled,
      };
}
