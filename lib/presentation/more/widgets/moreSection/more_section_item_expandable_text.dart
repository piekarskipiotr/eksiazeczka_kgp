import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';

class MoreSectionItemExpandableText extends StatefulWidget {
  const MoreSectionItemExpandableText({required this.label, required this.text, super.key});

  final String label;
  final String text;

  @override
  State<MoreSectionItemExpandableText> createState() => _MoreSectionItemExpandableTextState();
}

class _MoreSectionItemExpandableTextState extends State<MoreSectionItemExpandableText> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _heightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded ? _controller.reverse() : _controller.forward();
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  EdgeInsets get _padding => const EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleExpansion,
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.h7(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? -0.25 : 0.25,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: const AppIcon(IconImages.arrowForward, size: 16),
                ),
              ],
            ),
            SizeTransition(
              sizeFactor: _heightAnimation,
              axisAlignment: -1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.text,
                    style: AppTextStyles.h7(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
