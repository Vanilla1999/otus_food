import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required int recipeId,
    required String name,
    required String amount,
  }) = _Ingredient;
}

extension ModelToDb on Ingredient {
  IngredientHive toDb() {
    return IngredientHive(recipeId: recipeId, name: name, amount: amount);
  }
}
