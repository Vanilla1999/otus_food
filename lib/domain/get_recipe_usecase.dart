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
        final recipeWithDownloadImage =
            await _imageDowloadRepo.downloadRecipeImages(recipesFromNet);
        await _recipeDb.saveRecipes(await _removeUnUnicDataAndEmptyImg(
            recipeWithDownloadImage, await _recipeDb.getRecipes()));
        return DbAnswer.success(list: recipeWithDownloadImage);
      } else {
        return DbAnswer.success(list: await _recipeDb.getRecipes());
      }
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }

  Future<List<Recipe>> _removeUnUnicDataAndEmptyImg(
      List<Recipe> netData, List<Recipe> dbData) async {
    final removableList = <Recipe>[];
    for (var recipeDb in dbData) {
      if (netData.where((recipe) => recipe.id == recipeDb.id).isNotEmpty) {
        if (recipeDb.img.contains("пусто")) {
          removableList.add(recipeDb);
        }
      }
    }
    List<Recipe> newList =
        List.from(netData.toSet().difference(dbData.toSet()));
    for (var removable in removableList) {
      newList.remove(removable);
    }
    return newList;
  }
}

abstract class RecipeUseCase {
  Future<DbAnswer<Recipe>> getRecipes();
}
