import 'package:bloc/bloc.dart';
import 'package:otus_food/domain/get_recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

class RecipeListCubit extends Cubit<RecipeListState>{
  RecipeListCubit(): super(const RecipeListState.loading());

  final RecipeUseCase recipeUseCase = getIt<RecipeUseCase>();

  Future<void> initialData() async{
  final result = await recipeUseCase.getRecipes();
  result.map(
      success: (recipeList)=> emit(RecipeListState.success(recipeList: recipeList.list)),
      failure: (error)=>emit(RecipeListState.failure(error: error.error)));
  }

}