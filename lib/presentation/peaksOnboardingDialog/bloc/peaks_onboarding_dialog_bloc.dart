import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'peaks_onboarding_dialog_event.dart';
part 'peaks_onboarding_dialog_state.dart';

class PeaksOnboardingDialogBloc extends Bloc<PeaksOnboardingDialogEvent, PeaksOnboardingDialogState> {
  PeaksOnboardingDialogBloc({required PeaksRepository peaksRepository})
      : _peaksRepository = peaksRepository,
        super(const PeaksOnboardingDialogState()) {
    on<FetchPeaks>(_onFetchPeaks);

    add(const FetchPeaks());
  }

  final PeaksRepository _peaksRepository;

  Future<void> _onFetchPeaks(FetchPeaks event, Emitter<PeaksOnboardingDialogState> emit) async {
    emit(state.copyWith(isLoadingPeaks: true));
    await _peaksRepository.select().then((peaks) {
      emit(state.copyWith(isLoadingPeaks: false, peaks: peaks));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO FETCH PEAKS, error: $error \n\n $stacktrace');
      emit(state.copyWith(isLoadingPeaks: false, error: error.toString()));
    });
  }
}
