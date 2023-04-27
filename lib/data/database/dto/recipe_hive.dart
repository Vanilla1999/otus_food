import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'recipe_hive.freezed.dart';
part 'recipe_hive.g.dart';

@freezed
class RecipeHive with _$RecipeHive {
  @HiveType(typeId: 0)
  factory RecipeHive({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required int time,
    @HiveField(3) required List<IngredientHive> ingredients,
    @HiveField(4) required List<CookingStepHive> cookingSteps,
    @HiveField(5) required String img,
  }) = _RecipeHive;
}

extension DbToModel on RecipeHive {
  Recipe toModel() {
    return Recipe(
        id: id,
        name:name,
        time: time,
        ingredients: ingredients.map((e) => e.toModel()).toList(),
        cookingSteps: cookingSteps.map((e) => e.toModel()).toList(),
        img: img);
  }
}
