import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/pages/result_page.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:provider/provider.dart';

class QuizNotifier with ChangeNotifier {
  QuizNotifier({
    @required this.locator,
  }) : _incorrectAnimations = List.generate(
          4,
          (_) => ShakeAnimation(tickerProvider: locator()),
        ) {
    next();
  }

  final Locator locator;
  QuizGenerator get quizGenerator => locator();
  SpeechService get speechService => locator();
  AppNavigator get navigator => locator();
  final List<ShakeAnimation> _incorrectAnimations;
  final Set<ChoiceDoc> _incorrectChoices = {};
  final _audioPlayer = AudioCache(prefix: 'sound/');

  Set<ChoiceDoc> get incorrectChoices => _incorrectChoices;
  Quiz get quiz => quizGenerator.quiz;

  String get _questionMessage =>
      '${quiz.correctChoice.entity.name}。$questionSuffix';
  String get questionSuffix => 'はどれかな？';

  void playQuestion() {
    speechService.speak(_questionMessage);
  }

  void next() {
    _incorrectChoices.clear();
    quizGenerator.generate();
    playQuestion();
  }

  ShakeAnimation incorrectAnimation(ChoiceDoc choice) =>
      _incorrectAnimations[quiz.choices.indexOf(choice)];

  Future<void> select(ChoiceDoc choice) async {
    final correct = quiz.correctChoice == choice;
    logger.info('correct: $correct');
    // ignore: unawaited_futures
    speechService.speak(
      correct
          ? 'あたり！すごいねー！${choice.entity.name}だねー'
          : 'それは${choice.entity.name}だよ、'
              '${quiz.correctChoice.entity.name} を選んでね',
    );

    if (correct) {
      // ignore: unawaited_futures
      _audioPlayer.play('cheer.mp3');
      await navigator.navigator.pushReplacementNamed(ResultPage.routeName);
    } else {
      final animation = incorrectAnimation(choice);
      await animation.controller.forward(from: 0);
      // TODO(mono): Staggered animationにしたい
      await animation.controller.reverse();
      if (_incorrectChoices.add(choice)) {
        notifyListeners();
      }
    }
  }
}

class ShakeAnimation {
  ShakeAnimation({@required TickerProvider tickerProvider})
      : controller = AnimationController(
          vsync: tickerProvider,
          duration: const Duration(milliseconds: 500),
        ) {
    animation =
        controller.drive(CurveTween(curve: Curves.elasticIn)).drive(Tween(
              begin: const Offset(0, 0),
              end: const Offset(0.2, 0),
            ));
  }
  final AnimationController controller;
  Animation<Offset> animation;
}
