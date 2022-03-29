import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_converter.freezed.dart';

// TODO(mono): firestore_refに移す？JsonConverterだけまとめたパッケージにするのが良さそう。
class FirTimestampConverter implements JsonConverter<FirTimestamp, Object> {
  const FirTimestampConverter();

  @override
  FirTimestamp fromJson(Object json) {
    return FirTimestamp.dateTime((json as Timestamp).toDate());
  }

  @override
  Object toJson(FirTimestamp object) => object.map(
        dateTime: (date) => Timestamp.fromDate(date.date),
        serverTimestamp: (_) => FieldValue.serverTimestamp(),
      );
}

class NullableFirTimestampConverter
    implements JsonConverter<FirTimestamp?, Object?> {
  const NullableFirTimestampConverter();

  @override
  FirTimestamp? fromJson(Object? json) {
    final timestamp = json as Timestamp?;
    return timestamp == null ? null : FirTimestamp.dateTime(timestamp.toDate());
  }

  @override
  Object? toJson(FirTimestamp? object) => object?.map(
        dateTime: (date) => Timestamp.fromDate(date.date),
        serverTimestamp: (_) => FieldValue.serverTimestamp(),
      );
}

@freezed
class FirTimestamp with _$FirTimestamp {
  const factory FirTimestamp.dateTime(DateTime date) = FirDateTime;
  const factory FirTimestamp.serverTimestamp() = FirServerTimestamp;
  const FirTimestamp._();

  // lateにするとconstで無くなって困る
  DateTime? get date => mapOrNull(dateTime: (date) => date.date);
}

class NullableTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const NullableTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class TimestampField {
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}
