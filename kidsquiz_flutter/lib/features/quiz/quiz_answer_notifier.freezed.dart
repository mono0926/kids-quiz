// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizAnswerState {
  Set<Document<Choice>> get incorrectChoices =>
      throw _privateConstructorUsedError;
  Document<Choice>? get correctChoice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizAnswerStateCopyWith<QuizAnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerStateCopyWith<$Res> {
  factory $QuizAnswerStateCopyWith(
          QuizAnswerState value, $Res Function(QuizAnswerState) then) =
      _$QuizAnswerStateCopyWithImpl<$Res, QuizAnswerState>;
  @useResult
  $Res call(
      {Set<Document<Choice>> incorrectChoices,
      Document<Choice>? correctChoice});

  $DocumentCopyWith<Choice, $Res>? get correctChoice;
}

/// @nodoc
class _$QuizAnswerStateCopyWithImpl<$Res, $Val extends QuizAnswerState>
    implements $QuizAnswerStateCopyWith<$Res> {
  _$QuizAnswerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incorrectChoices = null,
    Object? correctChoice = freezed,
  }) {
    return _then(_value.copyWith(
      incorrectChoices: null == incorrectChoices
          ? _value.incorrectChoices
          : incorrectChoices // ignore: cast_nullable_to_non_nullable
              as Set<Document<Choice>>,
      correctChoice: freezed == correctChoice
          ? _value.correctChoice
          : correctChoice // ignore: cast_nullable_to_non_nullable
              as Document<Choice>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentCopyWith<Choice, $Res>? get correctChoice {
    if (_value.correctChoice == null) {
      return null;
    }

    return $DocumentCopyWith<Choice, $Res>(_value.correctChoice!, (value) {
      return _then(_value.copyWith(correctChoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizAnswerStateCopyWith<$Res>
    implements $QuizAnswerStateCopyWith<$Res> {
  factory _$$_QuizAnswerStateCopyWith(
          _$_QuizAnswerState value, $Res Function(_$_QuizAnswerState) then) =
      __$$_QuizAnswerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<Document<Choice>> incorrectChoices,
      Document<Choice>? correctChoice});

  @override
  $DocumentCopyWith<Choice, $Res>? get correctChoice;
}

/// @nodoc
class __$$_QuizAnswerStateCopyWithImpl<$Res>
    extends _$QuizAnswerStateCopyWithImpl<$Res, _$_QuizAnswerState>
    implements _$$_QuizAnswerStateCopyWith<$Res> {
  __$$_QuizAnswerStateCopyWithImpl(
      _$_QuizAnswerState _value, $Res Function(_$_QuizAnswerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incorrectChoices = null,
    Object? correctChoice = freezed,
  }) {
    return _then(_$_QuizAnswerState(
      incorrectChoices: null == incorrectChoices
          ? _value._incorrectChoices
          : incorrectChoices // ignore: cast_nullable_to_non_nullable
              as Set<Document<Choice>>,
      correctChoice: freezed == correctChoice
          ? _value.correctChoice
          : correctChoice // ignore: cast_nullable_to_non_nullable
              as Document<Choice>?,
    ));
  }
}

/// @nodoc

class _$_QuizAnswerState extends _QuizAnswerState {
  const _$_QuizAnswerState(
      {final Set<Document<Choice>> incorrectChoices =
          const <Document<Choice>>{},
      this.correctChoice})
      : _incorrectChoices = incorrectChoices,
        super._();

  final Set<Document<Choice>> _incorrectChoices;
  @override
  @JsonKey()
  Set<Document<Choice>> get incorrectChoices {
    if (_incorrectChoices is EqualUnmodifiableSetView) return _incorrectChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_incorrectChoices);
  }

  @override
  final Document<Choice>? correctChoice;

  @override
  String toString() {
    return 'QuizAnswerState(incorrectChoices: $incorrectChoices, correctChoice: $correctChoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizAnswerState &&
            const DeepCollectionEquality()
                .equals(other._incorrectChoices, _incorrectChoices) &&
            (identical(other.correctChoice, correctChoice) ||
                other.correctChoice == correctChoice));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_incorrectChoices), correctChoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizAnswerStateCopyWith<_$_QuizAnswerState> get copyWith =>
      __$$_QuizAnswerStateCopyWithImpl<_$_QuizAnswerState>(this, _$identity);
}

abstract class _QuizAnswerState extends QuizAnswerState {
  const factory _QuizAnswerState(
      {final Set<Document<Choice>> incorrectChoices,
      final Document<Choice>? correctChoice}) = _$_QuizAnswerState;
  const _QuizAnswerState._() : super._();

  @override
  Set<Document<Choice>> get incorrectChoices;
  @override
  Document<Choice>? get correctChoice;
  @override
  @JsonKey(ignore: true)
  _$$_QuizAnswerStateCopyWith<_$_QuizAnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}
