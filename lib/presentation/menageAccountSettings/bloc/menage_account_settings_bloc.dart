import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/constants/menage_account_settings_state_status.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'menage_account_settings_event.dart';
part 'menage_account_settings_state.dart';

class MenageAccountSettingsBloc extends Bloc<MenageAccountSettingsEvent, MenageAccountSettingsState> {
  MenageAccountSettingsBloc({required AuthService authService, required User user})
      : _authService = authService,
        super(MenageAccountSettingsState(user: user)) {
    on<DeleteAccount>(_onDeleteAccount);
    on<SignOut>(onSignOut);
  }

  final AuthService _authService;

  Future<void> _onDeleteAccount(DeleteAccount event, Emitter<MenageAccountSettingsState> emit) async {
    emit(state.copyWith(status: MenageAccountSettingsStateStatus.deletingAccount));
    await _authService.deleteAccount().then((_) async {
      emit(state.copyWith(status: MenageAccountSettingsStateStatus.deletingAccountSucceeded));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO DELETE ACCOUNT, error: $error \n\n $stacktrace');
      emit(state.copyWith(status: MenageAccountSettingsStateStatus.deletingAccountFailed, error: error.toString()));
    });
  }

  Future<void> onSignOut(SignOut event, Emitter<MenageAccountSettingsState> emit) async {
    emit(state.copyWith(status: MenageAccountSettingsStateStatus.signingOut));

    await _authService.signOut().then((_) async {
      emit(state.copyWith(status: MenageAccountSettingsStateStatus.signingOutSucceeded));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO SIGN OUT, error: $error \n\n $stacktrace');
      emit(state.copyWith(status: MenageAccountSettingsStateStatus.signingOutFailed, error: error.toString()));
    });
  }
}
