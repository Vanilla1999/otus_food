import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_answer_four.freezed.dart';
@Freezed(genericArgumentFactories: true)
class DbAnswer4 <T,B,C,D> with _$DbAnswer4<T,B,C,D>{
  const factory DbAnswer4.success({required List<T> listOne,required List<B> listTwo,required List<C> listThree,required List<D> listFour}) = _Succsess;
  const factory DbAnswer4.failure({Object? error}) = _Failure;
}