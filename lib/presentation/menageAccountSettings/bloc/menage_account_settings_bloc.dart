import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/presentation/menageAccountSettings/constants/menage_account_settings_state_status.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'menage_account_settings_event.dart';
part 'menage_account_settings_state.dart';

class MenageAccountSettingsBloc extends Bloc<MenageAccountSettingsEvent, MenageAccountSettingsState> {
  MenageAccountSettingsBloc({required User user}) : super(MenageAccountSettingsState(user: user)) {}
}
