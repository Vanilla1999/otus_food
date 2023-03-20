import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_cubit.dart';
import 'package:otus_food/presentation/recipe_list_screen/screen/recipe_list_screen.dart';

class ScreenFactory {
  Widget makeRecipeListScreen() {
    return BlocProvider<RecipeListCubit>(
      create: (context) => RecipeListCubit()..initialData(),
      child: const RecipeListScreen(),
    );
  }
}
