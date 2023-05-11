import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/repository/account_db_repo.dart';

// 📦 Package imports:
import 'package:hive/hive.dart';
import 'package:otus_food/domain/exit_from_account_usecase.dart';
import 'package:otus_food/utils/db_answer_void.dart';

import 'domain_tests.dart';

void exitFromAccountUseCase() {
  test('ExitFromAccount test', () async {
    final ExitFromAccount exitFromAccountUsecase = getIt<ExitFromAccount>();
    final result = await exitFromAccountUsecase.exitFromAccount();
    expect(result, const DbAnswerVoid.success());
  });
}
