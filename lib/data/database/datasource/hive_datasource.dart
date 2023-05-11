import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/database/dto/account_hive.dart';
import 'package:otus_food/data/database/dto/comment_hive.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/constant.dart';
import 'package:path_provider/path_provider.dart';
part 'recipe_source.dart';

part 'ingredient_source.dart';

part 'cooking_step_source.dart';

part 'comments_source.dart';

part 'account_source.dart';

class HiveDataSource with RecipeSource, CommentSource,AccountSource {
  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter(RecipeHiveAdapter());
    Hive.registerAdapter(IngredientHiveAdapter());
    Hive.registerAdapter(CookingStepHiveAdapter());
    Hive.registerAdapter(CommentHiveAdapter());
    Hive.registerAdapter(AccountHiveAdapter());
  }

  Future<void> generateScureKey()async{
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'encryptionKey', value: base64UrlEncode(key));
    }
  }

  Future<void> clearDb() async {
    await clearComments();
    await clearRecipes();
    await clearRecipes();
    await clearAccount();
  }
}
