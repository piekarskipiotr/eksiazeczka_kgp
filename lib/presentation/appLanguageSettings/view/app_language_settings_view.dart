import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/appLanguageSettings/bloc/app_language_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/more/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLanguageSettingsView extends StatelessWidget {
  const AppLanguageSettingsView({super.key});

  void _onLocalePressed(BuildContext context, String locale) {
    context.read<AppLanguageSettingsBloc>().add(ChangeLocale(locale));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsPageLayout(
      label: l10n.appLanguage,
      child: BlocBuilder<AppLanguageSettingsBloc, AppLanguageSettingsState>(
        builder: (context, state) {
          final locale = state.locale;
          return MoreSection(
            children: [
              MoreSectionItemCheckboxText(
                label: l10n.polish,
                isChecked: locale == 'pl',
                onPressed: () {
                  _onLocalePressed(context, 'pl');
                },
              ),
              MoreSectionItemCheckboxText(
                label: l10n.english,
                isChecked: locale == 'en',
                onPressed: () {
                  _onLocalePressed(context, 'en');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
