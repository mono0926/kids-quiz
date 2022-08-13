import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kidsquiz/model/model.dart';
import 'package:kidsquiz/util/util.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required List<Document<Choice>> choices,
    required Document<Choice> correctChoice,
  }) = _Quiz;
  const Quiz._();
}

class GroupNames {
  static const animal = '動物';
  static const vehicle = '乗り物';
}
