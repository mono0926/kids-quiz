// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DocumentTearOff {
  const _$DocumentTearOff();

  _Document<E> call<E>(String? id, E entity) {
    return _Document<E>(
      id,
      entity,
    );
  }
}

/// @nodoc
const $Document = _$DocumentTearOff();

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
      _$DocumentCopyWithImpl<E, $Res>;
  $Res call({String? id, E entity});
}

/// @nodoc
class _$DocumentCopyWithImpl<E, $Res> implements $DocumentCopyWith<E, $Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  final Document<E> _value;
  // ignore: unused_field
  final $Res Function(Document<E>) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? entity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc
abstract class _$DocumentCopyWith<E, $Res>
    implements $DocumentCopyWith<E, $Res> {
  factory _$DocumentCopyWith(
          _Document<E> value, $Res Function(_Document<E>) then) =
      __$DocumentCopyWithImpl<E, $Res>;
  @override
  $Res call({String? id, E entity});
}

/// @nodoc
class __$DocumentCopyWithImpl<E, $Res> extends _$DocumentCopyWithImpl<E, $Res>
    implements _$DocumentCopyWith<E, $Res> {
  __$DocumentCopyWithImpl(
      _Document<E> _value, $Res Function(_Document<E>) _then)
      : super(_value, (v) => _then(v as _Document<E>));

  @override
  _Document<E> get _value => super._value as _Document<E>;

  @override
  $Res call({
    Object? id = freezed,
    Object? entity = freezed,
  }) {
    return _then(_Document<E>(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      entity == freezed
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
            other is _Document<E> &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$DocumentCopyWith<E, _Document<E>> get copyWith =>
      __$DocumentCopyWithImpl<E, _Document<E>>(this, _$identity);
}

abstract class _Document<E> extends Document<E> {
  const factory _Document(String? id, E entity) = _$_Document<E>;
  const _Document._() : super._();

  @override
  String? get id;
  @override
  E get entity;
  @override
  @JsonKey(ignore: true)
  _$DocumentCopyWith<E, _Document<E>> get copyWith =>
      throw _privateConstructorUsedError;
}
