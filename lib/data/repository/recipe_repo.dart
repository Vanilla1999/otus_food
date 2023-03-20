import 'package:otus_food/data/model/recipe.dart';

class MockRecipeRepo extends RecipeRepo{
  @override
  List<Recipe> getRecipes() {
    return [
      Recipe(1, "Лосось в соусе терияки", "45 минут", "asset/lococ.jpg"),
      Recipe(2, "Поке боул с сыром тофу", "30 минут", "asset/two.jpg"),
      Recipe(3, "Стейк из говядины по-грузински с кукурузой", "1 час 15 минут", "asset/three.jpg"),
      Recipe(4, "Тосты с голубикой и бананом", "45 минут", "asset/four.jpg"),
      Recipe(5, "Паста с морепродуктами", "25 минут", "asset/piza.jpg"),
      Recipe(6, "Бургер с двумя котлетами", "1 час", "asset/five.jpg"),
      Recipe(7, "Пицца Маргарита домашняя", "25 минут", "asset/six.jpg"),
    ];
  }

}

abstract class RecipeRepo{

  List<Recipe> getRecipes();

}