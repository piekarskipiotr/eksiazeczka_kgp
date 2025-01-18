part of 'peaks_onboarding_bloc.dart';

class PeaksOnboardingState extends Equatable {
  const PeaksOnboardingState({
    this.isLoadingPeaks = true,
    this.peakProcessingMap,
    this.peaks,
    this.error,
  });

  final bool isLoadingPeaks;
  final List<Peak>? peaks;
  final Map<String, bool>? peakProcessingMap;
  final String? error;

  PeaksOnboardingState copyWith({
    bool? isLoadingPeaks,
    List<Peak>? peaks,
    Map<String, bool>? peakProcessingMap,
    String? error,
  }) {
    return PeaksOnboardingState(
      isLoadingPeaks: isLoadingPeaks ?? this.isLoadingPeaks,
      peaks: peaks ?? this.peaks,
      peakProcessingMap: peakProcessingMap ?? this.peakProcessingMap,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoadingPeaks, peaks, peakProcessingMap, error];
}
