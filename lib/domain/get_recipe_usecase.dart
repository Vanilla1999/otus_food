import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/data/database/repository/image_download_repo.dart';
import 'package:otus_food/data/database/repository/recipe_db_repo.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/data/network/dto/recipe_network.dart';
import 'package:otus_food/data/network/repository/recipe_network_repository.dart';
import 'package:otus_food/utils/db_answer.dart';

import '../main.dart';

class RecipeUseCaseImpl extends RecipeUseCase {
  final RecipeNetworkRepo _recipeNetworkRepo = getIt<RecipeNetworkRepo>();
  final RecipeDbRepo _recipeDb = getIt<RecipeDbRepo>();
  final ImageDowloadRepo _imageDowloadRepo = getIt<ImageDowloadRepo>();

  @override
  Future<DbAnswer<Recipe>> getRecipes() async {
    try {
      if (await InternetConnectionChecker().hasConnection) {
        final recipesIdFromNet = await _recipeNetworkRepo.getRecipesId();
        final recipesFromNet =
            await _recipeNetworkRepo.getRecipes(recipesIdFromNet);
        final recipeWithDownloadImage = await _imageDowloadRepo.downloadRecipeImages(recipesFromNet);
        await _recipeDb.saveRecipes(await _removeUnUnicData(recipeWithDownloadImage,await _recipeDb.getRecipes()));
        return DbAnswer.success(list: recipeWithDownloadImage);
      } else {
        return DbAnswer.success(list: await _recipeDb.getRecipes());
      }
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
  Future<List<Recipe>> _removeUnUnicData(List<Recipe> netData , List<Recipe> dbData)async{
    return List.from(netData.toSet().difference(dbData.toSet()));
  }
}

abstract class RecipeUseCase {
  Future<DbAnswer<Recipe>> getRecipes();
}
