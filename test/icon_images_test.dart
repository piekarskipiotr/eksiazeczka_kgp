import 'dart:io';

import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('icon_images assets test', () {
    expect(File(IconImages.checkCircle).existsSync(), isTrue);
    expect(File(IconImages.landscape).existsSync(), isTrue);
    expect(File(IconImages.landscapeFilled).existsSync(), isTrue);
    expect(File(IconImages.medals).existsSync(), isTrue);
    expect(File(IconImages.medalsFilled).existsSync(), isTrue);
    expect(File(IconImages.menu).existsSync(), isTrue);
    expect(File(IconImages.menuFilled).existsSync(), isTrue);
    expect(File(IconImages.sort).existsSync(), isTrue);
  });
}
