import 'package:kidsquiz/features/quiz/quiz_speech_service.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated_quiz.g.dart';

@riverpod
class GeneratedQuiz extends _$GeneratedQuiz {
  @override
  Future<Quiz> build() async {
    final choices = List.of(await ref.watch(choicesProvider.future))..shuffle();
    assert(choices.length >= 4);
    final choice = choices.first;
    if (choice == state.value?.correctChoice) {
      return build();
    }
    // ignore: unawaited_futures
    Future.microtask(() {
      ref.read(quizSpeechServiceProvider).speech();
    });
    return Quiz(
      correctChoice: choice,
      choices: choices
          .where((c) => c.entity.group == choice.entity.group)
          .toList()
          .getRange(0, 4)
          .toList()
        ..shuffle(),
    );
  }

  Future<void> next() async {
    ref.invalidateSelf();
  }
}
