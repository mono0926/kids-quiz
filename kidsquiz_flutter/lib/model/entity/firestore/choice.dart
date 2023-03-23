import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_converter_helper/json_converter_helper.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
class Choice with _$Choice {
  @allJsonConvertersSerializable
  const factory Choice({
    required String name,
    required String imageUrl,
    required String group,
    @Default(UnionTimestamp.serverTimestamp()) UnionTimestamp createdAt,
    @UnionTimestampConverter.alwaysServerTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp updatedAt,
  }) = _Choice;
  factory Choice.fromJson(JsonMap json) => _$ChoiceFromJson(json);

  static const minNumber = 4;
}
