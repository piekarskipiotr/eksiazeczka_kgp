import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/licenses/widgets/widgets.dart';
import 'package:eksiazeczka_kp/presentation/more/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensesView extends StatefulWidget {
  const LicensesView({super.key});

  @override
  State<LicensesView> createState() => _LicensesViewState();
}

class _LicensesViewState extends State<LicensesView> {
  late Future<Map<String, int>> _licenseFuture;

  @override
  void initState() {
    super.initState();
    _licenseFuture = _fetchLicenseCounts();
  }

  Future<Map<String, int>> _fetchLicenseCounts() async {
    final licenseCounts = <String, int>{};
    await for (final LicenseEntry entry in LicenseRegistry.licenses) {
      for (final package in entry.packages) {
        licenseCounts.update(package, (count) => count + 1, ifAbsent: () => 1);
      }
    }

    return licenseCounts;
  }

  void _showLicenseDetails(BuildContext context, String packageName) {
    LicenseDetailsDialog.show(context, packageName: packageName);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final primaryColor = Theme.of(context).primaryColor;

    return SettingsPageLayout(
      label: l10n.licenses,
      child: FutureBuilder<Map<String, int>>(
        future: _licenseFuture, // Use cached future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(color: primaryColor, strokeWidth: 2),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Center(child: Text('Error: ${snapshot.error}')),
            );
          }

          final licenseCounts = snapshot.data ?? {};
          return MoreSection(
            children: licenseCounts.entries.map((entry) {
              return MoreSectionItemTextDescription(
                label: entry.key,
                description: '${entry.value} license(s)',
                onPressed: () {
                  _showLicenseDetails(context, entry.key);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
