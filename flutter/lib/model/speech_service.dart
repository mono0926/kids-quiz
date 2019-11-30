import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class SpeechService {
  SpeechService() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _speechController.init();
    await _speechController.setLanguage('ja-JP');
  }

  void speak(String text) async {
    await _initialize();
//    await _speechController.stop();
    await _speechController.speak(text);
  }

  final _speechController = FlutterTextToSpeech.instance.voiceController();
}
