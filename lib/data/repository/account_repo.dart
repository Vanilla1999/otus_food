import 'package:otus_food/data/model/account.dart';

class MockAccountRepo extends AccountRepo{
  @override
  Future<Account> getAccountById(int recipeId) {
    return Future(() =>
      Account(id: 1, name: "annna_obrazsova", img: "assets/images/account_image.jpg")
    ) ;
  }

}

abstract class AccountRepo{

  Future<Account> getAccountById(int accountId);

}