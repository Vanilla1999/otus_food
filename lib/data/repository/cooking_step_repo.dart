import 'package:otus_food/data/model/cooking_step.dart';

class MockCookingStepRepo extends CookingStepRepo{
  @override
  List<CookingStep> getCookingStepsByRecipeId(int recipeId) {
    return [
      CookingStep(recipeId:1,numberStep: 1, description: "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.",time: 6),
      CookingStep(recipeId:1, numberStep:2,description: "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", time: 7),
      CookingStep(recipeId:1, numberStep:3, description:"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", time: 6),
      CookingStep(recipeId:1, numberStep:4,description: "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.",time:  1),
      CookingStep(recipeId:1, numberStep:5,description: "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", time: 6),
      CookingStep(recipeId:1,numberStep: 6, description:"Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", time: 15),
      CookingStep(recipeId:1, numberStep:7, description:"Перед подачей полейте соусом из формы и посыпьте кунжутом.",time:  4),
    ];
  }

}

abstract class CookingStepRepo{

  List<CookingStep> getCookingStepsByRecipeId(int recipeId);

}