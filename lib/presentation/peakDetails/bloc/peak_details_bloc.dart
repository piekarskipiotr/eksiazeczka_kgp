import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'peak_details_event.dart';
part 'peak_details_state.dart';

class PeakDetailsBloc extends Bloc<PeakDetailsEvent, PeakDetailsState> {
  PeakDetailsBloc({
    required Peak peak,
    required AuthService authService,
  })  : _authService = authService,
        super(PeakDetailsState(peak: peak)) {}

  final AuthService _authService;
}
