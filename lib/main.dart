import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/repository/cooking_step_repo.dart';
import 'package:otus_food/data/repository/ingredient_repo.dart';
import 'package:otus_food/data/repository/recipe_repo.dart';
import 'package:otus_food/domain/cooking_step_usecase.dart';
import 'package:otus_food/domain/ingredient_usecase.dart';
import 'package:otus_food/domain/recipe_usecase.dart';
import 'package:otus_food/navigation/main_navigation.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<RecipeRepo>(MockRecipeRepo());
  getIt.registerSingleton<IngredientRepo>(MockIngredientRepo());
  getIt.registerSingleton<CookingStepRepo>(MockCookingStepRepo());
  getIt.registerSingleton<RecipeUseCase>(RecipeUseCaseImpl());
  getIt.registerSingleton<CookingStepUseCase>(CookingStepUseCaseImpl());
  getIt.registerSingleton<IngredientUseCase>(IngredientUseCaseImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus food',
      initialRoute: MainNavigation.initialRoute,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}

