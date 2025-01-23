import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';

void main() {
  test('jsons assets test', () {
    expect(File(Jsons.peaks).existsSync(), isTrue);
  });
}
