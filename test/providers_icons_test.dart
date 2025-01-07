import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

void main() {
  test('providers_icons assets test', () {
    expect(File(ProvidersIcons.apple).existsSync(), isTrue);
    expect(File(ProvidersIcons.google).existsSync(), isTrue);
  });
}
