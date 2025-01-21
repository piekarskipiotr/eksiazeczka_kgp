import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/conquer_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/succeeded/succeeded_conquer_dialog_action_buttons.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/succeeded/succeeded_conquer_dialog_background.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/widgets/conquerDialog/succeeded/succeeded_conquer_dialog_content.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _SucceededConquerDialog extends StatelessWidget {
  const _SucceededConquerDialog({
    required this.peak,
    required this.onTakePhotoPressed,
    required this.onAddFromGalleryPressed,
  });

  final Peak peak;
  final VoidCallback onTakePhotoPressed;
  final VoidCallback onAddFromGalleryPressed;

  @override
  Widget build(BuildContext context) {
    return ConquerBaseDialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SucceededConquerDialogBackground(assetPath: peak.assetImage, url: peak.image),
          const ConquerBaseDialogExitButton(),
          SucceededConquerDialogContent(peakName: peak.name),
          SucceededConquerDialogActionButtons(
            onTakePhotoPressed: onTakePhotoPressed,
            onAddFromGalleryPressed: onAddFromGalleryPressed,
          ),
        ],
      ),
    );
  }
}

class SucceededConquerDialog {
  static void show(
    BuildContext context, {
    required Peak peak,
    required VoidCallback onTakePhotoPressed,
    required VoidCallback onAddFromGalleryPressed,
  }) {
    context.read<AppRouter>().showTransparentDialog(
          context: context,
          child: BlocProvider.value(
            value: context.read<PeakDetailsBloc>(),
            child: _SucceededConquerDialog(
              peak: peak,
              onTakePhotoPressed: onTakePhotoPressed,
              onAddFromGalleryPressed: onAddFromGalleryPressed,
            ),
          ),
        );
  }
}
