import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/bloc/menage_account_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/presentation/more/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenageAccountSettingsView extends StatelessWidget {
  const MenageAccountSettingsView({super.key});

  void _onDeleteAccountPressed(BuildContext context) {
    MenageAccountSettingsDeleteAccountDialog.show(
      context,
      onPrimaryButtonPressed: () {
        context.read<MenageAccountSettingsBloc>().add(const DeleteAccount());
      },
      onSecondaryButtonPressed: () {
        context.pop();
      },
    );
  }

  void _onSignOutPressed(BuildContext context) {
    context.read<MenageAccountSettingsBloc>().add(const SignOut());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsPageLayout(
      label: l10n.menageAccount,
      child: BlocBuilder<MenageAccountSettingsBloc, MenageAccountSettingsState>(
        builder: (context, state) {
          final user = state.user;
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              spacing: 20,
              children: [
                MoreSection(
                  label: l10n.information,
                  children: [
                    MoreSectionItemTextText(
                      label: l10n.email,
                      text: user?.email ?? '-',
                    ),
                    MoreSectionItemTextText(
                      label: l10n.accountCreatedAt,
                      text: user?.createdAt.formatToDDMMYYYYDate ?? '-',
                    ),
                  ],
                ),
                MoreSection(
                  label: l10n.menage,
                  children: [
                    MoreSectionItemTextIcon(
                      label: l10n.deleteAccount,
                      icon: IconImages.delete,
                      isDanger: true,
                      onPressed: () {
                        _onDeleteAccountPressed(context);
                      },
                    ),
                    MoreSectionItemTextIcon(
                      label: l10n.signOut,
                      icon: IconImages.signOut,
                      onPressed: () {
                        _onSignOutPressed(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
