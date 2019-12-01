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

  void speak(String text) async {
//    await Future<void>.delayed(Duration(seconds: 1));
//    await _initialize();
    await _completer.future;

    await _speechController.stop();
//    await Future<void>.delayed(Duration(seconds: 3));
    await _speechController.speak(text, const VoiceControllerOptions());
  }

  final _speechController = FlutterTextToSpeech.instance.voiceController();
}
