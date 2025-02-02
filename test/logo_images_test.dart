import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('logo_images assets test', () {
    expect(File(LogoImages.appLogo).existsSync(), isTrue);
  });
}
