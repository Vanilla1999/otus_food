import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_cubit.dart';
import 'package:otus_food/presentation/account_screen/screen/account_screen.dart';
import 'package:otus_food/presentation/home_screen/screen/home.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/screen/recipe_description__main_screen.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_cubit.dart';
import 'package:otus_food/presentation/recipe_list_screen/screen/recipe_list_screen.dart';

import '../utils/colors.dart';

class ScreenFactory {
  Widget home() {
    changeSystemColor(ColorsApp.defaultBackground);
    return Home();
  }

  Widget makeRecipeListScreen() {
    changeSystemColor(ColorsApp.defaultBackground);
    return BlocProvider<RecipeListCubit>(
      create: (context) => RecipeListCubit()..initialData(),
      child: const RecipeListScreen(),
    );
  }

  Widget makeAccountScreen() {
    changeSystemColor(ColorsApp.defaultBackground);
    return BlocProvider<AccountScreenCubit>(
      create: (context) => AccountScreenCubit()..initialData(),
      child: const AccountScreen(),
    );
  }

  Widget makeRecipeDescriptionScreen(Recipe recipe) {
    changeSystemColor(Colors.white);
    return BlocProvider<RecipeDescriptionCubit>(
      create: (context) => RecipeDescriptionCubit()..initialData(recipe),
      child:  RecipeDescriptionScreen(),
    );
  }
}
