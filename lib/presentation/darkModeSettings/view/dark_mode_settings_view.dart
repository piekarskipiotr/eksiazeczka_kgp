import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/darkModeSettings/bloc/dark_mode_settings_bloc.dart';
import 'package:eksiazeczka_kp/presentation/more/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeSettingsView extends StatelessWidget {
  const DarkModeSettingsView({super.key});

  void _onThemeModePressed(BuildContext context, ThemeMode theme) {
    context.read<DarkModeSettingsBloc>().add(ChangeThemeMode(theme));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsPageLayout(
      label: l10n.darkMode,
      child: BlocBuilder<DarkModeSettingsBloc, DarkModeSettingsState>(
        builder: (context, state) {
          final themeMode = state.themeMode;
          return MoreSection(
            children: [
              MoreSectionItemCheckboxText(
                label: l10n.light,
                isChecked: themeMode == ThemeMode.light,
                onPressed: () {
                  _onThemeModePressed(context, ThemeMode.light);
                },
              ),
              MoreSectionItemCheckboxText(
                label: l10n.dark,
                isChecked: themeMode == ThemeMode.dark,
                onPressed: () {
                  _onThemeModePressed(context, ThemeMode.dark);
                },
              ),
              MoreSectionItemCheckboxText(
                label: l10n.system,
                isChecked: themeMode == ThemeMode.system,
                onPressed: () {
                  _onThemeModePressed(context, ThemeMode.system);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
