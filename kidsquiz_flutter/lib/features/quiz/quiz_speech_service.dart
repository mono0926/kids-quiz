import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/model/model.dart';

import 'quiz_notifier.dart';

final quizSpeechServiceProvider =
    Provider((ref) => QuizSpeechService(ref.read));

class QuizSpeechService {
  const QuizSpeechService(this._read);
  final Reader _read;

  void speech() {
    // TODO(mono): l10n
    _read(textToSpeechService).speak(
      '${_read(quizProvider).value!.correctChoice.entity.name}。はどれかな？',
    );
  }
}
