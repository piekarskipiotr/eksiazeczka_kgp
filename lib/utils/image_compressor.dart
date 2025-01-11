import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressor {
  static Future<Uint8List> compressFile(XFile image) async {
    final bytes = await image.readAsBytes();
    return FlutterImageCompress.compressWithList(
      bytes,
      minHeight: 1280,
      minWidth: 720,
    );
  }
}
