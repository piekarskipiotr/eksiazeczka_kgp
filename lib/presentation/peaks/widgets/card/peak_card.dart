import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/card/peak_card_information.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/card/peak_conquered_information.dart';
import 'package:flutter/material.dart';

class PeakCard extends StatelessWidget {
  const PeakCard({required this.peak, required this.onPressed, super.key});

  final Peak peak;
  final VoidCallback onPressed;

  double get _radius => 36;

  double get _height => 300;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageOnlineOffline(
          radius: _radius,
          height: _height,
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
                PeakConqueredInformation(date: peak.userMetadata!.conqueredDate)
              else
                const SizedBox(),
              PeakCardInformation(name: peak.name, mountainRange: peak.mountainRange, peakHeight: peak.height),
            ],
          ),
        ),
        FixedInkWell(onPressed: onPressed, radius: _radius),
      ],
    );
  }
}
