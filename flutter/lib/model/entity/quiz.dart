import 'package:flutter/cupertino.dart';

@immutable
class Quiz {
  const Quiz({
    @required this.choices,
    @required this.correctChoice,
  });
  final List<Choice> choices;
  final Choice correctChoice;
}

@immutable
class Choice {
  const Choice({
    @required this.name,
    @required this.imageUrl,
    @required this.group,
  });

  final String name;
  final String imageUrl;
  final String group;
}

class GroupNames {
  static const animal = 'animal';
  static const vehicle = 'vehicle';
}
