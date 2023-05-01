import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';

part 'account_hive.freezed.dart';
part 'account_hive.g.dart';

@freezed
class AccountHive with _$AccountHive{
  @HiveType(typeId: 5)
  factory AccountHive({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String password,
    @HiveField(3) required String img,
  }) = _AccountHive;
}
extension DbToModel on AccountHive {
  Account toModel() {
    return Account(
        id:id,
  name:name,
        img: img,
      password: password
    );
  }
}