import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer_void.dart';

class SaveAccountUseCase {
  final AccountDbRepo _accountDbRepo = getIt<AccountDbRepo>();

  Future<DbAnswerVoid> saveAccount(Account account) async {
    try {
     await _accountDbRepo.saveAccount(account);
      return const DbAnswerVoid.success();
    } catch (e) {
      return DbAnswerVoid.failure(error: e);
    }
  }
}