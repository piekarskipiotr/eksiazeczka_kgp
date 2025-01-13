import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

class _GeolocationPermissionRationaleDialog extends StatelessWidget {
  const _GeolocationPermissionRationaleDialog();

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
                  Text(l10n.geolocationPermissionRationaleTitle, style: AppTextStyles.h2()),
                  Text(l10n.geolocationPermissionRationaleDescription, style: AppTextStyles.h6()),
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

class GeolocationPermissionRationaleDialog {
  static void show(BuildContext context) {
    CupertinoScaffold.showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (context) => const _GeolocationPermissionRationaleDialog(),
    );
  }
}
