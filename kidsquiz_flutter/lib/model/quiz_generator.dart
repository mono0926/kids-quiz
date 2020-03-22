import 'package:flutter/cupertino.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:provider/provider.dart';

class QuizGenerator {
  QuizGenerator({
    @required this.locator,
  });

  QuizGenerator.samples({
    @required Locator locator,
  }) : this(locator: locator);

  final Locator locator;
  ChoicesObserver get _observer => locator();
  Quiz _quiz;
  Quiz get quiz => _quiz;
  List<Document<Choice>> choices = [];

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

  Document<Choice> _decideCorrectChoice() {
    choices = List<Document<Choice>>.from(_observer.choices.value)..shuffle();
    final choice = choices.first;
    return choice == _quiz?.correctChoice ? _decideCorrectChoice() : choice;
  }
}
