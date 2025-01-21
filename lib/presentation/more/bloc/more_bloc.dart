import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/presentation/more/constants/more_state_status.dart';
import 'package:eksiazeczka_kp/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(const MoreState()) {
    on<OpenLink>(_onOpenLink);
  }

  Future<void> _onOpenLink(OpenLink event, Emitter<MoreState> emit) async {
    final url = event.url;
    await UrlLauncher.open(url);
  }
}
