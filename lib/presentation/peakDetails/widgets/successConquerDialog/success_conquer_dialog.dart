import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Theme(
      data: AppThemes.dark,
      child: Scaffold(
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
                Text(l10n.youHaveConqueredPeak, style: AppTextStyles.h3()),
                Text(peak.name, style: AppTextStyles.h1()),
                const SizedBox(height: 16),
                Text(
                  l10n.youHaveConqueredPeakDescription,
                  style: AppTextStyles.h7(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 64),
              ],
            ),
            BlocBuilder<PeakDetailsBloc, PeakDetailsState>(
              builder: (context, state) {
                final status = state.status;
                final processingStates = [
                  PeakDetailsStateStatus.takingPhoto,
                  PeakDetailsStateStatus.addingGalleryPhoto,
                ];
      
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          label: l10n.takePhoto,
                          onPressed: onTakePhotoPressed,
                          isLoading: status == PeakDetailsStateStatus.takingPhoto,
                          isProcessing: processingStates.contains(status),
                        ),
                        AppTextButton(
                          label: l10n.addPhotoFromGallery,
                          onPressed: onAddFromGalleryPressed,
                          isLoading: status == PeakDetailsStateStatus.addingGalleryPhoto,
                          isProcessing: processingStates.contains(status),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
        builder: (_) => BlocProvider.value(
          value: context.read<PeakDetailsBloc>(),
          child: _SuccessConquerDialog(
            peak: peak,
            onTakePhotoPressed: onTakePhotoPressed,
            onAddFromGalleryPressed: onAddFromGalleryPressed,
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
