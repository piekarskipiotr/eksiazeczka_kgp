import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalCard/medal_card.dart';
import 'package:flutter/material.dart';

class MedalList extends StatelessWidget {
  const MedalList({required this.medals, super.key});

  final List<Medals> medals;

  bool _isEnabled(Medals medal, List<Medals> medals) {
    return medals.contains(medal);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 196),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(child: MedalCard(medal: Medals.first, isEnabled: _isEnabled(Medals.first, medals))),
              Expanded(child: MedalCard(medal: Medals.fifth, isEnabled: _isEnabled(Medals.fifth, medals))),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(child: MedalCard(medal: Medals.tenth, isEnabled: _isEnabled(Medals.tenth, medals))),
              Expanded(child: MedalCard(medal: Medals.twenty, isEnabled: _isEnabled(Medals.twenty, medals))),
            ],
          ),
          MedalCard(medal: Medals.all, isEnabled: _isEnabled(Medals.all, medals)),
        ],
      ),
    );
  }
}
