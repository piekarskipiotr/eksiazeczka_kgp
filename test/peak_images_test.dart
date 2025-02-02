import 'dart:io';

import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('peak_images assets test', () {
    expect(File(PeakImages.babiaGora).existsSync(), isTrue);
    expect(File(PeakImages.biskupiaKopa).existsSync(), isTrue);
    expect(File(PeakImages.chelmiec).existsSync(), isTrue);
    expect(File(PeakImages.czupel).existsSync(), isTrue);
    expect(File(PeakImages.jagodna).existsSync(), isTrue);
    expect(File(PeakImages.klodzkaGora).existsSync(), isTrue);
    expect(File(PeakImages.kowadlo).existsSync(), isTrue);
    expect(File(PeakImages.lackowa).existsSync(), isTrue);
    expect(File(PeakImages.lubomir).existsSync(), isTrue);
    expect(File(PeakImages.lysica).existsSync(), isTrue);
    expect(File(PeakImages.mogielica).existsSync(), isTrue);
    expect(File(PeakImages.orlica).existsSync(), isTrue);
    expect(File(PeakImages.radziejowa).existsSync(), isTrue);
    expect(File(PeakImages.rudawiec).existsSync(), isTrue);
    expect(File(PeakImages.rysy).existsSync(), isTrue);
    expect(File(PeakImages.skalnik).existsSync(), isTrue);
    expect(File(PeakImages.skopiec).existsSync(), isTrue);
    expect(File(PeakImages.skrzyczne).existsSync(), isTrue);
    expect(File(PeakImages.sleza).existsSync(), isTrue);
    expect(File(PeakImages.sniezka).existsSync(), isTrue);
    expect(File(PeakImages.snieznik).existsSync(), isTrue);
    expect(File(PeakImages.szczeliniecWielki).existsSync(), isTrue);
    expect(File(PeakImages.tarnica).existsSync(), isTrue);
    expect(File(PeakImages.turbacz).existsSync(), isTrue);
    expect(File(PeakImages.waligora).existsSync(), isTrue);
    expect(File(PeakImages.wielkaSowa).existsSync(), isTrue);
    expect(File(PeakImages.wysoka).existsSync(), isTrue);
    expect(File(PeakImages.wysokaKopa).existsSync(), isTrue);
  });
}
