import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/dto/account_hive.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/main.dart';

class MockAccountRepo extends AccountDbRepo {
  @override
  Future<Account?> getAccount() {
    return Future(() => Account(
        id: 1,
        name: "annna_obrazsova",
        img: "assets/images/account_image.jpg"));
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
}

abstract class AccountDbRepo {
  Future<Account?> getAccount();
}
