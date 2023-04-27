import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/model/ingredient.dart';


part 'ingredient_hive.freezed.dart';
part 'ingredient_hive.g.dart';


@freezed
class IngredientHive with _$IngredientHive {
  @HiveType(typeId: 2)
  factory IngredientHive({
    @HiveField(0)required int recipeId,
    @HiveField(1)required String name,
    @HiveField(2)required String amount,
  }) = _IngredientHive;
}
extension DbToModel on IngredientHive {
  Ingredient toModel() {
    return Ingredient(
        recipeId: recipeId,
        name:name,
        amount: amount);
  }
}