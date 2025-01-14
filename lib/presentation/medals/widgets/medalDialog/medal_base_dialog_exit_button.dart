import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MedalBaseDialogExitButton extends StatelessWidget {
  const MedalBaseDialogExitButton({super.key});

  void _onExitPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
