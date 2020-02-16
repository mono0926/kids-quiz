// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package

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
  @timestampJsonKey
  DateTime get createdAt;
  @timestampJsonKey
  DateTime get updatedAt;

  Choice copyWith(
      {@nullable String name,
      @nullable String imageUrl,
      @nullable String group,
      @timestampJsonKey DateTime createdAt,
      @timestampJsonKey DateTime updatedAt});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Choice with DiagnosticableTreeMixin implements _Choice {
  _$_Choice(
      {@required @nullable this.name,
      @required @nullable this.imageUrl,
      @required @nullable this.group,
      @timestampJsonKey this.createdAt,
      @timestampJsonKey this.updatedAt});

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
  @timestampJsonKey
  final DateTime createdAt;
  @override
  @timestampJsonKey
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
      name.hashCode ^
      imageUrl.hashCode ^
      group.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

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
  factory _Choice(
      {@required @nullable String name,
      @required @nullable String imageUrl,
      @required @nullable String group,
      @timestampJsonKey DateTime createdAt,
      @timestampJsonKey DateTime updatedAt}) = _$_Choice;

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
  @timestampJsonKey
  DateTime get createdAt;
  @override
  @timestampJsonKey
  DateTime get updatedAt;

  @override
  _Choice copyWith(
      {@nullable String name,
      @nullable String imageUrl,
      @nullable String group,
      @timestampJsonKey DateTime createdAt,
      @timestampJsonKey DateTime updatedAt});
}
