import 'package:otus_food/data/model/recipe.dart';

class MockRecipeRepo extends RecipeRepo{
  @override
  Future<List<Recipe>> getRecipes() {
    return Future(() => [
      Recipe(id:1,name: "Лосось в соусе терияки", time:"45 минут", img:"assets/images/one.jpg"),
      Recipe(id:2, name:"Поке боул с сыром тофу",time: "30 минут",img: "assets/images/two.jpg"),
      Recipe(id:3, name:"Стейк из говядины по-грузински с кукурузой",time: "1 час 15 минут",img: "assets/images/three.jpg"),
      Recipe(id:4, name:"Тосты с голубикой и бананом",time: "45 минут", img:"assets/images/four.jpg"),
      Recipe(id:5,name: "Паста с морепродуктами", time:"25 минут", img:"assets/images/five.jpg"),
      Recipe(id:6,name: "Бургер с двумя котлетами",time: "1 час", img:"assets/images/six.jpg"),
      Recipe(id:7, name:"Пицца Маргарита домашняя", time:"25 минут",img: "assets/images/seven.jpg"),
    ]);
  }

}

abstract class RecipeRepo{

  Future<List<Recipe>> getRecipes();

}