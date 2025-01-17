import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemorablePhotoDialogActionButtons extends StatelessWidget {
  const MemorablePhotoDialogActionButtons({super.key});

  void _onExitPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              label: l10n.close,
              onPressed: () {
                _onExitPressed(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
