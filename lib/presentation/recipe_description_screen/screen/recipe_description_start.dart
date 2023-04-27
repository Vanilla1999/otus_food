import 'package:flutter/material.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/description_prepare_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/ingridients_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/start_cooking/appbar_description_start.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/start_cooking/cooking_steps_start_cooking_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/start_cooking/description_start_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/start_cooking/stop_cooking_button_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/start_cooking/timer_description_widger.dart';

class RecipeDescriptionStart extends StatelessWidget {
  final Recipe recipe;
  final RecipeDescriptionCubit cubit;

  const RecipeDescriptionStart(
      {Key? key,
      required this.recipe,
      required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarDescriptionStart(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(physics: const BouncingScrollPhysics(), children: [
            DescriptionStartWidget(
              recipe: recipe,
            ),
            IngridientsWidget(ingredients: recipe.ingredients),
            CookingStepsStartCookingWidget(cookingSteps: recipe.cookingSteps),
            StopCookingButtonWidget(
              cubit: cubit,
            ),
          ]),
           TimerDisctiption(
            time: recipe.time,
          ),
        ],
      ),
    );
  }
}
