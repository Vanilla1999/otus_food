import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/dto/account_hive.dart';
import 'package:otus_food/data/database/dto/comment_hive.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/database/repository/image_download_repo.dart';
import 'package:otus_food/data/network/repository/recipe_network_repository.dart';
import 'package:otus_food/domain/exit_from_account_usecase.dart';
import 'package:otus_food/domain/get_account.dart';
import 'package:otus_food/domain/get_comments_by_recipe_id.dart';
import 'package:otus_food/domain/get_recipe_usecase.dart';
import 'package:otus_food/domain/save_account_usecase.dart';
import 'package:otus_food/domain/save_comment_usecase.dart';

import 'exit_from_account_usecase.dart';
import 'domain_tests.mocks.dart';
@GenerateNiceMocks([MockSpec<FlutterSecureStorage>()])

GetIt getIt = GetIt.instance;
void main() {
  group('Тестирование 3-х примеров ', () {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await setUpTestHive();
      Hive.registerAdapter(RecipeHiveAdapter());
      Hive.registerAdapter(IngredientHiveAdapter());
      Hive.registerAdapter(CookingStepHiveAdapter());
      Hive.registerAdapter(CommentHiveAdapter());
      Hive.registerAdapter(AccountHiveAdapter());
      registerInjection();
      registerMockFlutterSecureStorage();
    });
    exitFromAccountUseCase();
    tearDown(() async {
      await tearDownTestHive();
    });
  });
}

void registerMockFlutterSecureStorage(){
  final FlutterSecureStorage mockSecureStorage = getIt<FlutterSecureStorage>();
  when(mockSecureStorage.containsKey(key: 'encryptionKey')).thenAnswer((_)=>Future(() => true));
  when(mockSecureStorage.read(key: 'encryptionKey')).thenAnswer((_)=>Future(() => base64UrlEncode(Hive.generateSecureKey())));
}

void registerInjection(){
  getIt.registerSingleton<FlutterSecureStorage>(MockFlutterSecureStorage());
  getIt.registerSingleton<HiveDataSource>(HiveDataSource());
  getIt.registerSingleton<AccountDbRepo>(AccountRepoImpl());
  getIt.registerSingleton<GetAccount>(GetAccount());
  getIt.registerSingleton<SaveAccountUseCase>(SaveAccountUseCase());
  getIt.registerSingleton<ExitFromAccount>(ExitFromAccount());
}
