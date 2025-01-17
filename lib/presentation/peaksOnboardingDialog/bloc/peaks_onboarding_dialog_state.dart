part of 'peaks_onboarding_dialog_bloc.dart';

class PeaksOnboardingDialogState extends Equatable {
  const PeaksOnboardingDialogState({
    this.isLoadingPeaks = true,
    this.peaks,
    this.error,
  });

  final bool isLoadingPeaks;
  final List<Peak>? peaks;
  final String? error;

  PeaksOnboardingDialogState copyWith({
    bool? isLoadingPeaks,
    List<Peak>? peaks,
    String? error,
  }) {
    return PeaksOnboardingDialogState(
      isLoadingPeaks: isLoadingPeaks ?? this.isLoadingPeaks,
      peaks: peaks ?? this.peaks,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoadingPeaks, peaks, error];
}
