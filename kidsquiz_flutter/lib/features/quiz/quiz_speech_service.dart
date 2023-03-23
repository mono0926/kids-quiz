import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/model/model.dart';

import 'quiz_notifier.dart';

final quizSpeechServiceProvider = Provider(
  QuizSpeechService.new,
);

class QuizSpeechService {
  const QuizSpeechService(this._ref);
  final Ref _ref;

  void speech() {
    // TODO(mono): l10n
    _ref.read(textToSpeechService).speak(
          '${_ref.read(asyncQuizProvider).value!.correctChoice.entity.name}。はどれかな？',
        );
  }
}
