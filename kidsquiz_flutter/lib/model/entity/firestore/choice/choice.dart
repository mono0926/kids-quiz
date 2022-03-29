import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kidsquiz/util/util.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
class Choice with _$Choice {
  const factory Choice({
    required String name,
    required String imageUrl,
    required String group,
    @Default(FirTimestamp.serverTimestamp())
    @FirTimestampConverter()
        FirTimestamp createdAt,
    @Default(FirTimestamp.serverTimestamp())
    @FirTimestampConverter()
        FirTimestamp updatedAt,
  }) = _Choice;
  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  static const minNumber = 4;
}
