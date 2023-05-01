import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/dto/account_hive.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/main.dart';

class MockAccountRepo extends AccountDbRepo {
  @override
  Future<Account?> getAccount() {
    return Future(() => Account(
        id: "1",
        name: "annna_obrazsova",
        img: "assets/images/account_image.jpg", password: '1'));
  }

  @override
  Future<void> saveAccount(Account account) async {}

  @override
  Future<void> removeAccountFromDb()async {

  }
}

class AccountRepoImpl extends AccountDbRepo {
  final HiveDataSource _hiveDataSource = getIt<HiveDataSource>();

  @override
  Future<Account?> getAccount() async {
    final accountHive = await _hiveDataSource.getAccount();
    if (accountHive == null) {
      return null;
    } else {
      return accountHive.toModel();
    }
  }

  @override
  Future<void> saveAccount(Account account) async {
    await _hiveDataSource.saveAccount(account.toDb());
  }

  @override
  Future<void> removeAccountFromDb()async {
    await _hiveDataSource.clearAccount();
  }
}

abstract class AccountDbRepo {
  Future<Account?> getAccount();

  Future<void> saveAccount(Account account);

  Future<void> removeAccountFromDb();
}
