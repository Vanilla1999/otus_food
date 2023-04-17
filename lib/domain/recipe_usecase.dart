import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/data/repository/recipe_repo.dart';
import 'package:otus_food/utils/db_answer.dart';

import '../main.dart';

class RecipeUseCaseImpl extends RecipeUseCase {
  final RecipeRepo recipeRepo = getIt<RecipeRepo>();

  @override
  Future<DbAnswer<Recipe>> getRecipes() async {
    try {
      return DbAnswer.success(list: await recipeRepo.getRecipes());
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}

abstract class RecipeUseCase {
  Future<DbAnswer<Recipe>> getRecipes();
}
