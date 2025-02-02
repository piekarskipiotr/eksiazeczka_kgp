import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('animations assets test', () {
    expect(File(Animations.celebration).existsSync(), isTrue);
  });
}
