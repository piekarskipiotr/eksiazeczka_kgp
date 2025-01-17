import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/appLanguageSettings/bloc/app_language_settings_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_information_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeakDetailsDescription extends StatelessWidget {
  const PeakDetailsDescription({required this.descriptions, super.key});

  final List<Description> descriptions;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = context.watch<AppLanguageSettingsBloc>().state.locale;
    final description = descriptions.singleWhere((e) => e.locale == locale).text;
    return PeakDetailsInformationSection(label: l10n.description, description: description);
  }
}
