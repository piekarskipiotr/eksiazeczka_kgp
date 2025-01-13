import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _SuccessConquerDialog extends StatelessWidget {
  const _SuccessConquerDialog({
    required this.peak,
    required this.onTakePhotoPressed,
    required this.onAddFromGalleryPressed,
  });

  final Peak peak;
  final VoidCallback onTakePhotoPressed;
  final VoidCallback onAddFromGalleryPressed;

  void _onExitPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ImageCard(
            assetPath: peak.assetImage,
            url: peak.image,
            height: double.infinity,
            radius: 0,
          ),
          SafeArea(
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
          ),
          Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.youHaveConqueredPeak, style: AppTextStyles.h3(color: textColor)),
              Text(peak.name, style: AppTextStyles.h1(color: textColor)),
              const SizedBox(height: 16),
              Text(
                l10n.youHaveConqueredPeakDescription,
                style: AppTextStyles.h7(color: textColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    label: l10n.takePhoto,
                    onPressed: onTakePhotoPressed,
                  ),
                  AppTextButton(
                    label: l10n.addPhotoFromGallery,
                    labelColor: textColor,
                    onPressed: onAddFromGalleryPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessConquerDialog {
  static void show(
    BuildContext context, {
    required Peak peak,
    required VoidCallback onTakePhotoPressed,
    required VoidCallback onAddFromGalleryPressed,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => _SuccessConquerDialog(
          peak: peak,
          onTakePhotoPressed: onTakePhotoPressed,
          onAddFromGalleryPressed: onAddFromGalleryPressed,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
