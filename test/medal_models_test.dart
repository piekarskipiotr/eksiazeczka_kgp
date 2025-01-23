import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';

void main() {
  test('medal_models assets test', () {
    expect(File(MedalModels.all).existsSync(), isTrue);
    expect(File(MedalModels.fifth).existsSync(), isTrue);
    expect(File(MedalModels.first).existsSync(), isTrue);
    expect(File(MedalModels.tenth).existsSync(), isTrue);
    expect(File(MedalModels.twenty).existsSync(), isTrue);
  });
}
