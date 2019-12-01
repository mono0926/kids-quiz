import 'dart:async';

import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class SpeechService {
  SpeechService() {
    _initialize();
  }

  final _completer = Completer<void>();

  Future<void> _initialize() async {
    await _speechController.init();
    await _speechController.setLanguage('ja-JP');
    _completer.complete();
  }

  Future<void> speak(String text) async {
    await _completer.future;
    await _speechController.stop();
    await _speechController.speak(text, const VoiceControllerOptions());
  }

  final _speechController = FlutterTextToSpeech.instance.voiceController();
}
