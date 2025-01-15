import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc({required PeaksService peaksService})
      : _peaksService = peaksService,
        super(const RootState()) {
    on<LoadConqueredPeaksCount>(_onLoadConqueredPeaksCount);

    _peaksService.peaks.listen(
      (peaks) {
        if (peaks.isNotEmpty) add(LoadConqueredPeaksCount(peaks));
      },
    );
  }

  final PeaksService _peaksService;

  Future<void> _onLoadConqueredPeaksCount(LoadConqueredPeaksCount event, Emitter<RootState> emit) async {
    final peaks = event.peaks;
    final conqueredPeaksCount = peaks.where((e) => e.userMetadata != null).length;
    emit(state.copyWith(conqueredPeaksCount: conqueredPeaksCount));
  }
}
