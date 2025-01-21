import 'package:eksiazeczka_kp/l10n/l10n.dart';

enum PeaksSortTypes {
  alphabetical,
  heightAsc,
  heightDsc,
  conqueredDateAsc,
  conqueredDateDsc;

  static List<PeaksSortTypes> get limitedValues => [...PeaksSortTypes.values]
    ..remove(PeaksSortTypes.conqueredDateAsc)
    ..remove(PeaksSortTypes.conqueredDateDsc);

  String getLabel(AppLocalizations l10n) => switch (this) {
        PeaksSortTypes.alphabetical => l10n.alphabetical,
        PeaksSortTypes.heightAsc => l10n.heightAsc,
        PeaksSortTypes.heightDsc => l10n.heightDsc,
        PeaksSortTypes.conqueredDateAsc => l10n.conqueredDateAsc,
        PeaksSortTypes.conqueredDateDsc => l10n.conqueredDateDsc,
      };
}
