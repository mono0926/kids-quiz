import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final textToSpeechService = Provider((ref) => TextToSpeechService());

class TextToSpeechService {
  TextToSpeechService() {
    Future(() async {
      await _tts.setLanguage('ja-JP');
      _completer.complete();
    });
  }

  final _completer = Completer<void>();
  final _tts = FlutterTts();

  Future<void> speak(String text) async {
    await _completer.future;
    await _tts.stop();
    await _tts.speak(text);
  }
}
