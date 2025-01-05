import 'dart:io';

import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('providers_icon_images assets test', () {
    expect(File(ProvidersIconImages.apple).existsSync(), isTrue);
    expect(File(ProvidersIconImages.google).existsSync(), isTrue);
  });
}
