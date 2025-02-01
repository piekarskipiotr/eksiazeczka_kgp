import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

class _PermissionRationaleDialog extends StatelessWidget {
  const _PermissionRationaleDialog(this.rationale);

  final Rationale rationale;

  void _onOpenSettingsPressed(BuildContext context) {
    openAppSettings();
    context.pop();
  }

  void _onCloseDialogPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (title, description) = rationale.getText(l10n);
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
                  Text(title, style: AppTextStyles.h2()),
                  Text(description, style: AppTextStyles.h6()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                spacing: 16,
                children: [
                  AppButton(
                    label: l10n.openSettings,
                    onPressed: () {
                      _onOpenSettingsPressed(context);
                    },
                  ),
                  AppTextButton(
                    label: l10n.cancel,
                    onPressed: () {
                      _onCloseDialogPressed(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionRationaleDialog {
  static void show(BuildContext context, {required Rationale rationale}) {
    CupertinoScaffold.showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (context) => _PermissionRationaleDialog(rationale),
    );
  }
}
