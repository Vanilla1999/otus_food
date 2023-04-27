part of 'hive_datasource.dart';


class RecipeSource{
  Future<List<RecipeHive>> getRecipes() async {
    final Box<RecipeHive> recipeBox;
    recipeBox = await Hive.openBox<RecipeHive>(recipeBoxName);
    return recipeBox.values.toList();
  }

  Future<void> saveRecipes(List<RecipeHive> recipes) async {
    final Box<RecipeHive> recipeBox;
    final Box<IngredientHive> ingredientBox;
    final Box<CookingStepHive> cookingStepBox;
    recipeBox = await Hive.openBox<RecipeHive>(recipeBoxName);
    ingredientBox = await Hive.openBox<IngredientHive>(ingredientBoxName);
    cookingStepBox = await Hive.openBox<CookingStepHive>(cookingStepBoxName);
    for (var recipe in recipes) {
      ingredientBox.addAll(recipe.ingredients);
      cookingStepBox.addAll(recipe.cookingSteps);
    }
    recipeBox.addAll(recipes);
  }
  Future<void> clearRecipes() async {
    final Box<RecipeHive> recipeBox;
    final Box<IngredientHive> ingredientBox;
    final Box<CookingStepHive> cookingStepBox;
    recipeBox = await Hive.openBox<RecipeHive>(recipeBoxName);
    ingredientBox = await Hive.openBox<IngredientHive>(ingredientBoxName);
    cookingStepBox = await Hive.openBox<CookingStepHive>(cookingStepBoxName);
    recipeBox.clear();
    ingredientBox.clear();
    cookingStepBox.clear();
  }
}

