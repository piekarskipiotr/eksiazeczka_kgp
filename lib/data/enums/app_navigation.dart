import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

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
        AppNavigation.peaks => IconsImages.landscape,
        AppNavigation.medals => IconsImages.medals,
        AppNavigation.more => IconsImages.menu,
      };

  String get activeIcon => switch (this) {
        AppNavigation.peaks => IconsImages.landscapeFilled,
        AppNavigation.medals => IconsImages.medalsFilled,
        AppNavigation.more => IconsImages.menuFilled,
      };
}
