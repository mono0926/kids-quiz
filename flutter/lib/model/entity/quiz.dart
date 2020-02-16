import 'package:flutter/foundation.dart';

import 'choice/choice.dart';
import 'entity.dart';

@immutable
class Quiz {
  const Quiz({
    @required this.choices,
    @required this.correctChoice,
  });
  final List<Document<Choice>> choices;
  final Document<Choice> correctChoice;
}

class GroupNames {
  static const animal = '動物';
  static const vehicle = '乗り物';
}
