import 'package:flutter/cupertino.dart';
import 'package:kids_quiz/model/model.dart';

class QuizGenerator {
  QuizGenerator({
    @required this.observer,
  });

  QuizGenerator.samples({
    @required ChoicesObserver observer,
  }) : this(observer: observer);

  final ChoicesObserver observer;
  Quiz _quiz;
  Quiz get quiz => _quiz;
  List<ChoiceDoc> choices = [];

  Quiz generate() {
    final choice = _decideCorrectChoice();
    return _quiz = Quiz(
      choices: choices
          .where((c) => c.entity.group == choice.entity.group)
          .toList()
          .getRange(0, 4)
          .toList()
            ..shuffle(),
      correctChoice: choice,
    );
  }

  ChoiceDoc _decideCorrectChoice() {
    choices = List<ChoiceDoc>.from(observer.choices.value)..shuffle();
    final choice = choices.first;
    return choice == _quiz?.correctChoice ? _decideCorrectChoice() : choice;
  }
}
