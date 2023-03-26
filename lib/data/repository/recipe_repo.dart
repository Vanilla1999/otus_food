import 'package:otus_food/data/model/recipe.dart';

class MockRecipeRepo extends RecipeRepo{
  @override
  List<Recipe> getRecipes() {
    return [
      Recipe(1, "Лосось в соусе терияки", "45 минут", "assets/images/one.jpg"),
      Recipe(2, "Поке боул с сыром тофу", "30 минут", "assets/images/two.jpg"),
      Recipe(3, "Стейк из говядины по-грузински с кукурузой", "1 час 15 минут", "assets/images/three.jpg"),
      Recipe(4, "Тосты с голубикой и бананом", "45 минут", "assets/images/four.jpg"),
      Recipe(5, "Паста с морепродуктами", "25 минут", "assets/images/five.jpg"),
      Recipe(6, "Бургер с двумя котлетами", "1 час", "assets/images/six.jpg"),
      Recipe(7, "Пицца Маргарита домашняя", "25 минут", "assets/images/seven.jpg"),
    ];
  }

}

abstract class RecipeRepo{

  List<Recipe> getRecipes();

}