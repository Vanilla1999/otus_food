import 'package:otus_food/data/database/repository/recipe_db_repo.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/database/repository/comments_db_repo.dart';

import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer.dart';
import 'package:otus_food/utils/db_answer_four.dart';
import 'package:otus_food/utils/db_answer_three.dart';
import 'package:otus_food/utils/db_answer_two.dart';

class GetCommentsByRecipeId {
  final CommentDbRepo _commentRepo = getIt<CommentDbRepo>();

  Future<DbAnswer<Comment>> getCommentsByRecipeId(
      int recipeId) async {
    try {
      final comments = await _commentRepo.getCommentsByRecipeId(recipeId);
      return DbAnswer.success(list: comments);
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}
