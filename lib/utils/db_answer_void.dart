import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_answer_void.freezed.dart';
@freezed
class DbAnswerVoid  with _$DbAnswerVoid{
  const factory DbAnswerVoid.success() = _Succsess;
  const factory DbAnswerVoid.failure({Object? error}) = _Failure;
}