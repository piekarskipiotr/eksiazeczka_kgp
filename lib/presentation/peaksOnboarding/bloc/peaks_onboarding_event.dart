part of 'peaks_onboarding_bloc.dart';

abstract class PeaksOnboardingEvent extends Equatable {
  const PeaksOnboardingEvent();
}

final class FetchPeaks extends PeaksOnboardingEvent {
  const FetchPeaks();

  @override
  List<Object?> get props => [];
}

final class UpdateProcessingMap extends PeaksOnboardingEvent {
  const UpdateProcessingMap({required this.peakId, required this.isProcessing});

  final String peakId;
  final bool isProcessing;

  @override
  List<Object?> get props => [peakId, isProcessing];
}

final class MarkOnboardingAsCompleted extends PeaksOnboardingEvent {
  const MarkOnboardingAsCompleted();

  @override
  List<Object?> get props => [];
}
