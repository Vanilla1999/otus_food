import 'package:otus_food/data/model/cooking_step.dart';

class MockCookingStepRepo extends CookingStepRepo{
  @override
  List<CookingStep> getCookingStepsByRecipeId(int recipeId) {
    return [
      CookingStep(1, 1, "В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.", 6),
      CookingStep(1, 2, "Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.", 7),
      CookingStep(1, 3, "Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.", 6),
      CookingStep(1, 4, "Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.", 1),
      CookingStep(1, 5, "Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.", 6),
      CookingStep(1, 6, "Поставьте в разогретую до 200 °C духовку примерно на 15 минут.", 15),
      CookingStep(1, 7, "Перед подачей полейте соусом из формы и посыпьте кунжутом.", 4),
    ];
  }

}

abstract class CookingStepRepo{

  List<CookingStep> getCookingStepsByRecipeId(int recipeId);

}