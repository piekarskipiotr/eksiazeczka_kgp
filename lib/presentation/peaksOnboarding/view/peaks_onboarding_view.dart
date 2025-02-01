import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/bloc/peaks_onboarding_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/widgets.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaksOnboardingView extends StatelessWidget {
  const PeaksOnboardingView({super.key});

  void _onProcessingChange({required BuildContext context, required bool isProcessing, required String peakId}) {
    context.read<PeaksOnboardingBloc>().add(UpdateProcessingMap(peakId: peakId, isProcessing: isProcessing));
  }

  void _onGoToAppPressed(BuildContext context) {
    context.read<PeaksOnboardingBloc>().add(const MarkOnboardingAsCompleted());
    context.read<AppRouter>().showPeaks();
  }

  void _onPermissionsPermanentlyDenied(BuildContext context) {
    PermissionRationaleDialog.show(context, rationale: Rationale.photosOnboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<PeaksOnboardingBloc, PeaksOnboardingState>(
          builder: (context, state) {
            final peaks = [...?state.peaks];
            final isProcessing = {...?state.peakProcessingMap}.containsValue(true);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PeaksOnboardingHeader(),
                      PeaksOnboardingList(
                        peaks: peaks,
                        onProcessingChange: ({required String peakId, required bool isProcessing}) {
                          _onProcessingChange(context: context, peakId: peakId, isProcessing: isProcessing);
                        },
                        onPermissionsPermanentlyDenied: () {
                          _onPermissionsPermanentlyDenied(context);
                        },
                      ),
                    ],
                  ),
                  PeaksOnboardingActionButtons(
                    isProcessing: isProcessing,
                    onGoToAppPressed: () {
                      _onGoToAppPressed(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
