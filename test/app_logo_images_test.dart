import 'dart:io';

import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app_logo_images assets test', () {
    expect(File(AppLogoImages.appLogoDark).existsSync(), isTrue);
    expect(File(AppLogoImages.appLogoLight).existsSync(), isTrue);
  });
}
