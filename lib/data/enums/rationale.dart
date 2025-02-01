import 'package:eksiazeczka_kp/l10n/l10n.dart';

enum Rationale {
  location,
  camera,
  photos,
  photosOnboarding;

  (String, String) getText(AppLocalizations l10n) => switch (this) {
        Rationale.location => (
            l10n.locationRationaleTitle,
            l10n.locationRationaleDescription,
          ),
        Rationale.camera => (
            l10n.cameraRationaleTitle,
            l10n.cameraRationaleDescription,
          ),
        Rationale.photos => (
            l10n.photosRationaleTitle,
            l10n.photosRationaleDescription,
          ),
        Rationale.photosOnboarding => (
            l10n.photosOnboardingRationaleTitle,
            l10n.photosOnboardingRationaleDescription,
          ),
      };
}
