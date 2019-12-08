import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:mono_kit/mono_kit.dart';

class QuizEditModel with ChangeNotifier {
  QuizEditModel({@required this.observer}) {
    _choicesByCategory = _groupByCategory(observer.choices.value);
    _sh.add(
      observer.choices.listen((choices) {
        _choicesByCategory = _groupByCategory(choices);
        notifyListeners();
      }),
    );
  }
  Map<String, List<ChoiceDoc>> _choicesByCategory;
  Map<String, List<ChoiceDoc>> get choicesByCategory => _choicesByCategory;
  final ChoicesObserver observer;
  final _sh = SubscriptionHolder();

  static Map<String, List<ChoiceDoc>> _groupByCategory(
          List<ChoiceDoc> choices) =>
      groupBy(choices, (x) => x.entity.group);

  @override
  void dispose() {
    _sh.dispose();

    super.dispose();
  }
}
