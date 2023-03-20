import 'package:otus_food/data/model/ingredient.dart';

class MockIngredientRepo extends IngredientRepo {
  @override
  List<Ingredient> getIngridientByRecipeId(int recipeId) {
    return [
      Ingredient(1, "Соевый соус", "8 ст. ложек"),
      Ingredient(1, "Вода", "8 ст. ложек"),
      Ingredient(1, "Мёд", "3 ст. ложек"),
      Ingredient(1, "Коричневый сахар", "2 ст. ложек"),
      Ingredient(1, "Чеснок", "3 зубчика"),
      Ingredient(1, "Тёртый свежий имбирь", "1 ст. ложек"),
      Ingredient(1, "Лимонный сок", "1¹⁄₂ ст. ложки"),
      Ingredient(1, "Кукурузный крахмал", "1 ст. ложек"),
      Ingredient(1, "Растительное масло", "1 ч. ложек"),
      Ingredient(1, "Филе лосося или сёмги", "580 г"),
      Ingredient(1, "Кунжут", "по вкусу"),
    ];
  }
}

abstract class IngredientRepo {
  List<Ingredient> getIngridientByRecipeId(int recipeId);
}
