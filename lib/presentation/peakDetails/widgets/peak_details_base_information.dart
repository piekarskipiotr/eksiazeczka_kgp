import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.baseInformation, style: AppTextStyles.h4()),
          Text(l10n.baseInformationSubtitle, style: AppTextStyles.h7()),
          const SizedBox.shrink(),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              AppChip(
                label: location,
                iconPath: IconImages.city,
                size: ChipSize.large,
              ),
              AppChip(
                label: difficultyLevel.getLabel(l10n),
                iconPath: IconImages.hiking,
                size: ChipSize.large,
              ),
              AppChip(
                label: '${averageAscentTime}h',
                iconPath: IconImages.timer,
                size: ChipSize.large,
              ),
              AppChip(
                label: popularity.getLabel(l10n),
                iconPath: IconImages.trending,
                size: ChipSize.large,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
