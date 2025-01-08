import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:equatable/equatable.dart';

part 'peaks_event.dart';
part 'peaks_state.dart';

class PeaksBloc extends Bloc<PeaksEvent, PeaksState> {
  PeaksBloc() : super(const PeaksState()) {
    on<ChangePeaksFilter>(_onChangePeaksFilter);
    on<ChangePeaksSortType>(_onChangePeaksSortType);
  }

  Future<void> _onChangePeaksFilter(ChangePeaksFilter event, Emitter<PeaksState> emit) async {
    final pressedFilter = event.filter;
    final selectedFilter = state.filter;
    if (pressedFilter == selectedFilter) return;

    final validatedState = _validateSortTypeState(pressedFilter);
    emit(validatedState.copyWith(filter: pressedFilter));
  }

  Future<void> _onChangePeaksSortType(ChangePeaksSortType event, Emitter<PeaksState> emit) async {
    final pressedSortType = event.sortType;
    final selectedSortType = state.sortType;
    if (pressedSortType == selectedSortType) return;

    emit(state.copyWith(sortType: pressedSortType));
  }

  PeaksState _validateSortTypeState(PeaksFilters pressedFilter) {
    final exclusiveSortTypes = [PeaksSortTypes.conqueredDateAsc, PeaksSortTypes.conqueredDateDsc];
    final selectedSortType = state.sortType;
    if (pressedFilter == PeaksFilters.unconquered && exclusiveSortTypes.contains(selectedSortType)) {
      return state.copyWith(sortType: PeaksSortTypes.alphabetical);
    }

    return state;
  }
}
