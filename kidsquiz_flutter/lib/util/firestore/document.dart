import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';

@freezed
class Document<E> with _$Document<E> {
  const factory Document(String? id, E entity) = _Document;
  const Document._();
}
