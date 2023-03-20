import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/data/repository/recipe_repo.dart';
import 'package:otus_food/utils/db_answer.dart';

import '../main.dart';

class RecipeUseCaseImpl extends RecipeUseCase {
  final RecipeRepo recipeRepo = getIt<RecipeRepo>();

  @override
  DbAnswer<Recipe> getRecipes() {
    try {
      return DbAnswer.success(recipeList: recipeRepo.getRecipes());
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}

abstract class RecipeUseCase {
  DbAnswer<Recipe> getRecipes();
}
