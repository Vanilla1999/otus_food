import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';
import 'package:otus_food/data/database/dto/ingredient_hive.dart';
import 'package:otus_food/data/database/dto/recipe_hive.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';

part 'recipe_network.freezed.dart';

part 'recipe_network.g.dart';

@freezed
class RecipeNetwork with _$RecipeNetwork {
  @JsonSerializable(explicitToJson: true)
  factory RecipeNetwork({
    String? idMeal,
    String? strMeal,
    String? strDrinkAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    String? strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strIngredient16,
    String? strIngredient17,
    String? strIngredient18,
    String? strIngredient19,
    String? strIngredient20,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strMeasure16,
    String? strMeasure17,
    String? strMeasure18,
    String? strMeasure19,
    String? strMeasure20,
    String? strSource,
    String? strImageSource,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
  }) = _RecipeNetwork;

  factory RecipeNetwork.fromJson(Map<String, dynamic> json) =>
      _$RecipeNetworkFromJson(json);
}


extension NetworkToModel on RecipeNetwork {
  Recipe toModel() {
    return Recipe(
        id: int.parse(idMeal ?? "0"),
        name:strMeal ?? "",
        time: 10,
        ingredients: _addIngridients(),
        cookingSteps: _addCookingSteps(),
        img: strMealThumb??"");
  }

  List<CookingStep> _addCookingSteps() {
    final cookingSteps = <CookingStep>[];

    if (strInstructions != null) {
      List<String> result = strInstructions!.split('\r\n');
      for(var i = 1; i<result.length+1 ;i++){
        cookingSteps.add(CookingStep(recipeId: int.parse(idMeal ?? "0"), numberStep: i, description: result[i-1], time: 0));
      }
    }
    return cookingSteps;
  }

  List<Ingredient> _addIngridients() {
    final ingredients = <Ingredient>[];
    if (strIngredient1 != null ) {
      if(strIngredient1!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
          name: strIngredient1 ?? "",
          amount: strMeasure1 ?? ""));
      }
    }
    if (strIngredient2 != null) {
      if(strIngredient2!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient2 ?? "",
            amount: strMeasure2 ?? ""));
      }
    }
    if (strIngredient3 != null) {
      if(strIngredient3!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient3 ?? "",
            amount: strMeasure3 ?? ""));
      }
    }
    if (strIngredient4 != null) {
      if(strIngredient4!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient4 ?? "",
            amount: strMeasure4 ?? ""));
      }
    }
    if (strIngredient5 != null) {
      if(strIngredient5!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient5 ?? "",
            amount: strMeasure5 ?? ""));
      }
    }
    if (strIngredient6 != null) {
      if(strIngredient6!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient6 ?? "",
            amount: strMeasure6 ?? ""));
      }
    }
    if (strIngredient7 != null) {
      if(strIngredient7!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient7 ?? "",
            amount: strMeasure7 ?? ""));
      }
    }
    if (strIngredient8 != null) {
      if(strIngredient8!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient8 ?? "",
            amount: strMeasure8 ?? ""));
      }
    }
    if (strIngredient9 != null) {
      if(strIngredient9!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient9 ?? "",
            amount: strMeasure9 ?? ""));
      }
    }
    if (strIngredient10 != null) {
      if(strIngredient10!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient10 ?? "",
            amount: strMeasure10 ?? ""));
      }
    }
    if (strIngredient11 != null) {
      if(strIngredient11!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient11 ?? "",
            amount: strMeasure11 ?? ""));
      }
    }
    if (strIngredient12 != null) {
      if(strIngredient12!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient12 ?? "",
            amount: strMeasure12 ?? ""));
      }
    }
    if (strIngredient13 != null) {
      if(strIngredient13!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient13 ?? "",
            amount: strMeasure13 ?? ""));
      }
    }
    if (strIngredient14 != null) {
      if(strIngredient14!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient14 ?? "",
            amount: strMeasure14 ?? ""));
      }
    }
    if (strIngredient15 != null) {
      if(strIngredient15!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient15 ?? "",
            amount: strMeasure15 ?? ""));
      }
    }
    if (strIngredient16 != null) {
      if(strIngredient16!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient16 ?? "",
            amount: strMeasure16 ?? ""));
      }
    }
    if (strIngredient17 != null) {
      if(strIngredient17!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient17 ?? "",
            amount: strMeasure17 ?? ""));
      }
    }
    if (strIngredient18 != null) {
      if(strIngredient18!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient18 ?? "",
            amount: strMeasure18 ?? ""));
      }
    }
    if (strIngredient19 != null) {
      if(strIngredient19!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient19 ?? "",
            amount: strMeasure19 ?? ""));
      }
    }
    if (strIngredient20 != null) {
      if(strIngredient20!.isNotEmpty) {
        ingredients.add(Ingredient(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient20 ?? "",
            amount: strMeasure20 ?? ""));
      }
    }

    return ingredients;
  }
}

