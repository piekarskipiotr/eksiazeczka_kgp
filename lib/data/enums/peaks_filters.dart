import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

enum PeaksFilters {
  all,
  conquered,
  unconquered;

  String getLabel(AppLocalizations l10n) => switch (this) {
        PeaksFilters.all => l10n.all,
        PeaksFilters.conquered => l10n.conquered,
        PeaksFilters.unconquered => l10n.unconquered,
      };

  (String, String, String) getEmptyState(AppLocalizations l10n) => switch (this) {
        PeaksFilters.all => (
            IconImages.error,
            l10n.emptyPeaksListAllTitle,
            l10n.emptyPeaksListAllDescription,
          ),
        PeaksFilters.conquered => (
            IconImages.landscape,
            l10n.emptyPeaksListConqueredTitle,
            l10n.emptyPeaksListConqueredDescription
          ),
        PeaksFilters.unconquered => (
            IconImages.medal2,
            l10n.emptyPeaksListUnconqueredTitle,
            l10n.emptyPeaksListUnconqueredDescription
          ),
      };
}
