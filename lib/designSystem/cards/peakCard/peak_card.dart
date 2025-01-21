import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/designSystem/cards/peakCard/peak_card_information.dart';
import 'package:eksiazeczka_kp/designSystem/cards/peakCard/peak_conquered_information.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class PeakCard extends StatelessWidget {
  const PeakCard({
    required this.peak,
    this.onPressed,
    this.height = 300,
    this.radius = 36,
    super.key,
  });

  final Peak peak;
  final VoidCallback? onPressed;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NetworkAssetImage(
          radius: radius,
          height: height,
          url: peak.image,
          assetPath: peak.assetImage,
          disable: !peak.isConquered,
        ),
        Positioned.fill(
          child: Hero(
            tag: peak.id,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (peak.isConquered)
                  PeakConqueredInformation(date: peak.userMetadata!.conqueredDate)
                else
                  const SizedBox(),
                PeakCardInformation(name: peak.name, mountainRange: peak.mountainRange, peakHeight: peak.height),
              ],
            ),
          ),
        ),
        if (onPressed != null) FixedInkWell(onPressed: onPressed!, radius: radius),
      ],
    );
  }
}
