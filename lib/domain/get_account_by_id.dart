import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer.dart';

class GetAccountById {
  final AccountDbRepo _accountDbRepo = getIt<AccountDbRepo>();

  Future<DbAnswer<Account>> getIngridientsCookingStepByRecipeId(int id) async {
    try {
      final comments = [await _accountDbRepo.getAccountById(id)];
      return DbAnswer.success(list: comments);
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}
