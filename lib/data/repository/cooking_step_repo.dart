import 'package:otus_food/data/model/cooking_step.dart';

class MockCookingStepRepo extends CookingStepRepo{
  @override
  List<CookingStep> getCookingStepsByRecipeId(int recipeId) {
    switch(recipeId){
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
    }
    return [];
  }

}

abstract class CookingStepRepo{

  List<CookingStep> getCookingStepsByRecipeId(int recipeId);

}