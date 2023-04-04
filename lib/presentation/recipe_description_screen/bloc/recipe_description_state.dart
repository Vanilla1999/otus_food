import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/model/recipe.dart';
part 'recipe_description_state.freezed.dart';
@freezed
class RecipeDescriptionState with _$RecipeDescriptionState {
  const factory RecipeDescriptionState.loading() = _Loading;
  const factory RecipeDescriptionState.success({required List<Recipe> recipeList}) = _Succsess;
  const factory RecipeDescriptionState.failure({Object? error}) = _Failure;
}