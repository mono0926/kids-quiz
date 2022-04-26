import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

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

final ttsBannerVisibilityProvider =
    StateNotifierProvider<TtsBannerVisibilityNotifier, bool>(
  (ref) => TtsBannerVisibilityNotifier(),
);

class TtsBannerVisibilityNotifier extends StateNotifier<bool> {
  TtsBannerVisibilityNotifier() : super(false) {
    if (!kIsWeb) {
      return;
    }
    final browser = Browser();
    if (browser.browserAgent != BrowserAgent.Chrome) {
      state = true;
      return;
    }
    final platform = defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.iOS:
        state = true;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
        break;
    }
  }

  void dismiss() {
    state = false;
  }
}
