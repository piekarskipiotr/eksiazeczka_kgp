import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/designSystem/dropdownMenu/app_dropdown_menu_entry.dart';
import 'package:eksiazeczka_kgp/designSystem/dropdownMenu/app_dropdown_menu_entry_divider.dart';
import 'package:flutter/material.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu({required this.child, required this.items, super.key});

  final Widget child;
  final List<AppDropdownMenuItem> items;

  double get _radius => 24;

  BorderRadius get _borderRadius => BorderRadius.all(Radius.circular(_radius));

  @override
  Widget build(BuildContext context) {
    // TODO(piotr): Improve this widget
    return Theme(
      /*
        Currently it seems like menu background cannot be transparent and there is problem
        with splash while using rounded corners (splash paints beyond the menu container)
       */
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
      ),
      child: PopupMenuButton<AppDropdownMenuItem>(
        icon: child,
        offset: const Offset(0, 8),
        position: PopupMenuPosition.under,
        padding: EdgeInsets.zero,
        menuPadding: const EdgeInsets.symmetric(vertical: 4),
        splashRadius: _radius,
        borderRadius: _borderRadius,
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        color: AppColors.darkSecondaryBackground,
        tooltip: '',
        onSelected: (dropdownMenuItem) {
          dropdownMenuItem.onPressed();
        },
        itemBuilder: (_) {
          return _mapMenuItems(items);
        },
      ),
    );
  }

  List<PopupMenuEntry<AppDropdownMenuItem>> _mapMenuItems(List<AppDropdownMenuItem> items) {
    return items
        .map((AppDropdownMenuItem menuItem) {
          final isLastItem = items.last == menuItem;
          final entry = _popupMenuEntryItem(menuItem);
          return [entry, if (!isLastItem && items.length > 1) _divider];
        })
        .expand((i) => i)
        .toList();
  }

  PopupMenuItem<AppDropdownMenuItem> _popupMenuEntryItem(AppDropdownMenuItem menuItem) {
    return PopupMenuItem<AppDropdownMenuItem>(
      value: menuItem,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppDropdownMenuEntry(menuItem: menuItem),
    );
  }

  PopupMenuEntry<AppDropdownMenuItem> get _divider {
    const height = 0.1;
    return const PopupMenuItem<AppDropdownMenuItem>(
      enabled: false,
      height: height,
      padding: EdgeInsets.zero,
      child: AppDropdownMenuEntryDivider(height: height),
    );
  }
}
