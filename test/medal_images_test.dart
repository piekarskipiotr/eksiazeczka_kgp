import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('medal_images assets test', () {
    expect(File(MedalImages.all).existsSync(), isTrue);
    expect(File(MedalImages.fifth).existsSync(), isTrue);
    expect(File(MedalImages.first).existsSync(), isTrue);
    expect(File(MedalImages.tenth).existsSync(), isTrue);
    expect(File(MedalImages.twenty).existsSync(), isTrue);
  });
}
