import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalCard/medal_card_information.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalCard/medal_card_medal.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/medalDialog/medal_dialog.dart';
import 'package:flutter/material.dart';

class MedalCard extends StatelessWidget {
  const MedalCard({required this.medal, required this.isEnabled, this.height = 240, this.radius = 28, super.key});

  final Medals medal;
  final bool isEnabled;
  final double height;
  final double radius;

  void _onMedalCardPressed(BuildContext context, Medals medal) {
    MedalDialog.show(context, medal: medal);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NetworkAssetImage(
          topLeftRadius: radius,
          topRightRadius: radius,
          bottomLeftRadius: radius,
          bottomRightRadius: radius,
          assetPath: medal.background,
          height: height,
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
              _onMedalCardPressed(context, medal);
            },
            radius: radius,
          ),
      ],
    );
  }
}
