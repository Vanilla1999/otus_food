import 'package:otus_food/data/model/recipe.dart';

class MockRecipeRepo extends RecipeRepo{
  @override
  List<Recipe> getRecipes() {
    return [];
  }

}

abstract class RecipeRepo{

  List<Recipe> getRecipes();

}