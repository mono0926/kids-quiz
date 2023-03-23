import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

part 'text_to_speech_service.g.dart';

@riverpod
TextToSpeechService textToSpeechService(TextToSpeechServiceRef ref) =>
    TextToSpeechService();

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

@riverpod
class TtsBannerVisibility extends _$TtsBannerVisibility {
  @override
  bool build() {
    if (!kIsWeb) {
      return false;
    }
    final browser = Browser();
    if (browser.browserAgent != BrowserAgent.Chrome) {
      return true;
    }
    final platform = defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.iOS:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
        return false;
    }
  }

  void dismiss() {
    state = false;
  }
}
