import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'recipe_description_state.freezed.dart';

@freezed
class RecipeDescriptionState with _$RecipeDescriptionState {
  const factory RecipeDescriptionState.loading() = _Loading;

  const factory RecipeDescriptionState.successStartCooking(
      {required Recipe recipe}) = _SuccsessStartCooking;

  const factory RecipeDescriptionState.successPrepareCooking(
      {required Recipe recipe,
      required List<Comment> comments}) = _SuccsessPrepareCooking;

  const factory RecipeDescriptionState.addNewComment(
      {required List<Comment> comments}) = _AddNewComment;

  const factory RecipeDescriptionState.failure({Object? error}) = _Failure;
}
