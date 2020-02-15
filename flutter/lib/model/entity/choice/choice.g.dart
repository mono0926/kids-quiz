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
    createdAt: dateFromTimestampValue(json['createdAt']),
    updatedAt: dateFromTimestampValue(json['updatedAt']),
  );
}

Map<String, dynamic> _$_$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'group': instance.group,
      'createdAt': timestampFromDateValue(instance.createdAt),
      'updatedAt': timestampFromDateValue(instance.updatedAt),
    };
