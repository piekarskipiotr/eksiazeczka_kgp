import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('medal_backgrounds assets test', () {
    expect(File(MedalBackgrounds.all).existsSync(), isTrue);
    expect(File(MedalBackgrounds.fifth).existsSync(), isTrue);
    expect(File(MedalBackgrounds.first).existsSync(), isTrue);
    expect(File(MedalBackgrounds.tenth).existsSync(), isTrue);
    expect(File(MedalBackgrounds.twenty).existsSync(), isTrue);
  });
}
