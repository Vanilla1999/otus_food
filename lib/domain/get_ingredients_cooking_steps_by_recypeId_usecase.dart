import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/repository/cooking_step_repo.dart';
import 'package:otus_food/data/repository/ingredient_repo.dart';
import 'package:otus_food/domain/cooking_step_usecase.dart';
import 'package:otus_food/domain/ingredient_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer_two.dart';

class GetIngredientsCookingStepsByRecypeId {
  final IngredientRepo ingridientsRepo = getIt<IngredientRepo>();
  final CookingStepRepo cookingStepRepo = getIt<CookingStepRepo>();

  Future<DbAnswer2<Ingredient, CookingStep>>
      getIngridientsCookingStepByRecipeId(int recipeId) async {
    try {
      return DbAnswer2.success(
          listOne: await ingridientsRepo.getIngridientByRecipeId(recipeId),
          listTwo: await cookingStepRepo.getCookingStepsByRecipeId(recipeId));
    } catch (e) {
      return DbAnswer2.failure(error: e);
    }
  }
}
