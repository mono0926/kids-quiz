import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final textToSpeechService = Provider((ref) => TextToSpeechService());

class TextToSpeechService {
  TextToSpeechService() {
    Future(() async {
      await Future.wait<void>(
        [
          _tts.setLanguage('ja-JP'),
          _tts.awaitSpeakCompletion(true),
        ],
      );
      _tts.completionHandler = () => _completed = true;
      _completer.complete();
    });
  }

  final _completer = Completer<void>();
  final _tts = FlutterTts();
  var _completed = true;

  Future<void> speak(String text) async {
    await _completer.future;
    if (!_completed) {
      await _tts.stop();
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    _completed = false;
    await _tts.speak(text);
  }
}
