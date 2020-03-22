// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

mixin _$Choice {
  @nullable
  String get name;
  @nullable
  String get imageUrl;
  @nullable
  String get group;
  @TimestampConverter()
  DateTime get createdAt;
  @TimestampConverter()
  DateTime get updatedAt;

  Choice copyWith(
      {@nullable String name,
      @nullable String imageUrl,
      @nullable String group,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});

  Map<String, dynamic> toJson();
}

class _$ChoiceTearOff {
  const _$ChoiceTearOff();

  _Choice call(
      {@required @nullable String name,
      @required @nullable String imageUrl,
      @required @nullable String group,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt}) {
    return _Choice(
      name: name,
      imageUrl: imageUrl,
      group: group,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

const $Choice = _$ChoiceTearOff();

@JsonSerializable()
class _$_Choice with DiagnosticableTreeMixin implements _Choice {
  const _$_Choice(
      {@required @nullable this.name,
      @required @nullable this.imageUrl,
      @required @nullable this.group,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$_$_ChoiceFromJson(json);

  @override
  @nullable
  final String name;
  @override
  @nullable
  final String imageUrl;
  @override
  @nullable
  final String group;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Choice(name: $name, imageUrl: $imageUrl, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Choice'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Choice &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.group, group) ||
                const DeepCollectionEquality().equals(other.group, group)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(group) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$_Choice copyWith({
    Object name = freezed,
    Object imageUrl = freezed,
    Object group = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _$_Choice(
      name: name == freezed ? this.name : name as String,
      imageUrl: imageUrl == freezed ? this.imageUrl : imageUrl as String,
      group: group == freezed ? this.group : group as String,
      createdAt: createdAt == freezed ? this.createdAt : createdAt as DateTime,
      updatedAt: updatedAt == freezed ? this.updatedAt : updatedAt as DateTime,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChoiceToJson(this);
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
      {@required @nullable String name,
      @required @nullable String imageUrl,
      @required @nullable String group,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt}) = _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  @nullable
  String get name;
  @override
  @nullable
  String get imageUrl;
  @override
  @nullable
  String get group;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;

  @override
  _Choice copyWith(
      {@nullable String name,
      @nullable String imageUrl,
      @nullable String group,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}
