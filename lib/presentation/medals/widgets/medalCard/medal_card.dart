import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalCard/medal_card_information.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalCard/medal_card_medal.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalDialog/medal_dialog.dart';
import 'package:flutter/material.dart';

class MedalCard extends StatelessWidget {
  const MedalCard({required this.medal, required this.isEnabled, this.height = 240, this.radius = 28, super.key});

  final Medals medal;
  final bool isEnabled;
  final double height;
  final double radius;

  void _onMedalCardPressed(BuildContext context) {
    MedalDialog.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NetworkAssetImage(
          assetPath: medal.background,
          height: height,
          radius: radius,
          disable: !isEnabled,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              const MedalCardMedal(),
              const SizedBox.shrink(),
              MedalCardInformation(medal: medal),
            ],
          ),
        ),
        if (isEnabled)
          FixedInkWell(
            onPressed: () {
              _onMedalCardPressed(context);
            },
            radius: radius,
          ),
      ],
    );
  }
}
