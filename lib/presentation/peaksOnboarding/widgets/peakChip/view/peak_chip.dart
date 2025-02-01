import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/bloc/peak_chip_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/view/peak_chip_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeakChip extends StatelessWidget {
  const PeakChip({
    required this.peak,
    required this.onProcessingChange,
    required this.onPermissionsPermanentlyDenied,
    super.key,
  });

  final Peak peak;
  final void Function({required String peakId, required bool isProcessing}) onProcessingChange;
  final VoidCallback onPermissionsPermanentlyDenied;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PeakChipBloc(
        peak: peak,
        userMetadataRepository: context.read(),
        storageRepository: context.read(),
      ),
      child: PeakChipView(
        onProcessingChange: onProcessingChange,
        onPermissionsPermanentlyDenied: onPermissionsPermanentlyDenied,
      ),
    );
  }
}
