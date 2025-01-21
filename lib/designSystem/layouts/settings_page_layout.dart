import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPageLayout extends StatelessWidget {
  const SettingsPageLayout({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  void _onBackPressed(BuildContext context) {
    context.read<AppRouter>().pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              onTap: () {
                _onBackPressed(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: RotatedBox(
                  quarterTurns: -2,
                  child: AppIcon(IconImages.arrowForward, size: 20),
                ),
              ),
            ),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.h5(),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 28),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 196),
        child: child,
      ),
    );
  }
}
