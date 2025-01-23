import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('jsons assets test', () {
    expect(File(Jsons.peaks).existsSync(), isTrue);
  });
}
