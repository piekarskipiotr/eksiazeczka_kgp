import 'package:eksiazeczka_kgp/presentation/darkModeSettings/bloc/dark_mode_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/darkModeSettings/view/dark_mode_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeSettingsPage extends StatelessWidget {
  const DarkModeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<DarkModeSettingsBloc>(),
      child: const DarkModeSettingsView(),
    );
  }
}
