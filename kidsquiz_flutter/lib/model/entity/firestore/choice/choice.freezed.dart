// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
class _$ChoiceTearOff {
  const _$ChoiceTearOff();

  _Choice call(
      {required String name,
      required String imageUrl,
      required String group,
      @FirTimestampConverter()
          FirTimestamp createdAt = const FirTimestamp.serverTimestamp(),
      @FirTimestampConverter()
          FirTimestamp updatedAt = const FirTimestamp.serverTimestamp()}) {
    return _Choice(
      name: name,
      imageUrl: imageUrl,
      group: group,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Choice fromJson(Map<String, Object?> json) {
    return Choice.fromJson(json);
  }
}

/// @nodoc
const $Choice = _$ChoiceTearOff();

/// @nodoc
mixin _$Choice {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp get createdAt => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String imageUrl,
      String group,
      @FirTimestampConverter() FirTimestamp createdAt,
      @FirTimestampConverter() FirTimestamp updatedAt});

  $FirTimestampCopyWith<$Res> get createdAt;
  $FirTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res> implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  final Choice _value;
  // ignore: unused_field
  final $Res Function(Choice) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp,
    ));
  }

  @override
  $FirTimestampCopyWith<$Res> get createdAt {
    return $FirTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value));
    });
  }

  @override
  $FirTimestampCopyWith<$Res> get updatedAt {
    return $FirTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value));
    });
  }
}

/// @nodoc
abstract class _$ChoiceCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$ChoiceCopyWith(_Choice value, $Res Function(_Choice) then) =
      __$ChoiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String imageUrl,
      String group,
      @FirTimestampConverter() FirTimestamp createdAt,
      @FirTimestampConverter() FirTimestamp updatedAt});

  @override
  $FirTimestampCopyWith<$Res> get createdAt;
  @override
  $FirTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class __$ChoiceCopyWithImpl<$Res> extends _$ChoiceCopyWithImpl<$Res>
    implements _$ChoiceCopyWith<$Res> {
  __$ChoiceCopyWithImpl(_Choice _value, $Res Function(_Choice) _then)
      : super(_value, (v) => _then(v as _Choice));

  @override
  _Choice get _value => super._value as _Choice;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? group = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Choice(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choice with DiagnosticableTreeMixin implements _Choice {
  const _$_Choice(
      {required this.name,
      required this.imageUrl,
      required this.group,
      @FirTimestampConverter()
          this.createdAt = const FirTimestamp.serverTimestamp(),
      @FirTimestampConverter()
          this.updatedAt = const FirTimestamp.serverTimestamp()});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String group;
  @JsonKey()
  @override
  @FirTimestampConverter()
  final FirTimestamp createdAt;
  @JsonKey()
  @override
  @FirTimestampConverter()
  final FirTimestamp updatedAt;

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
        (other.runtimeType == runtimeType &&
            other is _Choice &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$ChoiceCopyWith<_Choice> get copyWith =>
      __$ChoiceCopyWithImpl<_Choice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceToJson(this);
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
      {required String name,
      required String imageUrl,
      required String group,
      @FirTimestampConverter() FirTimestamp createdAt,
      @FirTimestampConverter() FirTimestamp updatedAt}) = _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get group;
  @override
  @FirTimestampConverter()
  FirTimestamp get createdAt;
  @override
  @FirTimestampConverter()
  FirTimestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$ChoiceCopyWith<_Choice> get copyWith => throw _privateConstructorUsedError;
}
