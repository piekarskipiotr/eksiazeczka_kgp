import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/services/dataRefreshService/data_refresh_service.dart';
import 'package:equatable/equatable.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc({required DataRefreshService dataRefreshService, required PeaksRepository peaksRepository})
      : _dataRefreshService = dataRefreshService,
        _peaksRepository = peaksRepository,
        super(const RootState()) {
    on<LoadConqueredPeaksCount>(_onLoadConqueredPeaksCount);

    add(const LoadConqueredPeaksCount());
    _dataRefreshService.peaksUpdateStream.listen((_) {
      add(const LoadConqueredPeaksCount());
    });
  }

  final DataRefreshService _dataRefreshService;
  final PeaksRepository _peaksRepository;

  Future<void> _onLoadConqueredPeaksCount(LoadConqueredPeaksCount event, Emitter<RootState> emit) async {
    await _peaksRepository.select().then((peaks) {
      final conqueredPeaksCount = peaks.where((e) => e.userMetadata != null).length;
      emit(state.copyWith(conqueredPeaksCount: conqueredPeaksCount));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO FETCH PEAKS, error: $error \n\n $stacktrace');
      emit(state.copyWith(conqueredPeaksCount: 0, error: error.toString()));
    });
  }
}
