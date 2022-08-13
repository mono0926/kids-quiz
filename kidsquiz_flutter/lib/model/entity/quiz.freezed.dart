// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Quiz {
  List<Document<Choice>> get choices => throw _privateConstructorUsedError;
  Document<Choice> get correctChoice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res>;
  $Res call({List<Document<Choice>> choices, Document<Choice> correctChoice});

  $DocumentCopyWith<Choice, $Res> get correctChoice;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  final Quiz _value;
  // ignore: unused_field
  final $Res Function(Quiz) _then;

  @override
  $Res call({
    Object? choices = freezed,
    Object? correctChoice = freezed,
  }) {
    return _then(_value.copyWith(
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Document<Choice>>,
      correctChoice: correctChoice == freezed
          ? _value.correctChoice
          : correctChoice // ignore: cast_nullable_to_non_nullable
              as Document<Choice>,
    ));
  }

  @override
  $DocumentCopyWith<Choice, $Res> get correctChoice {
    return $DocumentCopyWith<Choice, $Res>(_value.correctChoice, (value) {
      return _then(_value.copyWith(correctChoice: value));
    });
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  $Res call({List<Document<Choice>> choices, Document<Choice> correctChoice});

  @override
  $DocumentCopyWith<Choice, $Res> get correctChoice;
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, (v) => _then(v as _$_Quiz));

  @override
  _$_Quiz get _value => super._value as _$_Quiz;

  @override
  $Res call({
    Object? choices = freezed,
    Object? correctChoice = freezed,
  }) {
    return _then(_$_Quiz(
      choices: choices == freezed
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Document<Choice>>,
      correctChoice: correctChoice == freezed
          ? _value.correctChoice
          : correctChoice // ignore: cast_nullable_to_non_nullable
              as Document<Choice>,
    ));
  }
}

/// @nodoc

class _$_Quiz extends _Quiz {
  const _$_Quiz(
      {required final List<Document<Choice>> choices,
      required this.correctChoice})
      : _choices = choices,
        super._();

  final List<Document<Choice>> _choices;
  @override
  List<Document<Choice>> get choices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final Document<Choice> correctChoice;

  @override
  String toString() {
    return 'Quiz(choices: $choices, correctChoice: $correctChoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quiz &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality()
                .equals(other.correctChoice, correctChoice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(correctChoice));

  @JsonKey(ignore: true)
  @override
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);
}

abstract class _Quiz extends Quiz {
  const factory _Quiz(
      {required final List<Document<Choice>> choices,
      required final Document<Choice> correctChoice}) = _$_Quiz;
  const _Quiz._() : super._();

  @override
  List<Document<Choice>> get choices;
  @override
  Document<Choice> get correctChoice;
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}