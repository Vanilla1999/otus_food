import 'package:bloc/bloc.dart';
import 'package:otus_food/domain/recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState>{
  RecipeDescriptionCubit(): super(const RecipeDescriptionState.loading());

  final RecipeUseCase recipeUseCase = getIt<RecipeUseCase>();

  void initialData(){
   recipeUseCase.getRecipes().map(
       success: (recipeList)=> emit(RecipeDescriptionState.success(recipeList: recipeList.recipeList)),
       failure: (error)=>emit(RecipeDescriptionState.failure(error: error.error)));
  }

}