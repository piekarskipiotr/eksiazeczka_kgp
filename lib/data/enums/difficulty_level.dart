import 'package:eksiazeczka_kp/l10n/l10n.dart';

enum DifficultyLevel {
  easy,
  normal,
  hard;

  String getLabel(AppLocalizations l10n) => switch(this) {
    DifficultyLevel.easy => l10n.easy,
    DifficultyLevel.normal => l10n.normal,
    DifficultyLevel.hard => l10n.hard,
  };
}
