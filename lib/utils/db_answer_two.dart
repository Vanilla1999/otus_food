import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_answer_two.freezed.dart';
@Freezed(genericArgumentFactories: true)
class DbAnswer2 <T,B> with _$DbAnswer2<T,B>{
  const factory DbAnswer2.success({required List<T> listOne,required List<B> listTwo}) = _Succsess;
  const factory DbAnswer2.failure({Object? error}) = _Failure;
}