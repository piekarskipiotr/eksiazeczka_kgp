import 'package:eksiazeczka_kp/l10n/l10n.dart';

enum Popularity {
  low,
  medium,
  high;

  String getLabel(AppLocalizations l10n) => switch (this) {
        Popularity.low => l10n.low,
        Popularity.medium => l10n.medium,
        Popularity.high => l10n.high,
      };
}
