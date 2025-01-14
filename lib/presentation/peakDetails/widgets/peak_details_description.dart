import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_information_section.dart';
import 'package:flutter/material.dart';

class PeakDetailsDescription extends StatelessWidget {
  const PeakDetailsDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PeakDetailsInformationSection(label: l10n.description, description: description);
  }
}
