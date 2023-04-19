import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'recipe_description_state.freezed.dart';

@freezed
class RecipeDescriptionState with _$RecipeDescriptionState {
  const factory RecipeDescriptionState.loading() = _Loading;

  const factory RecipeDescriptionState.successStartCooking(
      {required Recipe recipe,
      required List<Ingredient> ingredients,
      required List<CookingStep> cookingSteps}) = _SuccsessStartCooking;

  const factory RecipeDescriptionState.successPrepareCooking(
      {required Recipe recipe,
      required List<Ingredient> ingredients,
      required List<CookingStep> cookingSteps}) = _SuccsessPrepareCooking;

  const factory RecipeDescriptionState.failure({Object? error}) = _Failure;
}
