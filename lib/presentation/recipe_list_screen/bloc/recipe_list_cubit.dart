import 'package:bloc/bloc.dart';
import 'package:otus_food/data/repository/recipe_repo.dart';
import 'package:otus_food/domain/recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';
import 'package:otus_food/utils/db_answer.dart';

class RecipeListCubit extends Cubit<RecipeListState>{
  RecipeListCubit(): super(const RecipeListState.loading());

  final RecipeUseCase recipeUseCase = getIt<RecipeUseCase>();

  void initialData(){
   recipeUseCase.getRecipes().map(
       success: (recipeList)=> emit(RecipeListState.success(recipeList: recipeList.recipeList)),
       failure: (error)=>emit(RecipeListState.failure(error: error.error)));
  }

}