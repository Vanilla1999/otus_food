import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    required int id,
    required String name,
    required int time,
    required List<Ingredient> ingredients,
    required List<CookingStep> cookingSteps,
    required String img,
  }) = _Recipe;
}

extension ModelToDb on Recipe {
  RecipeHive toDb() {
    return RecipeHive(
        id: id,
        name: name,
        time: time,
        ingredients: ingredients.map((e) => e.toDb()).toList(),
        cookingSteps: cookingSteps.map((e) => e.toDb()).toList(),
        img: img);
  }
}
