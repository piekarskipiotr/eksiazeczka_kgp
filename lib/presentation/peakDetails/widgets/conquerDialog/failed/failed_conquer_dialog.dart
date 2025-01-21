import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/failed/failed_conquer_dialog_action_buttons.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/failed/failed_conquer_dialog_content.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _FailedConquerDialog extends StatelessWidget {
  const _FailedConquerDialog({required this.onTryAgainPressed});

  final VoidCallback onTryAgainPressed;

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
            FailedConquerDialogActionButtons(onTryAgainPressed: onTryAgainPressed),
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
  }) {
    context.read<AppRouter>().showTransparentDialog(
          context: context,
          child: BlocProvider.value(
            value: context.read<PeakDetailsBloc>(),
            child: _FailedConquerDialog(
              onTryAgainPressed: onTryAgainPressed,
            ),
          ),
        );
  }
}
