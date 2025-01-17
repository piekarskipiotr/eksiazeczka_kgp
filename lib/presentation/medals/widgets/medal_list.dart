import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/medals/widgets/medalCard/medal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MedalList extends StatelessWidget {
  const MedalList({required this.medals, super.key});

  final List<Medals> medals;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 196),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(child: _animatedMedalCard(medal: Medals.first, medals: medals)),
                Expanded(child: _animatedMedalCard(medal: Medals.fifth, medals: medals)),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(child: _animatedMedalCard(medal: Medals.tenth, medals: medals)),
                Expanded(child: _animatedMedalCard(medal: Medals.twenty, medals: medals)),
              ],
            ),
            _animatedMedalCard(medal: Medals.all, medals: medals),
          ],
        ),
      ),
    );
  }

  Widget _animatedMedalCard({required Medals medal, required List<Medals> medals}) {
    final isEnabled = medals.contains(medal);
    final index = medal.index;
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: Duration(milliseconds: 350 + 100 * index),
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(child: MedalCard(medal: medal, isEnabled: isEnabled)),
      ),
    );
  }
}
