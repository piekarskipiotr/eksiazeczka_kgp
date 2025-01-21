import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peakDetailsMemorablePhotoDialog/memorable_photo_base_dialog.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peakDetailsMemorablePhotoDialog/memorable_photo_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peakDetailsMemorablePhotoDialog/memorable_photo_dialog_action_buttons.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/peakDetailsMemorablePhotoDialog/memorable_photo_dialog_content.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _MemorablePhotoDialog extends StatelessWidget {
  const _MemorablePhotoDialog(this.peakId);

  final String peakId;

  @override
  Widget build(BuildContext context) {
    return MemorablePhotoBaseDialog(
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
            const MemorablePhotoBaseDialogExitButton(),
            MemorablePhotoDialogContent(peakId: peakId),
            const MemorablePhotoDialogActionButtons(),
          ],
        ),
      ),
    );
  }
}

class PeakDetailsMemorablePhotoDialog {
  static void show(BuildContext context, {required String peakId}) {
    context.read<AppRouter>().showTransparentDialog(
          context: context,
          child: _MemorablePhotoDialog(peakId),
        );
  }
}
