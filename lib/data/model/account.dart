import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  factory Account({
    required int id,
    required String name,
    required String img,
  }) = _Account;
}