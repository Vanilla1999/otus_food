import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:otus_food/data/network/network_client.dart';
import 'package:otus_food/data/repository/account_repo.dart';
import 'package:otus_food/data/repository/comments_repo.dart';
import 'package:otus_food/data/repository/cooking_step_repo.dart';
import 'package:otus_food/data/repository/ingredient_repo.dart';
import 'package:otus_food/data/repository/recipe_repo.dart';
import 'package:otus_food/domain/cooking_step_usecase.dart';
import 'package:otus_food/domain/get_ingredients_cooking_steps_by_recypeId_usecase.dart';
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
  getIt.registerSingleton<CommentRepo>(MockCommentRepo());
  getIt.registerSingleton<AccountRepo>(MockAccountRepo());
  getIt.registerSingleton<GetIngredientsCookingStepsByRecypeId>(GetIngredientsCookingStepsByRecypeId());
  getIt.registerSingleton<NetworkClient>(_provideNetworkClient());
  runApp(const MyApp());
}

NetworkClient _provideNetworkClient(){
  final options = BaseOptions(
    baseUrl:"www.themealdb.com/api/json/v1/1",
    connectTimeout: const Duration(milliseconds: 20000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
  final dio = Dio(options);
  return  NetworkClient(dio);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus food',
      debugShowCheckedModeBanner: false,
      initialRoute: MainNavigation.initialRoute,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}

