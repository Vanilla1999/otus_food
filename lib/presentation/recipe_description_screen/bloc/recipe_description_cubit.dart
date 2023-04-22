import 'package:bloc/bloc.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/domain/get_ingredients_cooking_steps_by_recypeId_usecase.dart';
import 'package:otus_food/main.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState> {
  RecipeDescriptionCubit() : super(const RecipeDescriptionState.loading());
  GetIngredientsCookingStepsByRecypeId getIngredientsCookingStepsByRecypeId =
      getIt<GetIngredientsCookingStepsByRecypeId>();
  Recipe? _recipe;
  List<Ingredient> _ingredients = [];
  List<CookingStep> _cookingStreps = [];
  List<Comment> _comments = [];

  Future<void> initialData(Recipe recipe) async {
    final result = await getIngredientsCookingStepsByRecypeId
        .getIngridientsCookingStepByRecipeId(recipe.id);
    result.when(
        success: (ingredients, cookingSteps, comments, accounts) {
          _recipe = recipe;
          _ingredients = ingredients;
          _cookingStreps = cookingSteps;
          _comments.addAll(comments);
          emit(RecipeDescriptionState.successPrepareCooking(
              recipe: recipe,
              ingredients: ingredients,
              cookingSteps: cookingSteps,
              comments: comments,
              accounts: accounts));
        },
        failure: (error) => emit(RecipeDescriptionState.failure(error: error)));
  }

  void startCooking() {
    emit(RecipeDescriptionState.successStartCooking(
        recipe: _recipe!,
        ingredients: _ingredients,
        cookingSteps: _cookingStreps));
  }

  Future<void> addNewComment(String comment, String img) async {
    //save to bd/sendToNetwork
    _comments.add(Comment(
        id: 0,
        recipeId: 0,
        accountId: 1,
        text: comment,
        time: DateTime.now().millisecondsSinceEpoch,
        img: img));
    emit(RecipeDescriptionState.addNewComment(comments: _comments.toList()));
  }
}
