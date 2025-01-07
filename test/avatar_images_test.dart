import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';

void main() {
  test('avatar_images assets test', () {
    expect(File(AvatarImages.def).existsSync(), isTrue);
  });
}
