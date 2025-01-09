import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/card/card.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/peaksList/empty_list.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/peaksList/loading_list.dart';
import 'package:flutter/material.dart';

class PeaksList extends StatelessWidget {
  const PeaksList({
    required this.peaks,
    required this.isLoadingPeaks,
    required this.filter,
    required this.onPeakPressed,
    super.key,
  });

  final List<Peak>? peaks;
  final bool isLoadingPeaks;
  final PeaksFilters filter;
  final void Function(BuildContext, Peak) onPeakPressed;

  @override
  Widget build(BuildContext context) {
    if (isLoadingPeaks) return const LoadingList();
    if (peaks?.isEmpty ?? true) return EmptyList(filter: filter);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: peaks!.length,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 196),
      itemBuilder: (context, index) {
        final peak = peaks![index];
        return PeakCard(
          peak: peak,
          onPressed: () {
            onPeakPressed(context, peak);
          },
        );
      },
      separatorBuilder: (_, index) {
        final itemsLength = peaks?.length ?? 0;
        final isLastItem = itemsLength == index;
        final height = !isLastItem && itemsLength > 1 ? 24.0 : 0.0;
        return SizedBox(height: height);
      },
    );
  }
}
