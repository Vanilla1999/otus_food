import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/repository/image_download_repo.dart';
import 'package:otus_food/data/database/repository/recipe_db_repo.dart';
import 'package:otus_food/data/network/datasource/network_client.dart';
import 'package:otus_food/data/network/repository/recipe_network_repository.dart';
import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/database/repository/comments_db_repo.dart';
import 'package:otus_food/domain/exit_from_account_usecase.dart';
import 'package:otus_food/domain/get_account.dart';
import 'package:otus_food/domain/get_comments_by_recipe_id.dart';
import 'package:otus_food/domain/get_recipe_usecase.dart';
import 'package:otus_food/domain/save_comment_usecase.dart';
import 'package:otus_food/domain/save_account_usecase.dart';
import 'package:otus_food/firebase_options.dart';
import 'package:otus_food/navigation/main_navigation.dart';

GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _releaseInjection();
  getIt.registerSingleton<NetworkClient>(_provideNetworkClient());
  getIt.registerSingleton<ImageDowloadRepo>(ImageDowloadRepo());
  getIt.registerSingleton<RecipeNetworkRepo>(RecipeNetworkRepo());
  getIt.registerSingleton<RecipeUseCase>(RecipeUseCaseImpl());
  getIt.registerSingleton<GetCommentsByRecipeId>(GetCommentsByRecipeId());
  getIt.registerSingleton<GetAccount>(GetAccount());
  getIt.registerSingleton<SaveAccountUseCase>(SaveAccountUseCase());
  getIt.registerSingleton<SaveCommentUseCase>(SaveCommentUseCase());
  getIt.registerSingleton<ExitFromAccount>(ExitFromAccount());
  ImageDowloadRepo().downloadAssetToMemory();
  runApp(const MyApp());
}

Future<void> _releaseInjection() async {
  await HiveDataSource().init();
  await HiveDataSource().generateScureKey();
  getIt.registerSingleton<HiveDataSource>(HiveDataSource());
  getIt.registerSingleton<CommentDbRepo>(CommentDbRepoImpl());
  getIt.registerSingleton<RecipeDbRepo>(RecipeDbRepoImpl());
  getIt.registerSingleton<AccountDbRepo>(AccountRepoImpl());
}

void _mockInjection() {
  getIt.registerSingleton<CommentDbRepo>(MockCommentRepo());
  getIt.registerSingleton<RecipeDbRepo>(MockRecipeRepo());
  getIt.registerSingleton<AccountDbRepo>(MockAccountRepo());
}

NetworkClient _provideNetworkClient() {
  final options = BaseOptions(
    baseUrl: "https://www.themealdb.com/api/json/v1/1",
    connectTimeout: const Duration(milliseconds: 20000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
  final dio = Dio(options);
  return NetworkClient(dio);
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
