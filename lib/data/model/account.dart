import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/account_hive.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  factory Account({
    required String id,
    required String name,
    required String password,
    required String img,
  }) = _Account;
}

extension ModelToDb on Account {
  AccountHive toDb() {
    return AccountHive(id: id, img: img, name: name,password:password);
  }
}
