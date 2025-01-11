import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class _MenageAccountSettingsDeleteAccountDialog extends StatelessWidget {
  const _MenageAccountSettingsDeleteAccountDialog({
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
  });

  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 48, 0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.deleteAccountConfirmationTitle, style: AppTextStyles.h2()),
                  Text(l10n.deleteAccountConfirmationDescription, style: AppTextStyles.h6()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                spacing: 16,
                children: [
                  AppButton(label: l10n.deleteAccount, onPressed: onPrimaryButtonPressed),
                  AppTextButton(label: l10n.cancel, onPressed: onSecondaryButtonPressed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenageAccountSettingsDeleteAccountDialog {
  static void show(
    BuildContext context, {
    required VoidCallback onPrimaryButtonPressed,
    required VoidCallback onSecondaryButtonPressed,
  }) {
    CupertinoScaffold.showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (context) => _MenageAccountSettingsDeleteAccountDialog(
        onPrimaryButtonPressed: onPrimaryButtonPressed,
        onSecondaryButtonPressed: onSecondaryButtonPressed,
      ),
    );
  }
}
