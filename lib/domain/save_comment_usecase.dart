import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/database/repository/comments_db_repo.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer_void.dart';

class SaveCommentUseCase {
  final AccountDbRepo _accountDbRepo = getIt<AccountDbRepo>();
  final CommentDbRepo _commentDbRepo = getIt<CommentDbRepo>();

  Future<DbAnswerVoid> saveComment(Comment comment,int ricipeId) async {
    try {
      final result = await _accountDbRepo.getAccount();
      final resultComment = await _commentDbRepo.getCommentsByRecipeId(ricipeId);
      if (result == null) {
        _saveComment(resultComment,comment);
      } else {
        _saveComment(resultComment,comment.copyWith(accountId: result.id,accountName: result.name));
      }
      return const DbAnswerVoid.success();
    } catch (e) {
      return DbAnswerVoid.failure(error: e);
    }
  }
  Future<void> _saveComment(List<Comment> comments,Comment comment)async {
    if(comments.isNotEmpty) {
      await _commentDbRepo.saveComment(
          comment.copyWith(id: comments.last.id + 1));
    } else{
      await _commentDbRepo.saveComment(
          comment);
    }
  }
}