extension NetworkToDb on RecipeNetwork {
  RecipeHive toDb() {
    return RecipeHive(
        id: int.parse(idMeal ?? "0"),
        name:strMeal ?? "",
        time: 10,
        ingredients: _addIngridients(),
        cookingSteps: _addCookingSteps(),
        img: strMealThumb??"");
  }

  List<CookingStepHive> _addCookingSteps() {
    final cookingSteps = <CookingStepHive>[];

    if (strInstructions != null) {
      List<String> result = strInstructions!.split('\r\n');
      for(var i = 1; i<result.length+1 ;i++){
        cookingSteps.add(CookingStepHive(recipeId: int.parse(idMeal ?? "0"), numberStep: i, description: result[i-1], time: 0));
      }
    }
    return cookingSteps;
  }

  List<IngredientHive> _addIngridients() {
    final ingredients = <IngredientHive>[];
    if (strIngredient1 != null) {
      if(strIngredient1!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient1 ?? "",
            amount: strMeasure1 ?? ""));
      }
    }
    if (strIngredient2 != null) {
      if(strIngredient2!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient2 ?? "",
            amount: strMeasure2 ?? ""));
      }
    }
    if (strIngredient3 != null) {
      if(strIngredient3!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient3 ?? "",
            amount: strMeasure3 ?? ""));
      }
    }
    if (strIngredient4 != null) {
      if(strIngredient4!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient4 ?? "",
            amount: strMeasure4 ?? ""));
      }
    }
    if (strIngredient5 != null) {
      if(strIngredient5!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient5 ?? "",
            amount: strMeasure5 ?? ""));
      }
    }
    if (strIngredient6 != null) {
      if(strIngredient6!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient6 ?? "",
            amount: strMeasure6 ?? ""));
      }
    }
    if (strIngredient7 != null) {
      if(strIngredient7!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient7 ?? "",
            amount: strMeasure7 ?? ""));
      }
    }
    if (strIngredient8 != null) {
      if(strIngredient8!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient8 ?? "",
            amount: strMeasure8 ?? ""));
      }
    }
    if (strIngredient9 != null) {
      if(strIngredient9!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient9 ?? "",
            amount: strMeasure9 ?? ""));
      }
    }
    if (strIngredient10 != null) {
      if(strIngredient10!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient10 ?? "",
            amount: strMeasure10 ?? ""));
      }
    }
    if (strIngredient11 != null) {
      if(strIngredient11!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient11 ?? "",
            amount: strMeasure11 ?? ""));
      }
    }
    if (strIngredient12 != null) {
      if(strIngredient12!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient12 ?? "",
            amount: strMeasure12 ?? ""));
      }
    }
    if (strIngredient13 != null) {
      if(strIngredient13!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient13 ?? "",
            amount: strMeasure13 ?? ""));
      }
    }
    if (strIngredient14 != null) {
      if(strIngredient14!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient14 ?? "",
            amount: strMeasure14 ?? ""));
      }
    }
    if (strIngredient15 != null) {
      if(strIngredient15!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient15 ?? "",
            amount: strMeasure15 ?? ""));
      }
    }
    if (strIngredient16 != null) {
      if(strIngredient16!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient16 ?? "",
            amount: strMeasure16 ?? ""));
      }
    }
    if (strIngredient17 != null) {
      if(strIngredient17!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient17 ?? "",
            amount: strMeasure17 ?? ""));
      }
    }
    if (strIngredient18 != null) {
      if(strIngredient18!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient18 ?? "",
            amount: strMeasure18 ?? ""));
      }
    }
    if (strIngredient19 != null) {
      if(strIngredient19!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient19 ?? "",
            amount: strMeasure19 ?? ""));
      }
    }
    if (strIngredient20 != null) {
      if(strIngredient20!.isNotEmpty) {
        ingredients.add(IngredientHive(recipeId: int.parse(idMeal ?? "0"),
            name: strIngredient20 ?? "",
            amount: strMeasure20 ?? ""));
      }
    }

    return ingredients;
  }
}
