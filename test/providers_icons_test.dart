import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('providers_icons assets test', () {
    expect(File(ProvidersIcons.apple).existsSync(), isTrue);
    expect(File(ProvidersIcons.google).existsSync(), isTrue);
  });
}
