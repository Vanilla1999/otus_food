import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_state.dart';
import 'package:otus_food/presentation/recipe_description_screen/screen/recipe_description_prepare.dart';
import 'package:otus_food/presentation/recipe_description_screen/screen/recipe_description_start.dart';
import 'package:otus_food/utils/colors.dart';

class RecipeDescriptionScreen extends StatelessWidget {
  const RecipeDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return WillPopScope(
      onWillPop: () async {
        changeSystemColor(ColorsApp.defaultBackground);
        return true;
      },
      child: SafeArea(
          child: BlocBuilder<RecipeDescriptionCubit, RecipeDescriptionState>(
        builder: _builder,
      )),
    );
  }

  Widget _builder(BuildContext context, RecipeDescriptionState state) {
    return state.when(
      loading: () => const CircularProgressIndicator(),
      successPrepareCooking:
          (recipe, ingredients, cookingSteps, comments, accounts) =>
              RecipeDescriptionPrepare(
        recipe: recipe,
        ingredients: ingredients,
        cookingSteps: cookingSteps,
        comments: comments,
        accounts: accounts,
        cubit: context.read<RecipeDescriptionCubit>(),
      ),
      failure: (error) => Container(
        color: Colors.red,
      ),
      successStartCooking: (recipe, ingredients, cookingSteps) =>
          RecipeDescriptionStart(
        recipe: recipe,
        ingredients: ingredients,
        cookingSteps: cookingSteps,
        cubit: context.read<RecipeDescriptionCubit>(),
      ),
    );
  }
}
