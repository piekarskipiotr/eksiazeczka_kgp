import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';

class PeakCardInformation extends StatelessWidget {
  const PeakCardInformation({
    required this.name,
    required this.mountainRange,
    required this.peakHeight,
    super.key,
  });

  final String name;
  final String mountainRange;
  final int peakHeight;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlurContainer(
      radius: 28,
      outerPadding: const EdgeInsets.all(12),
      innerPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.h4(color: AppColors.white)),
              Row(
                spacing: 2,
                children: [
                  const AppIcon(IconImages.location, color: AppColors.white, size: 14),
                  Text(mountainRange, style: AppTextStyles.h8(color: AppColors.white)),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                peakHeight.toString(),
                style: AppTextStyles.h6(fontWeight: FontWeight.w600, color: AppColors.white),
              ),
              Text(l10n.masl, style: AppTextStyles.h8(color: AppColors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
