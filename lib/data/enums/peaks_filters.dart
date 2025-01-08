import 'package:eksiazeczka_kgp/l10n/l10n.dart';

enum PeaksFilters {
  all,
  conquered,
  unconquered;

  String getLabel(AppLocalizations l10n) => switch(this) {
    PeaksFilters.all => l10n.all,
    PeaksFilters.conquered => l10n.conquered,
    PeaksFilters.unconquered => l10n.unconquered,
  };
}
