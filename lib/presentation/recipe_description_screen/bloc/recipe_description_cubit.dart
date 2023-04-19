import 'package:bloc/bloc.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/domain/cooking_step_usecase.dart';
import 'package:otus_food/domain/get_ingredients_cooking_steps_by_recypeId_usecase.dart';
import 'package:otus_food/domain/ingredient_usecase.dart';
import 'package:otus_food/domain/recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState> {
  RecipeDescriptionCubit() : super(const RecipeDescriptionState.loading());
  GetIngredientsCookingStepsByRecypeId getIngredientsCookingStepsByRecypeId =
      getIt<GetIngredientsCookingStepsByRecypeId>();

  Future<void> initialData(Recipe recipe) async {
    final result = await getIngredientsCookingStepsByRecypeId
        .getIngridientsCookingStepByRecipeId(recipe.id);
    result.when(
        success: (ingredients,cookingSteps) => emit(
            RecipeDescriptionState.success(
                recipe: recipe,
                ingredients: ingredients,
                cookingSteps: cookingSteps)),
        failure: (error) =>
            emit(RecipeDescriptionState.failure(error: error)));
  }
  void startCooking(){

  }
}
