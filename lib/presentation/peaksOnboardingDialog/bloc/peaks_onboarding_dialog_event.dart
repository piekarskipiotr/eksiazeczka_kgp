part of 'peaks_onboarding_dialog_bloc.dart';

abstract class PeaksOnboardingDialogEvent extends Equatable {
  const PeaksOnboardingDialogEvent();
}

final class FetchPeaks extends PeaksOnboardingDialogEvent {
  const FetchPeaks();

  @override
  List<Object?> get props => [];
}



