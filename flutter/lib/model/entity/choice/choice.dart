import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

export 'choice_doc.dart';
export 'choices_ref.dart';

part 'choice.g.dart';

@immutable
@JsonSerializable()
class Choice with Entity, HasTimestamp {
  Choice({
    @required this.name,
    @required this.imageUrl,
    @required this.group,
    this.createdAt,
    this.updatedAt,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        ..._$ChoiceToJson(this)..remove(TimestampField.createdAt),
        ...timestampJson,
      };

  final String name;
  final String imageUrl;
  final String group;
  @override
  @timestampJsonKey
  final DateTime createdAt;
  @override
  @timestampJsonKey
  final DateTime updatedAt;

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
