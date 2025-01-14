import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

enum Medals {
  first,
  fifth,
  tenth,
  twenty,
  all;

  String getLabel(AppLocalizations l10n) => switch (this) {
        Medals.first => l10n.medalLabel('1'),
        Medals.fifth => l10n.medalLabel('5'),
        Medals.tenth => l10n.medalLabel('10'),
        Medals.twenty => l10n.medalLabel('20'),
        Medals.all => l10n.medalLabel('28'),
      };

  String get background => switch (this) {
    Medals.first => MedalBackgrounds.first,
    Medals.fifth => MedalBackgrounds.fifth,
    Medals.tenth => MedalBackgrounds.tenth,
    Medals.twenty => MedalBackgrounds.twenty,
    Medals.all => MedalBackgrounds.all,
  };
}
