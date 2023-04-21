import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/repository/account_repo.dart';
import 'package:otus_food/data/repository/comments_repo.dart';
import 'package:otus_food/data/repository/cooking_step_repo.dart';
import 'package:otus_food/data/repository/ingredient_repo.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer_four.dart';
import 'package:otus_food/utils/db_answer_three.dart';
import 'package:otus_food/utils/db_answer_two.dart';

class GetIngredientsCookingStepsByRecypeId {
  final IngredientRepo ingridientsRepo = getIt<IngredientRepo>();
  final CookingStepRepo cookingStepRepo = getIt<CookingStepRepo>();
  final CommentRepo commentRepo = getIt<CommentRepo>();
  final AccountRepo accountRepo = getIt<AccountRepo>();

  Future<DbAnswer4<Ingredient, CookingStep, Comment,Account>>
      getIngridientsCookingStepByRecipeId(int recipeId) async {
    try {
      final comments = await commentRepo.getCommentsByRecipeId(recipeId);
      var listAccount = <Account>[];
      for(var comment in comments){
        listAccount.add(await accountRepo.getAccountById(comment.accountId));
      }
      listAccount = listAccount.toSet().toList();
      return DbAnswer4.success(
          listOne: await ingridientsRepo.getIngridientByRecipeId(recipeId),
          listTwo: await cookingStepRepo.getCookingStepsByRecipeId(recipeId),
          listThree:comments ,
          listFour: listAccount);
    } catch (e) {
      return DbAnswer4.failure(error: e);
    }
  }
}
