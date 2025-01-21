import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'peaks_onboarding_event.dart';
part 'peaks_onboarding_state.dart';

class PeaksOnboardingBloc extends Bloc<PeaksOnboardingEvent, PeaksOnboardingState> {
  PeaksOnboardingBloc({
    required PeaksRepository peaksRepository,
    required UserPreferencesService userPreferencesService,
  })  : _peaksRepository = peaksRepository,
        _userPreferencesService = userPreferencesService,
        super(const PeaksOnboardingState()) {
    on<FetchPeaks>(_onFetchPeaks);
    on<UpdateProcessingMap>(_onUpdateProcessingMap);
    on<MarkOnboardingAsCompleted>(_onMarkOnboardingAsCompleted);

    add(const FetchPeaks());
  }

  final PeaksRepository _peaksRepository;
  final UserPreferencesService _userPreferencesService;

  Future<void> _onFetchPeaks(FetchPeaks event, Emitter<PeaksOnboardingState> emit) async {
    emit(state.copyWith(isLoadingPeaks: true));
    await _peaksRepository.select().then((peaks) {
      final peakProcessingMap = {for (final peak in peaks) peak.id: false};
      emit(
        state.copyWith(
          isLoadingPeaks: false,
          peaks: peaks,
          peakProcessingMap: peakProcessingMap,
        ),
      );
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO FETCH PEAKS, error: $error \n\n $stacktrace');
      emit(state.copyWith(isLoadingPeaks: false, error: error.toString()));
    });
  }

  Future<void> _onUpdateProcessingMap(UpdateProcessingMap event, Emitter<PeaksOnboardingState> emit) async {
    final peakId = event.peakId;
    final isProcessing = event.isProcessing;
    final peakProcessingMap = {...?state.peakProcessingMap}..update(peakId, (_) => isProcessing);
    emit(state.copyWith(peakProcessingMap: peakProcessingMap));
  }

  Future<void> _onMarkOnboardingAsCompleted(MarkOnboardingAsCompleted event, Emitter<PeaksOnboardingState> emit) async {
    await _userPreferencesService.changePeaksOnboardingStatus(value: true);
  }
}
