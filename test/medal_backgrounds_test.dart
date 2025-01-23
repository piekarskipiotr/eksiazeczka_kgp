import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';

void main() {
  test('medal_backgrounds assets test', () {
    expect(File(MedalBackgrounds.all).existsSync(), isTrue);
    expect(File(MedalBackgrounds.fifth).existsSync(), isTrue);
    expect(File(MedalBackgrounds.first).existsSync(), isTrue);
    expect(File(MedalBackgrounds.tenth).existsSync(), isTrue);
    expect(File(MedalBackgrounds.twenty).existsSync(), isTrue);
  });
}
