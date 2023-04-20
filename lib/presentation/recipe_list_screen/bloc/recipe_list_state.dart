import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'recipe_list_state.freezed.dart';
@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState.loading() = _Loading;
  const factory RecipeListState.success({required List<Recipe> recipeList}) = _Succsess;
  const factory RecipeListState.failure({Object? error}) = _Failure;
}