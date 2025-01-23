import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalDialog/medal_base_dialog.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalDialog/medal_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalDialog/medal_dialog_action_buttons.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalDialog/medal_dialog_content.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _MedalDialog extends StatelessWidget {
  const _MedalDialog(this.medal);

  final Medals medal;

  @override
  Widget build(BuildContext context) {
    return MedalBaseDialog(
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
            const MedalBaseDialogExitButton(),
            MedalDialogContent(medal: medal),
            const MedalDialogActionButtons(),
          ],
        ),
      ),
    );
  }
}

class MedalDialog {
  static void show(BuildContext context, {required Medals medal}) {
    context.read<AppRouter>().showTransparentDialog(
          context: context,
          child: _MedalDialog(medal),
        );
  }
}
