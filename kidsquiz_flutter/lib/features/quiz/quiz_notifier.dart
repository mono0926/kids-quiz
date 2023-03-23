import 'package:kidsquiz/features/quiz/quiz_speech_service.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_notifier.g.dart';

@riverpod
class AsyncQuiz extends _$AsyncQuiz {
  @override
  Future<Quiz> build() async {
    final choices = List.of(await ref.watch(choicesProvider.future))..shuffle();
    assert(choices.length >= 4);
    final choice = choices.first;
    if (choice == state.value?.correctChoice) {
      return build();
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
    // ignore: unawaited_futures
    Future.microtask(() {
      ref.read(quizSpeechServiceProvider).speech();
    });
    return quiz;
  }

  Future<void> next() async {
    ref.invalidateSelf();
  }
}