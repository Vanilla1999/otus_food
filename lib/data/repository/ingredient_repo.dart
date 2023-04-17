import 'package:otus_food/data/model/ingredient.dart';

class MockIngredientRepo extends IngredientRepo {
  @override
  List<Ingredient> getIngridientByRecipeId(int recipeId) {
    return [
      Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
      Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
      Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
      Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
      Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
      Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
      Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
      Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
      Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
      Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
      Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),
    ];
  }
}

abstract class IngredientRepo {
  List<Ingredient> getIngridientByRecipeId(int recipeId);
}
