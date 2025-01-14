import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalDialog/medal_base_dialog.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalDialog/medal_base_dialog_exit_button.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalDialog/medal_dialog_action_buttons.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalDialog/medal_dialog_content.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _MedalDialog extends StatelessWidget {
  const _MedalDialog();

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
        child: const Stack(
          alignment: Alignment.center,
          children: [
            MedalBaseDialogExitButton(),
            MedalDialogContent(title: '', description: ''),
            MedalDialogActionButtons(),
          ],
        ),
      ),
    );
  }
}

class MedalDialog {
  static void show(BuildContext context) {
    context.read<AppRouter>().showTransparentDialog(
          context: context,
          child: const _MedalDialog(),
        );
  }
}
