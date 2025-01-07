import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/root/widgets/appBar/root_app_bar_peaks_counter.dart';
import 'package:flutter/material.dart';

class RootAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RootAppBar({super.key});

  double get _appBarHeight => 56;

  double get _spacing => 16;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppBar(
      title: Row(
        spacing: _spacing,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: _spacing,
              children: [
                const AppCircleAvatar(),
                Flexible(
                  child: Text(
                    l10n.helloTraveler,
                    maxLines: 1,
                    style: AppTextStyles.h6(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const RootAppBarPeaksCounter(count: 0, total: 28),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);
}
