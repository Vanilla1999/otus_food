import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/data/network/dto/recipe_id_network.dart';
import 'package:otus_food/data/network/dto/recipe_network.dart';
import 'package:otus_food/data/network/datasource/network_client.dart';
import 'package:otus_food/main.dart';

class RecipeNetworkRepo {
  final NetworkClient _networkClient = getIt<NetworkClient>();

  Future<List<RecipeIdNetwork>> getRecipesId() async {
    var result = await _networkClient.getRecipes();
    return result.recipes ?? [];
  }

  Future<List<Recipe>> getRecipes(List<RecipeIdNetwork> ids) async {
    var futures = <Future>[];
    var recipes = <RecipeNetwork>[];
    for (var id in ids) {
    await  _addToList(recipes,id);
    }
    await Future.wait(futures);
    return recipes.map((e) => e.toModel()).toList();
  }

  Future<void> _addToList(List<RecipeNetwork> recipes, RecipeIdNetwork id) async {
    if(id.idRecipe != null) {
      var result = await _networkClient.getRecipeById(int.parse(id.idRecipe!));
      recipes.addAll(result.recipes ?? []);
    }
  }
}
