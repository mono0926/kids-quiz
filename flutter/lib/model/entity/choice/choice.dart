import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';

export 'choice_doc.dart';
export 'choices_ref.dart';

@immutable
class Choice extends Entity {
  const Choice({
    @required this.name,
    @required this.imageUrl,
    @required this.group,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  Choice.fromJson(Map<String, dynamic> json)
      : this(
          name: json[ChoiceField.name] as String,
          imageUrl: json[ChoiceField.imageUrl] as String,
          group: json[ChoiceField.group] as String,
          createdAt: parseCreatedAt(json),
          updatedAt: parseUpdatedAt(json),
        );

  final String name;
  final String imageUrl;
  final String group;

  Map<String, dynamic> toJson() => <String, dynamic>{
        ChoiceField.name: name,
        ChoiceField.imageUrl: imageUrl,
        ChoiceField.group: group,
        ...timestampJson,
      };

  @override
  String toString() {
    return 'Choice{name: $name, group: $group}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Choice &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          group == other.group;

  @override
  int get hashCode => super.hashCode ^ name.hashCode ^ group.hashCode;

  static const minNumber = 4;
}

class ChoiceField {
  static const name = 'name';
  static const imageUrl = 'imageUrl';
  static const group = 'group';
}
