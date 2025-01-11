import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/bloc/menage_account_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/view/menage_account_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenageAccountSettingsPage extends StatelessWidget {
  const MenageAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenageAccountSettingsBloc(authService: context.read()),
      child: const MenageAccountSettingsView(),
    );
  }
}
