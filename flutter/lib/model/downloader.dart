import 'dart:typed_data';

import 'package:http/http.dart' as http;

class Downloader {
  Future<Uint8List> download(Uri url) async {
    final response = await http.get(url);
    return response.bodyBytes;
  }
}
