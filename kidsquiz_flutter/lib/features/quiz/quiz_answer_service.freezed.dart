// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_answer_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizAnswerStateTearOff {
  const _$QuizAnswerStateTearOff();

  _QuizAnswerState call(
      {Set<Document<Choice>> incorrectChoices = const <Document<Choice>>{}}) {
    return _QuizAnswerState(
      incorrectChoices: incorrectChoices,
    );
  }
}

/// @nodoc
const $QuizAnswerState = _$QuizAnswerStateTearOff();

/// @nodoc
mixin _$QuizAnswerState {
  Set<Document<Choice>> get incorrectChoices =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizAnswerStateCopyWith<QuizAnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerStateCopyWith<$Res> {
  factory $QuizAnswerStateCopyWith(
          QuizAnswerState value, $Res Function(QuizAnswerState) then) =
      _$QuizAnswerStateCopyWithImpl<$Res>;
  $Res call({Set<Document<Choice>> incorrectChoices});
}

/// @nodoc
class _$QuizAnswerStateCopyWithImpl<$Res>
    implements $QuizAnswerStateCopyWith<$Res> {
  _$QuizAnswerStateCopyWithImpl(this._value, this._then);

  final QuizAnswerState _value;
  // ignore: unused_field
  final $Res Function(QuizAnswerState) _then;

  @override
  $Res call({
    Object? incorrectChoices = freezed,
  }) {
    return _then(_value.copyWith(
      incorrectChoices: incorrectChoices == freezed
          ? _value.incorrectChoices
          : incorrectChoices // ignore: cast_nullable_to_non_nullable
              as Set<Document<Choice>>,
    ));
  }
}

/// @nodoc
abstract class _$QuizAnswerStateCopyWith<$Res>
    implements $QuizAnswerStateCopyWith<$Res> {
  factory _$QuizAnswerStateCopyWith(
          _QuizAnswerState value, $Res Function(_QuizAnswerState) then) =
      __$QuizAnswerStateCopyWithImpl<$Res>;
  @override
  $Res call({Set<Document<Choice>> incorrectChoices});
}

/// @nodoc
class __$QuizAnswerStateCopyWithImpl<$Res>
    extends _$QuizAnswerStateCopyWithImpl<$Res>
    implements _$QuizAnswerStateCopyWith<$Res> {
  __$QuizAnswerStateCopyWithImpl(
      _QuizAnswerState _value, $Res Function(_QuizAnswerState) _then)
      : super(_value, (v) => _then(v as _QuizAnswerState));

  @override
  _QuizAnswerState get _value => super._value as _QuizAnswerState;

  @override
  $Res call({
    Object? incorrectChoices = freezed,
  }) {
    return _then(_QuizAnswerState(
      incorrectChoices: incorrectChoices == freezed
          ? _value.incorrectChoices
          : incorrectChoices // ignore: cast_nullable_to_non_nullable
              as Set<Document<Choice>>,
    ));
  }
}

/// @nodoc

class _$_QuizAnswerState extends _QuizAnswerState {
  const _$_QuizAnswerState({this.incorrectChoices = const <Document<Choice>>{}})
      : super._();

  @JsonKey()
  @override
  final Set<Document<Choice>> incorrectChoices;

  @override
  String toString() {
    return 'QuizAnswerState(incorrectChoices: $incorrectChoices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizAnswerState &&
            const DeepCollectionEquality()
                .equals(other.incorrectChoices, incorrectChoices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(incorrectChoices));

  @JsonKey(ignore: true)
  @override
  _$QuizAnswerStateCopyWith<_QuizAnswerState> get copyWith =>
      __$QuizAnswerStateCopyWithImpl<_QuizAnswerState>(this, _$identity);
}

abstract class _QuizAnswerState extends QuizAnswerState {
  const factory _QuizAnswerState({Set<Document<Choice>> incorrectChoices}) =
      _$_QuizAnswerState;
  const _QuizAnswerState._() : super._();

  @override
  Set<Document<Choice>> get incorrectChoices;
  @override
  @JsonKey(ignore: true)
  _$QuizAnswerStateCopyWith<_QuizAnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}
