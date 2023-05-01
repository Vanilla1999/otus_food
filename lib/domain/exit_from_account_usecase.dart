import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer.dart';
import 'package:otus_food/utils/db_answer_void.dart';

class ExitFromAccount {
  final AccountDbRepo _accountDbRepo = getIt<AccountDbRepo>();

  Future<DbAnswerVoid> exitFromAccount() async {
    try {
      await _accountDbRepo.removeAccountFromDb();
      return const DbAnswerVoid.success();
    } catch (e) {
      return DbAnswerVoid.failure(error: e);
    }
  }
}