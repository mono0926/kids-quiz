import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'generated_quiz.dart';
part 'quiz_speech_service.g.dart';

@riverpod
QuizSpeechService quizSpeechService(QuizSpeechServiceRef ref) =>
    QuizSpeechService(ref);

class QuizSpeechService {
  const QuizSpeechService(this._ref);
  final Ref _ref;

  void speech() {
    // TODO(mono): l10n
    _ref.read(textToSpeechServiceProvider).speak(
          '${_ref.read(generatedQuizProvider).value!.correctChoice.entity.name}。はどれかな？',
        );
  }
}
