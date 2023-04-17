import 'package:bloc/bloc.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/domain/cooking_step_usecase.dart';
import 'package:otus_food/domain/get_ingredients_cooking_steps_by_recypeId_usecase.dart';
import 'package:otus_food/domain/ingredient_usecase.dart';
import 'package:otus_food/domain/recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState>{
  RecipeDescriptionCubit(): super(const RecipeDescriptionState.loading());
  GetIngredientsCookingStepsByRecypeId getIngredientsCookingStepsByRecypeId = getIt<GetIngredientsCookingStepsByRecypeId>();
  void initialData(Recipe recipe){
    getIngredientsCookingStepsByRecypeId.getIngridientsCookingStepByRecipeId(recipe.id).map(
        success: (ingridientsCookingSteps)=> emit(RecipeDescriptionState.success(recipe:recipe,ingredients: ingridientsCookingSteps.listOne,cookingSteps: ingridientsCookingSteps.listTwo)),
        failure: (error)=>emit(RecipeDescriptionState.failure(error: error.error)));
  }

}