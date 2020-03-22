import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

const _minWidth = 700 - 1;
const _minHeight = 700;
const _quality = 70;

class ImageCompressor {
  const ImageCompressor();
  Future<List<int>> compress(File file) {
    return FlutterImageCompress.compressWithFile(
      file.path,
      minWidth: _minWidth,
      minHeight: _minHeight,
      quality: _quality,
    );
  }

  Future<List<int>> compressWithList(List<int> image) {
    return FlutterImageCompress.compressWithList(
      image,
      minWidth: _minWidth,
      minHeight: _minHeight,
      quality: _quality,
    );
  }
}
