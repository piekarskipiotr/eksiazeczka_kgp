import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/services/auth_service/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'peaks_event.dart';
part 'peaks_state.dart';

class PeaksBloc extends Bloc<PeaksEvent, PeaksState> {
  PeaksBloc({
    required AuthService authService,
    required SupabasePeaksRepository supabasePeaksRepository,
  })  : _authService = authService,
        _supabasePeaksRepository = supabasePeaksRepository,
        super(const PeaksState()) {
    on<InitializeStreamSubscription>(_onInitializeStreamSubscription);
    on<LoadPeaks>(_onLoadPeaks);
    on<ChangePeaksFilter>(_onChangePeaksFilter);
    on<ChangePeaksSortType>(_onChangePeaksSortType);

    add(const InitializeStreamSubscription());
  }

  final AuthService _authService;
  final SupabasePeaksRepository _supabasePeaksRepository;

  Future<void> _onInitializeStreamSubscription(InitializeStreamSubscription event, Emitter<PeaksState> emit) async {
    try {
      final user = await _authService.getCurrentUser();
      final stream = await _supabasePeaksRepository.subscribe(userId: user.id);
      emit(
        state.copyWith(
          streamSubscription: stream.listen(
            (peaks) {
              add(LoadPeaks(peaks));
            },
            onError: (Object error, StackTrace stacktrace) {
              addError(error, StackTrace.current);
            },
          ),
        ),
      );
    } catch (error, stacktrace) {
      log('FAILED TO INITIALIZE STREAM SUBSCRIPTION error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(isLoadingPeaks: false, error: error.toString()));
    }
  }

  Future<void> _onLoadPeaks(LoadPeaks event, Emitter<PeaksState> emit) async {
    emit(state.copyWith(isLoadingPeaks: true));
    final peaks = event.peaks;
    final selectedFilter = state.filter;
    final selectedSortType = state.sortType;

    final sortedAndFilteredPeaks = _filterPeaks(peaks, selectedFilter);
    _sortPeaks(sortedAndFilteredPeaks, selectedSortType);
    emit(state.copyWith(peaks: peaks, sortedAndFilteredPeaks: sortedAndFilteredPeaks, isLoadingPeaks: false));
  }

  Future<void> _onChangePeaksFilter(ChangePeaksFilter event, Emitter<PeaksState> emit) async {
    final pressedFilter = event.filter;
    final selectedFilter = state.filter;
    if (pressedFilter == selectedFilter) return;

    final validatedState = _validateSortTypeState(pressedFilter);
    emit(validatedState.copyWith(filter: pressedFilter));

    final peaks = [...?state.peaks];
    add(LoadPeaks(peaks));
  }

  Future<void> _onChangePeaksSortType(ChangePeaksSortType event, Emitter<PeaksState> emit) async {
    final pressedSortType = event.sortType;
    final selectedSortType = state.sortType;
    if (pressedSortType == selectedSortType) return;

    emit(state.copyWith(sortType: pressedSortType));

    final peaks = [...?state.peaks];
    add(LoadPeaks(peaks));
  }

  PeaksState _validateSortTypeState(PeaksFilters pressedFilter) {
    final exclusiveSortTypes = [PeaksSortTypes.conqueredDateAsc, PeaksSortTypes.conqueredDateDsc];
    final selectedSortType = state.sortType;
    if (pressedFilter == PeaksFilters.unconquered && exclusiveSortTypes.contains(selectedSortType)) {
      return state.copyWith(sortType: PeaksSortTypes.alphabetical);
    }

    return state;
  }

  List<Peak> _filterPeaks(List<Peak> peaks, PeaksFilters selectedFilter) {
    return peaks.where((peak) {
      if (selectedFilter == PeaksFilters.conquered) return peak.userMetadata != null;
      if (selectedFilter == PeaksFilters.unconquered) return peak.userMetadata == null;
      return true;
    }).toList();
  }

  void _sortPeaks(List<Peak> peaks, PeaksSortTypes selectedSortType) {
    peaks.sort((peakA, peakB) {
      switch (selectedSortType) {
        case PeaksSortTypes.alphabetical:
          return peakA.name.compareTo(peakB.name);
        case PeaksSortTypes.heightAsc:
          return peakA.height.compareTo(peakB.height);
        case PeaksSortTypes.heightDsc:
          return peakB.height.compareTo(peakA.height);
        case PeaksSortTypes.conqueredDateAsc:
          return _compareConqueredDate(peakA, peakB, isAscending: true);
        case PeaksSortTypes.conqueredDateDsc:
          return _compareConqueredDate(peakA, peakB, isAscending: false);
      }
    });
  }

  int _compareConqueredDate(Peak peakA, Peak peakB, {required bool isAscending}) {
    final conqueredDateA = peakA.userMetadata?.conqueredDate;
    final conqueredDateB = peakB.userMetadata?.conqueredDate;

    if (conqueredDateA == null && conqueredDateB == null) {
      return 0;
    } else if (conqueredDateA == null) {
      return isAscending ? -1 : 1;
    } else if (conqueredDateB == null) {
      return isAscending ? 1 : -1;
    }

    final comparison = conqueredDateA.compareTo(conqueredDateB);
    return isAscending ? comparison : -comparison;
  }
}
