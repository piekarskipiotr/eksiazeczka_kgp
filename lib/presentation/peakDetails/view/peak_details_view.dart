import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PeakDetailsView extends StatelessWidget {
  const PeakDetailsView({super.key});

  void _onMarkConquerPeakPressed(BuildContext context) {}

  void _onBackPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PeakDetailsBloc, PeakDetailsState>(
      builder: (context, state) {
        final peak = state.peak;
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      PeakCard(peak: peak, height: 420),
                      SafeArea(
                        child: Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: AppCircleIconBlurButton(
                            iconPath: IconImages.close,
                            onPressed: () {
                              _onBackPressed(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: AppButton(
                    label: l10n.markConquerPeak,
                    onPressed: () {
                      _onMarkConquerPeakPressed(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
