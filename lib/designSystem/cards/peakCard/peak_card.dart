import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/cards/image_card.dart';
import 'package:eksiazeczka_kgp/designSystem/layouts/layouts.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/card/peak_card_information.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/card/peak_conquered_information.dart';
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
        ImageCard(
          radius: radius,
          height: height,
          url: peak.image,
          assetPath: peak.assetImage,
          disable: !peak.isConquered,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (peak.isConquered)
                SafeArea(child: PeakConqueredInformation(date: peak.userMetadata!.conqueredDate))
              else
                const SizedBox(),
              PeakCardInformation(name: peak.name, mountainRange: peak.mountainRange, peakHeight: peak.height),
            ],
          ),
        ),
        if (onPressed != null) FixedInkWell(onPressed: onPressed!, radius: radius),
      ],
    );
  }
}
