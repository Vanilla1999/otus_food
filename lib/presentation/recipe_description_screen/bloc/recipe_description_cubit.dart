import 'package:bloc/bloc.dart';
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

  Future<void> initialData(Recipe recipe) async {
    final result = await getIngredientsCookingStepsByRecypeId
        .getIngridientsCookingStepByRecipeId(recipe.id);
    result.when(
        success: (ingredients, cookingSteps) {
          _recipe = recipe;
          _ingredients = ingredients;
          _cookingStreps = cookingSteps;
          emit(RecipeDescriptionState.successPrepareCooking(
              recipe: recipe,
              ingredients: ingredients,
              cookingSteps: cookingSteps));
        },
        failure: (error) => emit(RecipeDescriptionState.failure(error: error)));
  }

  void startCooking() {
    emit(RecipeDescriptionState.successStartCooking(
        recipe: _recipe!,
        ingredients: _ingredients,
        cookingSteps: _cookingStreps));
  }
}
