import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kidsquiz/features/quiz/quiz_result_page.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/router.dart';
import 'package:kidsquiz/util/util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'quiz_notifier.dart';

part 'quiz_answer_notifier.freezed.dart';
part 'quiz_answer_notifier.g.dart';

@riverpod
class QuizAnswer extends _$QuizAnswer {
  @override
  QuizAnswerState build() => const QuizAnswerState();

  Future<void> select(Document<Choice> choice) async {
    final quiz = ref.read(generatedQuizProvider).requireValue;
    final correct = quiz.correctChoice == choice;
    logger.info('correct: $correct');
    // ignore: unawaited_futures
    ref.read(textToSpeechServiceProvider).speak(
          correct
              ? 'あたり！すごいねー！${choice.entity.name}だねー'
              : 'それは${choice.entity.name}だよ、'
                  '${quiz.correctChoice.entity.name} を選んでね',
        );

    if (correct) {
      ref.read(audioPlayerProvider).play('cheer.mp3');
      state = const QuizAnswerState().copyWith(
        correctChoice: choice,
      );
      QuizResultPage.push(ref.read(navigatorKey).currentContext!);
    } else {
      state = state.copyWith(
        incorrectChoices: {
          ...state.incorrectChoices,
          choice,
        },
      );
    }
  }
}

@freezed
class QuizAnswerState with _$QuizAnswerState {
  const factory QuizAnswerState({
    @Default(<Document<Choice>>{}) Set<Document<Choice>> incorrectChoices,
    Document<Choice>? correctChoice,
  }) = _QuizAnswerState;
  const QuizAnswerState._();
}
