import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_answer_three.freezed.dart';
@Freezed(genericArgumentFactories: true)
class DbAnswer3 <T,B,C> with _$DbAnswer3<T,B,C>{
  const factory DbAnswer3.success({required List<T> listOne,required List<B> listTwo,required List<C> listThree}) = _Succsess;
  const factory DbAnswer3.failure({Object? error}) = _Failure;
}