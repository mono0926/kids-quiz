// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Choice _$_$_ChoiceFromJson(Map<String, dynamic> json) {
  return _$_Choice(
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    group: json['group'] as String,
    createdAt:
        const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    updatedAt:
        const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
  );
}

Map<String, dynamic> _$_$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'group': instance.group,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
