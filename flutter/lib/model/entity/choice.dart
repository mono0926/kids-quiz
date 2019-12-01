import 'package:flutter/foundation.dart';

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
