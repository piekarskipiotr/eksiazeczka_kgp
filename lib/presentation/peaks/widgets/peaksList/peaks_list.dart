import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/presentation/peaks/widgets/peaksList/empty_list.dart';
import 'package:eksiazeczka_kp/presentation/peaks/widgets/peaksList/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PeaksList extends StatelessWidget {
  const PeaksList({
    required this.peaks,
    required this.isLoadingPeaks,
    required this.filter,
    required this.sortTypes,
    required this.onPeakPressed,
    super.key,
  });

  final List<Peak> peaks;
  final bool isLoadingPeaks;
  final PeaksFilters filter;
  final PeaksSortTypes sortTypes;
  final void Function(BuildContext, Peak) onPeakPressed;

  @override
  Widget build(BuildContext context) {
    if (isLoadingPeaks) return const LoadingList();
    if (peaks.isEmpty) return EmptyList(filter: filter);
    return AnimationLimiter(
      key: ValueKey('$filter$sortTypes'),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: peaks.length,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 196),
        itemBuilder: (context, index) {
          final peak = peaks[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 350 + 150 * index),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: PeakCard(
                  peak: peak,
                  onPressed: () {
                    onPeakPressed(context, peak);
                  },
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          final itemsLength = peaks.length;
          final isLastItem = itemsLength == index;
          final height = !isLastItem && itemsLength > 1 ? 24.0 : 0.0;
          return SizedBox(height: height);
        },
      ),
    );
  }
}
