import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/database/dto/comment_hive.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/utils/constant.dart';
import 'package:path_provider/path_provider.dart';

part 'recipe_source.dart';

part 'ingredient_source.dart';

part 'cooking_step_source.dart';

part 'comments_source.dart';

class HiveDataSource with RecipeSource, CommentSource {
  Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter(RecipeHiveAdapter());
    Hive.registerAdapter(IngredientHiveAdapter());
    Hive.registerAdapter(CookingStepHiveAdapter());
    Hive.registerAdapter(CommentHiveAdapter());
  }

  Future<void> clearDb() async {
    await clearComments();
    await clearRecipes();
  }
}
