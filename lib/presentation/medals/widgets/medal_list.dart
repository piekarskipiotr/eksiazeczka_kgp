import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalCard/medal_card.dart';
import 'package:flutter/material.dart';

class MedalList extends StatelessWidget {
  const MedalList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 196),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(child: MedalCard(medal: Medals.first)),
              Expanded(child: MedalCard(medal: Medals.fifth)),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(child: MedalCard(medal: Medals.tenth)),
              Expanded(child: MedalCard(medal: Medals.twenty)),
            ],
          ),
          MedalCard(medal: Medals.all),
        ],
      ),
    );
  }
}
