import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class _LicenseDetailsView extends StatefulWidget {
  const _LicenseDetailsView({required this.packageName});

  final String packageName;

  @override
  State<_LicenseDetailsView> createState() => _LicenseDetailsViewState();
}

class _LicenseDetailsViewState extends State<_LicenseDetailsView> {
  late Future<String> _licenseTextFuture;

  @override
  void initState() {
    super.initState();
    _licenseTextFuture = _fetchLicenseText(widget.packageName);
  }

  Future<String> _fetchLicenseText(String packageName) async {
    final licenseText = StringBuffer();
    await for (final LicenseEntry entry in LicenseRegistry.licenses) {
      if (entry.packages.contains(packageName)) {
        for (final paragraph in entry.paragraphs) {
          licenseText.writeln(paragraph.text);
        }
      }
    }

    return licenseText.isEmpty ? 'License not found' : licenseText.toString();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.packageName),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<String>(
        future: _licenseTextFuture,
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
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: Text('License not found')),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Text(snapshot.data!, style: AppTextStyles.h8()),
            ),
          );
        },
      ),
    );
  }
}

class LicenseDetailsDialog {
  static void show(BuildContext context, {required String packageName}) {
    CupertinoScaffold.showCupertinoModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      builder: (context) => _LicenseDetailsView(packageName: packageName),
    );
  }
}
