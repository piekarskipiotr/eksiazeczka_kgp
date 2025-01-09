import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({this.count = 5, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 196),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: const SizedBox(
            height: 300,
            width: double.infinity,
            child: AppShimmer(),
          ),
        );
      },
      separatorBuilder: (_, index) {
        final itemsLength = count;
        final isLastItem = itemsLength == index;
        final height = !isLastItem && itemsLength > 1 ? 24.0 : 0.0;
        return SizedBox(height: height);
      },
    );
  }
}
