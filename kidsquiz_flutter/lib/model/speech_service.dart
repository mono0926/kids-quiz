import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

class SpeechService {
  SpeechService() {
    _initialize();
  }

  final _completer = Completer<void>();

  Future<void> _initialize() async {
    await _tts.setLanguage('ja-JP');
    _completer.complete();
  }

  Future<void> speak(String text) async {
    await _completer.future;
    await _tts.stop();
    await _tts.speak(text);
  }

  final _tts = FlutterTts();
}
