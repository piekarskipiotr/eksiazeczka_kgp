import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('medal_models assets test', () {
    expect(File(MedalModels.all).existsSync(), isTrue);
    expect(File(MedalModels.fifth).existsSync(), isTrue);
    expect(File(MedalModels.first).existsSync(), isTrue);
    expect(File(MedalModels.tenth).existsSync(), isTrue);
    expect(File(MedalModels.twenty).existsSync(), isTrue);
  });
}
