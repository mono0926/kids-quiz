import 'package:flutter/cupertino.dart';

import 'choice/choice.dart';

@immutable
class Quiz {
  const Quiz({
    @required this.choices,
    @required this.correctChoice,
  });
  final List<ChoiceDoc> choices;
  final ChoiceDoc correctChoice;
}

class GroupNames {
  static const animal = '動物';
  static const vehicle = '乗り物';
}
