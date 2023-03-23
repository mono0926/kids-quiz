// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Document<E> {
  String? get id => throw _privateConstructorUsedError;
  E get entity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentCopyWith<E, Document<E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<E, $Res> {
  factory $DocumentCopyWith(
          Document<E> value, $Res Function(Document<E>) then) =
      _$DocumentCopyWithImpl<E, $Res, Document<E>>;
  @useResult
  $Res call({String? id, E entity});
}

/// @nodoc
class _$DocumentCopyWithImpl<E, $Res, $Val extends Document<E>>
    implements $DocumentCopyWith<E, $Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? entity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as E,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentCopyWith<E, $Res>
    implements $DocumentCopyWith<E, $Res> {
  factory _$$_DocumentCopyWith(
          _$_Document<E> value, $Res Function(_$_Document<E>) then) =
      __$$_DocumentCopyWithImpl<E, $Res>;
  @override
  @useResult
  $Res call({String? id, E entity});
}

/// @nodoc
class __$$_DocumentCopyWithImpl<E, $Res>
    extends _$DocumentCopyWithImpl<E, $Res, _$_Document<E>>
    implements _$$_DocumentCopyWith<E, $Res> {
  __$$_DocumentCopyWithImpl(
      _$_Document<E> _value, $Res Function(_$_Document<E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? entity = freezed,
  }) {
    return _then(_$_Document<E>(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$_Document<E> extends _Document<E> {
  const _$_Document(this.id, this.entity) : super._();

  @override
  final String? id;
  @override
  final E entity;

  @override
  String toString() {
    return 'Document<$E>(id: $id, entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Document<E> &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentCopyWith<E, _$_Document<E>> get copyWith =>
      __$$_DocumentCopyWithImpl<E, _$_Document<E>>(this, _$identity);
}

abstract class _Document<E> extends Document<E> {
  const factory _Document(final String? id, final E entity) = _$_Document<E>;
  const _Document._() : super._();

  @override
  String? get id;
  @override
  E get entity;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentCopyWith<E, _$_Document<E>> get copyWith =>
      throw _privateConstructorUsedError;
}
