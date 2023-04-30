import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'account_screen_state.freezed.dart';
@freezed
class AccountScreenState with _$AccountScreenState {
  const factory AccountScreenState.loading() = _Loading;
  const factory AccountScreenState.authorized({required Account account}) = _Authorized;
  const factory AccountScreenState.confirmation() = _Confirmation;
  const factory AccountScreenState.notAuthorized() = _NotAuthorized;
  const factory AccountScreenState.failure({Object? error}) = _Failure;
}