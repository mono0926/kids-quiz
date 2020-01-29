import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Uploader {
  Uploader({
    @required this.locator,
  });

  final Locator locator;
//  Downloader get _downloader => locator<Downloader>();

  // TODO(mono): 元画像がJPEG前提になっている
  Future<String> uploadImageData({
    @required String name,
    @required List<int> data,
  }) async {
    final ref =
        FirebaseStorage.instance.ref().child('images/$name-${Uuid().v4()}.jpg');
    await ref
        .putData(
          Uint8List.fromList(data),
          StorageMetadata(
            cacheControl: 'public, max-age=31536000',
            contentType: 'image/jpeg',
          ),
        )
        .onComplete;
    final url = await ref.getDownloadURL() as String;
    logger.info('url: $url');
    return url;
  }

  Future<String> uploadImageFile({
    @required String name,
    @required File file,
  }) async {
    final ref =
        FirebaseStorage.instance.ref().child('images/$name-${Uuid().v4()}.jpg');
    await ref
        .putFile(
          file,
          StorageMetadata(
            cacheControl: 'public, max-age=31536000',
            contentType: 'image/jpeg',
          ),
        )
        .onComplete;
    final url = await ref.getDownloadURL() as String;
    logger.info('url: $url');
    return url;
  }

//  Future<String> uploadImageUrl({
//    @required Uri url,
//  }) async {
//    final data = await downloader.download(url);
//    final uploadedUrl = await uploadImageData(
//      data: data,
//    );
//    return uploadedUrl;
//  }
}

class UploadingImage {
  UploadingImage({
    this.url,
    this.file,
  });

  final String url;
  final File file;

  bool get isUploading => url == null && file != null;

  UploadingImage copyWith({String url, File file}) {
    return UploadingImage(
      url: url ?? this.url,
      file: file ?? this.file,
    );
  }
}
