import 'package:eksiazeczka_kgp/presentation/appLanguageSettings/bloc/app_language_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/appLanguageSettings/view/app_language_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLanguageSettingsPage extends StatelessWidget {
  const AppLanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AppLanguageSettingsBloc>(),
      child: const AppLanguageSettingsView(),
    );
  }
}
