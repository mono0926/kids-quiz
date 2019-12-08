import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:mono_kit/mono_kit.dart';

class QuizEditModel with ChangeNotifier {
  QuizEditModel({@required this.observer}) {
    _choices = _toMap(observer.choices.value);
    _sh.add(
      observer.choices.listen((choices) {
        _choices = _toMap(choices);
        notifyListeners();
      }),
    );
  }
  Map<String, List<ChoiceDoc>> _choices;
  Map<String, List<ChoiceDoc>> get choicesByCategory => _choices;
  final ChoicesObserver observer;
  final _sh = SubscriptionHolder();

  static Map<String, List<ChoiceDoc>> _toMap(List<ChoiceDoc> choices) =>
      groupBy(choices, (x) => x.entity.group);

  void delete(ChoiceDoc doc) {
    ChoicesRef.ref().docRef(doc.id).ref.delete();
  }

  @override
  void dispose() {
    _sh.dispose();

    super.dispose();
  }
}
