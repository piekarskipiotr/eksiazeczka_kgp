import 'package:flutter/cupertino.dart';

enum ChipSize {
  regular,
  large;

  EdgeInsets get padding => switch (this) {
        ChipSize.regular => const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ChipSize.large => const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      };
}
