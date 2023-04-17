import 'package:freezed_annotation/freezed_annotation.dart';
part 'db_answer.freezed.dart';
@Freezed(genericArgumentFactories: true)
class DbAnswer <T> with _$DbAnswer<T>{
  const factory DbAnswer.success({required List<T> list}) = _Succsess;
  const factory DbAnswer.failure({Object? error}) = _Failure;
}