// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Choice _$$_ChoiceFromJson(Map json) => _$_Choice(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      group: json['group'] as String,
      createdAt: json['createdAt'] == null
          ? const FirTimestamp.serverTimestamp()
          : const FirTimestampConverter().fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const FirTimestamp.serverTimestamp()
          : const FirTimestampConverter().fromJson(json['updatedAt'] as Object),
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'group': instance.group,
      'createdAt': const FirTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const FirTimestampConverter().toJson(instance.updatedAt),
    };
