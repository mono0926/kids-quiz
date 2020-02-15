import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
abstract class Choice with _$Choice {
  factory Choice({
    @required String name,
    @required String imageUrl,
    @required String group,
    @timestampJsonKey DateTime createdAt,
    @timestampJsonKey DateTime updatedAt,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  static const minNumber = 4;
}

class ChoiceField {
  static const name = 'name';
  static const imageUrl = 'imageUrl';
  static const group = 'group';
}

class ChoiceDoc extends Document<Choice> {
  const ChoiceDoc(
    String id,
    Choice entity,
  ) : super(
          id,
          entity,
        );
}

class ChoiceRef extends DocumentRef<Choice, ChoiceDoc> {
  const ChoiceRef({
    @required DocumentReference ref,
    @required DocumentDecoder<ChoiceDoc> decoder,
    @required EntityEncoder<Choice> encoder,
  }) : super(
          ref: ref,
          decoder: decoder,
          encoder: encoder,
        );
}

class ChoicesRef extends CollectionRef<Choice, ChoiceDoc> {
  ChoicesRef.ref()
      : super(
          ref: Firestore.instance.collection(collection),
          decoder: (snap) => ChoiceDoc(
            snap.documentID,
            Choice.fromJson(snap.data),
          ),
          encoder: (entity) => replacingTimestamp(
            json: entity.toJson(),
            createdAt: entity.createdAt,
          ),
        );

  static const collection = 'choices';

  @override
  ChoiceRef docRef([String id]) {
    return ChoiceRef(
      ref: docRefRaw(id),
      encoder: encoder,
      decoder: decoder,
    );
  }
}
