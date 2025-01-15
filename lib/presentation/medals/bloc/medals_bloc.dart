import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'medals_event.dart';
part 'medals_state.dart';

class MedalsBloc extends Bloc<MedalsEvent, MedalsState> {
  MedalsBloc({required PeaksService peaksService})
      : _peaksService = peaksService,
        super(const MedalsState()) {
    on<Initialize>(_onInitialize);
    on<LoadPeaks>(_onLoadPeaks);
  }

  final PeaksService _peaksService;

  late StreamSubscription<List<Peak>> _peaksSubscription;

  Future<void> _onInitialize(Initialize event, Emitter<MedalsState> emit) async {
    _peaksSubscription = _peaksService.peaks.listen(
      (peaks) {
        if (peaks.isNotEmpty) add(LoadPeaks(peaks));
      },
    );
  }

  Future<void> _onLoadPeaks(LoadPeaks event, Emitter<MedalsState> emit) async {
    final peaks = event.peaks;
    final conqueredPeaksCount = peaks.where((e) => e.userMetadata != null).length;
    final medals = Medals.getByStep(conqueredPeaksCount);
    emit(state.copyWith(medals: [Medals.first, ...medals]));
  }

  @override
  Future<void> close() {
    _peaksSubscription.cancel();
    return super.close();
  }
}
