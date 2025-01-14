import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/conquerDialog/failed/failed_conquer_dialog_action_buttons.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/conquerDialog/failed/failed_conquer_dialog_content.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _FailedConquerDialog extends StatelessWidget {
  const _FailedConquerDialog({
    required this.onTryAgainPressed,
    required this.onBuyConquerPressed,
  });

  final VoidCallback onTryAgainPressed;
  final VoidCallback onBuyConquerPressed;

  @override
  Widget build(BuildContext context) {
    return ConquerBaseDialog(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.black,
              AppColors.black.withValues(alpha: 0.85),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const ConquerBaseDialogExitButton(),
            const FailedConquerDialogContent(),
            FailedConquerDialogActionButtons(
              onTryAgainPressed: onTryAgainPressed,
              onBuyConquerPressed: onBuyConquerPressed,
            ),
          ],
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
    context.read<AppRouter>().showTransparentDialog(
      context: context,
      child: BlocProvider.value(
        value: context.read<PeakDetailsBloc>(),
        child: _FailedConquerDialog(
          onTryAgainPressed: onTryAgainPressed,
          onBuyConquerPressed: onBuyConquerPressed,
        ),
      ),
    );
  }
}
