import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/repository/ingredient_repo.dart';

import '../main.dart';
import '../utils/db_answer.dart';

class IngredientUseCaseImpl extends IngredientUseCase {
  final IngredientRepo ingredientRepo = getIt<IngredientRepo>();

  @override
  Future<DbAnswer<Ingredient>> getIngridientsByRecipeId(int recipeId) async {
    try {
      return DbAnswer.success(
          list: await ingredientRepo.getIngridientByRecipeId(recipeId));
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}

abstract class IngredientUseCase {
  Future<DbAnswer<Ingredient>> getIngridientsByRecipeId(int recipeId);
}
