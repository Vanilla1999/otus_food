import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/main.dart';

class MockRecipeRepo extends RecipeDbRepo{
  @override
  Future<List<Recipe>> getRecipes() {
    return Future(() => [
      Recipe(id:1,name: "Лосось в соусе терияки", time:45, img:"assets/images/one.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),] ),
          Recipe(id:2, name:"Поке боул с сыром тофу",time: 30,img: "assets/images/two.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
          Recipe(id:3, name:"Стейк из говядины по-грузински с кукурузой",time: 75,img: "assets/images/three.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
          Recipe(id:4, name:"Тосты с голубикой и бананом",time: 45, img:"assets/images/four.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
          Recipe(id:5,name: "Паста с морепродуктами", time:25, img:"assets/images/five.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
          Recipe(id:6,name: "Бургер с двумя котлетами",time: 60, img:"assets/images/six.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
                CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
          Recipe(id:7, name:"Пицца Маргарита домашняя", time:25,img: "assets/images/seven.jpg",
          ingredients: [  Ingredient(recipeId:1, name: "Соевый соус",amount: "8 ст. ложек"),
                Ingredient(recipeId:1, name:"Вода", amount:"8 ст. ложек"),
                Ingredient(recipeId:1, name:"Мёд", amount:"3 ст. ложек"),
                Ingredient(recipeId:1, name:"Коричневый сахар",amount:"2 ст. ложек"),
                Ingredient(recipeId:1,name: "Чеснок", amount:"3 зубчика"),
                Ingredient(recipeId:1, name:"Тёртый свежий имбирь",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Лимонный сок",amount: "1¹⁄₂ ст. ложки"),
                Ingredient(recipeId:1,name: "Кукурузный крахмал",amount: "1 ст. ложек"),
                Ingredient(recipeId:1, name:"Растительное масло",amount: "1 ч. ложек"),
                Ingredient(recipeId:1,name: "Филе лосося или сёмги", amount:"580 г"),
                Ingredient(recipeId:1, name:"Кунжут", amount:"по вкусу"),],
          cookingSteps:[CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
                CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
                CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
                CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
                CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
                CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
            CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),]),
    ]);
  }

  @override
  Future<void> saveRecipes(List<Recipe> recipe) async{

  }

}

class RecipeDbRepoImpl extends RecipeDbRepo{

  final HiveDataSource _hiveDataSource = getIt<HiveDataSource>();

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _hiveDataSource.getRecipes();
    return recipes.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> saveRecipes(List<Recipe> recipes)async {
   await _hiveDataSource.saveRecipes(recipes.map((e)=>e.toDb()).toList());
  }

}

abstract class RecipeDbRepo{

  Future<List<Recipe>> getRecipes();

  Future<void> saveRecipes(List<Recipe> recipes);
}