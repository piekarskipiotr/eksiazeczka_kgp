import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/bloc/peak_chip_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/constants/peak_chip_state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeakChipView extends StatelessWidget {
  const PeakChipView({required this.onProcessingChange, super.key});

  final void Function({required String peakId, required bool isProcessing}) onProcessingChange;

  void _handleStateStatus(BuildContext context, PeakChipState state) {
    final peak = state.peak;
    final peakId = peak.id;
    final status = state.status;
    final isProcessingStatus = [
      PeakChipStateStatus.validatingMemorablePhoto,
      PeakChipStateStatus.savingMemorablePhoto,
      PeakChipStateStatus.insertingMetadata,
    ];
    final isProcessing = isProcessingStatus.contains(status);
    onProcessingChange(peakId: peakId, isProcessing: isProcessing);
  }

  void _onPeakChipPressed(BuildContext context) {
    context.read<PeakChipBloc>().add(const ValidateMemorablePhoto());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeakChipBloc, PeakChipState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _handleStateStatus,
      builder: (context, state) {
        final peak = state.peak;
        final status = state.status;
        final isProcessingStatus = [
          PeakChipStateStatus.validatingMemorablePhoto,
          PeakChipStateStatus.savingMemorablePhoto,
          PeakChipStateStatus.insertingMetadata,
        ];
        final isProcessing = isProcessingStatus.contains(status);
        return AppFilterChip(
          label: peak.name,
          useSelectIcon: true,
          isProcessing: isProcessing,
          isSelected: peak.isConquered,
          onSelected: ({required isSelected}) {
            if (!isSelected) return;
            _onPeakChipPressed(context);
          },
          size: ChipSize.large,
        );
      },
    );
  }
}
