import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/more/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsPageLayout(
      label: l10n.faq,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          spacing: 20,
          children: [
            MoreSection(
              label: l10n.general,
              children: [
                MoreSectionItemExpandableText(
                  label: l10n.generalQuestion1,
                  text: l10n.generalQuestion1Answer,
                ),
                MoreSectionItemExpandableText(
                  label: l10n.generalQuestion2,
                  text: l10n.generalQuestion2Answer,
                ),
                MoreSectionItemExpandableText(
                  label: l10n.generalQuestion3,
                  text: l10n.generalQuestion3Answer,
                ),
              ],
            ),
            MoreSection(
              label: l10n.howAppWorks,
              children: [
                MoreSectionItemExpandableText(
                  label: l10n.appFunctionalityQuestion1,
                  text: l10n.appFunctionalityQuestion1Answer,
                ),
                MoreSectionItemExpandableText(
                  label: l10n.appFunctionalityQuestion2,
                  text: l10n.appFunctionalityQuestion2Answer,
                ),
                MoreSectionItemExpandableText(
                  label: l10n.appFunctionalityQuestion3,
                  text: l10n.appFunctionalityQuestion3Answer,
                ),
                MoreSectionItemExpandableText(
                  label: l10n.appFunctionalityQuestion4,
                  text: l10n.appFunctionalityQuestion4Answer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
