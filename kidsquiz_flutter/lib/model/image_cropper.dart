import 'dart:io';

import 'package:image_cropper/image_cropper.dart' as cropper;
import 'package:image_cropper/image_cropper.dart';

class ImageCropper {
  const ImageCropper();

  Future<File> crop(File file) {
    return cropper.ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
    );
  }
}
