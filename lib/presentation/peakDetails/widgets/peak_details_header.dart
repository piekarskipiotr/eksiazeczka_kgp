import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PeakDetailsHeader extends StatelessWidget {
  const PeakDetailsHeader({required this.peak, super.key});

  final Peak peak;

  void _onBackPressed(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PeakCard(peak: peak, height: 420),
        SafeArea(
          child: Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(12),
            child: AppCircleIconBlurButton(
              iconPath: IconImages.close,
              onPressed: () {
                _onBackPressed(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
