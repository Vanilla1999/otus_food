import 'package:otus_food/data/database/repository/account_db_repo.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/utils/db_answer.dart';

class GetAccount {
  final AccountDbRepo _accountDbRepo = getIt<AccountDbRepo>();

  Future<DbAnswer<Account>> getAccount() async {
    try {
      final list = <Account>[];
      final account = await _accountDbRepo.getAccount();
      if(account!= null) {
        list.add(account);
      }
      return DbAnswer.success(list: list);
    } catch (e) {
      return DbAnswer.failure(error: e);
    }
  }
}
