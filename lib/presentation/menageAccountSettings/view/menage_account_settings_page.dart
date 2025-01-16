import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/bloc/menage_account_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/menageAccountSettings/view/menage_account_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenageAccountSettingsPage extends StatelessWidget {
  const MenageAccountSettingsPage({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenageAccountSettingsBloc(user: user),
      child: const CupertinoScaffold(body: MenageAccountSettingsView()),
    );
  }
}
