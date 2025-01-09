import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

void main() {
  test('icon_images assets test', () {
    expect(File(IconImages.checkCircle).existsSync(), isTrue);
    expect(File(IconImages.error).existsSync(), isTrue);
    expect(File(IconImages.landscape).existsSync(), isTrue);
    expect(File(IconImages.landscapeFilled).existsSync(), isTrue);
    expect(File(IconImages.location).existsSync(), isTrue);
    expect(File(IconImages.locationError).existsSync(), isTrue);
    expect(File(IconImages.medal2).existsSync(), isTrue);
    expect(File(IconImages.medals).existsSync(), isTrue);
    expect(File(IconImages.medalsFilled).existsSync(), isTrue);
    expect(File(IconImages.menu).existsSync(), isTrue);
    expect(File(IconImages.menuFilled).existsSync(), isTrue);
    expect(File(IconImages.sort).existsSync(), isTrue);
  });
}
