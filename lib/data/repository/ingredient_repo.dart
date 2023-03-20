import 'package:otus_food/data/model/ingredient.dart';

class MockIngredientRepo extends IngredientRepo{
  @override
  List<Ingredient> getIngridientByRecipeId(int recipeId) {
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

abstract class IngredientRepo{

  List<Ingredient> getIngridientByRecipeId(int recipeId);

}