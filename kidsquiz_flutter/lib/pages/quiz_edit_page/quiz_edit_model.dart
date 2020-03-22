import 'package:collection/collection.dart';

import 'package:flutter/foundation.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class QuizEditModel with ChangeNotifier {
  QuizEditModel({
    @required this.locator,
  }) {
    _choicesByGroup = _groupByGroup(observer.choices.value);
    _sh.add(
      observer.choices.listen((choices) {
        _choicesByGroup = _groupByGroup(choices);
        notifyListeners();
      }),
    );
  }
  Map<String, List<Document<Choice>>> _choicesByGroup;
  Map<String, List<Document<Choice>>> get choicesByGroup => _choicesByGroup;
  final Locator locator;
  ChoicesObserver get observer => locator();
  final _sh = SubscriptionHolder();

  static Map<String, List<Document<Choice>>> _groupByGroup(
          List<Document<Choice>> choices) =>
      groupBy(choices, (x) => x.entity.group);

  @override
  void dispose() {
    _sh.dispose();

    super.dispose();
  }
}
