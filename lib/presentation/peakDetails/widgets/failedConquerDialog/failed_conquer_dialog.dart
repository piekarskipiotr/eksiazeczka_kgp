import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:eksiazeczka_kgp/router/transparent_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class _FailedConquerDialog extends StatelessWidget {
  const _FailedConquerDialog({
    required this.onTryAgainPressed,
    required this.onBuyConquerPressed,
  });

  final VoidCallback onTryAgainPressed;
  final VoidCallback onBuyConquerPressed;

  void _onExitPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Theme(
      data: AppThemes.dark,
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black,
                AppColors.black.withValues(alpha: 0.85),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(12),
                  child: AppCircleIconBlurButton(
                    iconPath: IconImages.close,
                    onPressed: () {
                      _onExitPressed(context);
                    },
                  ),
                ),
              ),
              Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppIcon(IconImages.locationError, size: 48),
                  const SizedBox(height: 4),
                  Text(
                    l10n.notInPeakRange,
                    style: AppTextStyles.h6(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    l10n.notInPeakRangeDescription,
                    style: AppTextStyles.h8(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 64),
                ],
              ),
              BlocBuilder<PeakDetailsBloc, PeakDetailsState>(
                builder: (context, state) {
                  final status = state.status;
                  final processingStauts = [
                    PeakDetailsStateStatus.validatingLocation,
                    PeakDetailsStateStatus.buyingPeak,
                  ];
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButton(
                            label: l10n.tryAgain,
                            onPressed: onTryAgainPressed,
                            isLoading: status == PeakDetailsStateStatus.validatingLocation,
                            isProcessing: processingStauts.contains(status),
                          ),
                          AppOutlinedButton(
                            label: l10n.buyPeak,
                            onPressed: onBuyConquerPressed,
                            isLoading: status == PeakDetailsStateStatus.buyingPeak,
                            isProcessing: processingStauts.contains(status),
                          ),
                          AppTextButton(
                            label: l10n.close,
                            onPressed: () {
                              _onExitPressed(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FailedConquerDialog {
  static void show(
    BuildContext context, {
    required VoidCallback onTryAgainPressed,
    required VoidCallback onBuyConquerPressed,
  }) {
    Navigator.push(
      context,
      TransparentRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<PeakDetailsBloc>(),
          child: _FailedConquerDialog(
            onTryAgainPressed: onTryAgainPressed,
            onBuyConquerPressed: onBuyConquerPressed,
          ),
        ),
      ),
    );
  }
}
