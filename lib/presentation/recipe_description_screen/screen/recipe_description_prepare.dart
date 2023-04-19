import 'package:flutter/material.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/description_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/ingridients_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/appbar_description_prepare.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/cooking_steps_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/start_cooking_widget.dart';



class RecipeDescriptionPrepare extends StatelessWidget {
  final Recipe recipe;
  final List<Ingredient> ingredients;
  final List<CookingStep> cookingSteps;
  final RecipeDescriptionCubit cubit;

  const RecipeDescriptionPrepare(
      {Key? key,
      required this.recipe,
      required this.ingredients,
      required this.cookingSteps,
      required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarDescription(),
      backgroundColor: Colors.white,
      body: ListView(
          physics: const BouncingScrollPhysics() ,
          children: [
        DescriptionWidget(
          recipe: recipe,
        ),
        IngridientsWidget(ingredients: ingredients),
        CookingStepsWidget(cookingSteps: cookingSteps),
        StartCookingWidget(
          cubit: cubit,
        ),
      ]),
    );
  }
}
