import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MoreSection extends StatelessWidget {
  const MoreSection({required this.children, this.label, super.key});

  final String? label;
  final List<Widget> children;

  EdgeInsets get _padding => const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: _padding,
            child: Text('$label', style: AppTextStyles.h4(), maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final widget = children[index];
            return widget;
          },
          separatorBuilder: (_, index) {
            return index < children.length - 1 ? _divider(context, _padding) : const SizedBox.shrink();
          },
          itemCount: children.length,
        ),
      ],
    );
  }

  Widget _divider(BuildContext context, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Container(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        height: 1,
      ),
    );
  }
}
