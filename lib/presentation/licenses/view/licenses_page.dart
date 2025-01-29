import 'package:eksiazeczka_kp/presentation/licenses/view/licenses_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoScaffold(body: LicensesView());
  }
}
