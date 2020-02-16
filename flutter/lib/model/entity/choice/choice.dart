import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kids_quiz/model/model.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
abstract class Choice with _$Choice {
  const factory Choice({
    @required @nullable String name,
    @required @nullable String imageUrl,
    @required @nullable String group,
    @timestampJsonKey DateTime createdAt,
    @timestampJsonKey DateTime updatedAt,
  }) = _Choice;
  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  static const minNumber = 4;
}

final CollectionRef<Choice, Document<Choice>> choicesRef = CollectionRef(
  Firestore.instance.collection('choices'),
  decoder: (snap) => Document(
    snap.documentID,
    Choice.fromJson(snap.data),
  ),
  encoder: (entity) => replacingTimestamp(
    json: entity.toJson(),
    createdAt: entity.createdAt,
  ),
);
