import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FailedConquerDialogActionButtons extends StatelessWidget {
  const FailedConquerDialogActionButtons({
    required this.onTryAgainPressed,
    required this.onBuyConquerPressed,
    super.key,
  });

  final VoidCallback onTryAgainPressed;
  final VoidCallback onBuyConquerPressed;

  void _onExitPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<PeakDetailsBloc, PeakDetailsState>(
      builder: (context, state) {
        final status = state.status;
        final processingStatus = [
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
                  isProcessing: processingStatus.contains(status),
                ),
                AppOutlinedButton(
                  label: l10n.buyPeak,
                  onPressed: onBuyConquerPressed,
                  isLoading: status == PeakDetailsStateStatus.buyingPeak,
                  isProcessing: processingStatus.contains(status),
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
    );
  }
}
