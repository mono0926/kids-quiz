import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidsquiz/features/quiz/quiz_speech_service.dart';
import 'package:kidsquiz/model/model.dart';

final quizProvider = StateNotifierProvider<QuizNotifier, AsyncValue<Quiz>>(
  (ref) => QuizNotifier(ref.read),
);

class QuizNotifier extends StateNotifier<AsyncValue<Quiz>> {
  QuizNotifier(this._read) : super(const AsyncLoading()) {
    next();
  }

  final Reader _read;

  Future<void> next() async {
    final choices = List.of(await _read(choicesProvider.future))..shuffle();
    assert(choices.length >= 4);
    final choice = choices.first;
    if (choice == state.value?.correctChoice) {
      await next();
      return;
    }
    final quiz = Quiz(
      correctChoice: choice,
      choices: choices
          .where((c) => c.entity.group == choice.entity.group)
          .toList()
          .getRange(0, 4)
          .toList()
        ..shuffle(),
    );
    state = AsyncData(quiz);
    _read(quizSpeechServiceProvider).speech();
  }
}
