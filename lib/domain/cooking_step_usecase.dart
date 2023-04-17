import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/repository/cooking_step_repo.dart';

import '../main.dart';
import '../utils/db_answer.dart';

class CookingStepUseCaseImpl extends CookingStepUseCase {
  final CookingStepRepo cookingStepRepo = getIt<CookingStepRepo>();

  @override
  Future<DbAnswer<CookingStep>>  getCookingStepByRecipeId(int recipeId) async{
    try {
      return DbAnswer.success(list: await cookingStepRepo.getCookingStepsByRecipeId(recipeId));
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}

abstract class CookingStepUseCase {
  Future<DbAnswer<CookingStep>> getCookingStepByRecipeId(int recipeId);
}