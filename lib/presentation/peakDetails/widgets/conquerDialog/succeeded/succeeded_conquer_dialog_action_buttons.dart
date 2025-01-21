import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SucceededConquerDialogActionButtons extends StatelessWidget {
  const SucceededConquerDialogActionButtons({
    required this.onTakePhotoPressed,
    required this.onAddFromGalleryPressed,
    super.key,
  });

  final VoidCallback onTakePhotoPressed;
  final VoidCallback onAddFromGalleryPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<PeakDetailsBloc, PeakDetailsState>(
      builder: (context, state) {
        final status = state.status;
        final processingStatus = [
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
                  isProcessing: processingStatus.contains(status),
                ),
                AppTextButton(
                  label: l10n.addPhotoFromGallery,
                  onPressed: onAddFromGalleryPressed,
                  isLoading: status == PeakDetailsStateStatus.addingGalleryPhoto,
                  isProcessing: processingStatus.contains(status),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
