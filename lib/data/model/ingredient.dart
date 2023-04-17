import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required int recipeId,
    required String name,
    required String amount,
  }) = _Ingredient;
}