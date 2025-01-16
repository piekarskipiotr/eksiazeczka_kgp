import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'medals_event.dart';
part 'medals_state.dart';

class MedalsBloc extends Bloc<MedalsEvent, MedalsState> {
  MedalsBloc({required DataRefreshService dataRefreshService, required PeaksRepository peaksRepository})
      : _dataRefreshService = dataRefreshService,
        _peaksRepository = peaksRepository,
        super(const MedalsState()) {
    on<FetchPeaks>(_onFetchPeaks);
    on<LoadPeaks>(_onLoadPeaks);

    add(const FetchPeaks());
    _dataRefreshService.peaksUpdateStream.listen((_) {
      add(const FetchPeaks());
    });
  }

  final DataRefreshService _dataRefreshService;
  final PeaksRepository _peaksRepository;

  Future<void> _onFetchPeaks(FetchPeaks event, Emitter<MedalsState> emit) async {
    await _peaksRepository.select().then((peaks) {
      add(LoadPeaks(peaks));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO FETCH PEAKS, error: $error \n\n $stacktrace');
      emit(state.copyWith(error: error.toString()));
    });
  }

  Future<void> _onLoadPeaks(LoadPeaks event, Emitter<MedalsState> emit) async {
    final peaks = event.peaks;
    final conqueredPeaksCount = peaks.where((e) => e.userMetadata != null).length;
    final medals = Medals.getByStep(conqueredPeaksCount);
    emit(state.copyWith(medals: [Medals.first, ...medals]));
  }
}
