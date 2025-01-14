import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peakDetailsBaseInformation/peak_details_base_information.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_description.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_memorable_photo.dart';
import 'package:flutter/material.dart';

class PeakDetailsInformation extends StatelessWidget {
  const PeakDetailsInformation({required this.peak, super.key});

  final Peak peak;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 156),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeakDetailsBaseInformation(
              location: peak.location,
              difficultyLevel: peak.difficultyLevel,
              averageAscentTime: peak.averageAscentTime,
              popularity: peak.popularity,
            ),
            PeakDetailsDescription(
              description: peak.descriptions.first.text,
            ),
            if (peak.isConquered)
              const PeakDetailsMemorablePhoto(
                peakId: '',
                userId: '',
                userToken: '',
              ),
          ],
        ),
      ),
    );
  }
}
