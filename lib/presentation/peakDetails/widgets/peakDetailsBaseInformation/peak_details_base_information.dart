import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peakDetailsBaseInformation/peak_details_base_information_chip.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peak_details_information_section.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter/material.dart';

class PeakDetailsBaseInformation extends StatelessWidget {
  const PeakDetailsBaseInformation({
    required this.location,
    required this.difficultyLevel,
    required this.averageAscentTime,
    required this.popularity,
    super.key,
  });

  final String location;
  final DifficultyLevel difficultyLevel;
  final int averageAscentTime;
  final Popularity popularity;

  double get _spacing => 16;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PeakDetailsInformationSection(
      label: l10n.baseInformation,
      description: l10n.baseInformationSubtitle,
      extraContent: [
        // SizedBox for extra spacing
        const SizedBox.shrink(),
        Wrap(
          spacing: _spacing,
          runSpacing: _spacing,
          children: [
            PeakDetailsBaseInformationChip(label: location, iconPath: IconImages.city),
            PeakDetailsBaseInformationChip(label: difficultyLevel.getLabel(l10n), iconPath: IconImages.hiking),
            PeakDetailsBaseInformationChip(label: '${averageAscentTime}h', iconPath: IconImages.timer),
            PeakDetailsBaseInformationChip(label: popularity.getLabel(l10n), iconPath: IconImages.trending),
          ],
        ),
      ],
    );
  }
}
