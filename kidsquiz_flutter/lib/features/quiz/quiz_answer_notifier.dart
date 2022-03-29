import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kidsquiz/features/quiz/quiz_result_page.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/router.dart';
import 'package:kidsquiz/util/util.dart';

import 'quiz_notifier.dart';

part 'quiz_answer_notifier.freezed.dart';

final quizAnswerProvider =
    StateNotifierProvider.autoDispose<QuizAnswerNotifier, QuizAnswerState>(
  (ref) => QuizAnswerNotifier(ref.read),
);

class QuizAnswerNotifier extends StateNotifier<QuizAnswerState> {
  QuizAnswerNotifier(this._read) : super(const QuizAnswerState());
  final Reader _read;

  Future<void> select(Document<Choice> choice) async {
    final quiz = _read(quizProvider).value!;
    final correct = quiz.correctChoice == choice;
    logger.info('correct: $correct');
    // ignore: unawaited_futures
    _read(textToSpeechService).speak(
      correct
          ? 'あたり！すごいねー！${choice.entity.name}だねー'
          : 'それは${choice.entity.name}だよ、'
              '${quiz.correctChoice.entity.name} を選んでね',
    );

    if (correct) {
      _read(audioPlayerProvider).play('cheer.mp3');
      _read(routerProvider).goNamed(QuizResultPage.routeName);
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
  }) = _QuizAnswerState;
  const QuizAnswerState._();
}
