import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';

enum Medals {
  first(1),
  fifth(5),
  tenth(10),
  twenty(20),
  all(28);

  const Medals(this.value);

  final int value;

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

  static List<Medals> getByStep(int step) {
    return Medals.values.where((e) => e.value <= step).toList();
  }
}
