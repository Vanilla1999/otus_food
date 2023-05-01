import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/domain/exit_from_account_usecase.dart';
import 'package:otus_food/domain/get_account.dart';
import 'package:otus_food/domain/get_recipe_usecase.dart';
import 'package:otus_food/domain/save_account_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_state.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';
import 'package:path_provider/path_provider.dart';

class AccountScreenCubit extends Cubit<AccountScreenState> {
  AccountScreenCubit() : super(const AccountScreenState.loading());

  final GetAccount getAccountUseCase = getIt<GetAccount>();
  final SaveAccountUseCase saveAccountUsecase = getIt<SaveAccountUseCase>();
  final ExitFromAccount exitFromAccountUsecase = getIt<ExitFromAccount>();

  Future<void> initialData() async {
    initFireBaseStream();
    emit(const AccountScreenState.loading());
    final result = await getAccountUseCase.getAccount();
    result.map(
        success: (account) => {
              if (account.list.isNotEmpty)
                {
                  emit(AccountScreenState.authorized(
                      account: account.list.first))
                }
              else
                {emit(const AccountScreenState.notAuthorized())}
            },
        failure: (error) => emit(
            AccountScreenState.failure(error: error.error, textError: '')));
  }

  Future<void> initFireBaseStream() async {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      print("$event");
      if (event != null) {
        if (!event.emailVerified) {
          print("notVerified");
          emit(const AccountScreenState.confirmation());
        }
      }
    });
  }

  Future<void> auth(String login, String password) async {
    print("auth");
    emit(const AccountScreenState.loading());
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: login.trim(),
        password: password.trim(),
      );
      final Directory tempDir = await getApplicationDocumentsDirectory();
      _saveAccount(Account(
          id: user.user!.uid,
          name: user.user?.email ?? "",
          img: '${tempDir.path}/assets/images/default_account_logo.png'));
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(const AccountScreenState.failureForSnackBar(
            textError: 'Неправильный email или пароль. Повторите попытку'));
        emit(const AccountScreenState.notAuthorized());
      } else {
        emit(const AccountScreenState.failureForSnackBar(
            textError:
                'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.'));
        emit(const AccountScreenState.notAuthorized());
      }
    }
  }

  Future<void> registeration(String login, String password) async {
    print("registeration");
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: login.trim(),
        password: password.trim(),
      );
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      _registerTimerForWaitVerification();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        emit(const AccountScreenState.failureForSnackBar(
            textError:
                'Такой Email уже используется, повторите попытку с использованием другого Email'));
      } else {
        emit(const AccountScreenState.failureForSnackBar(
            textError:
                'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.'));
      }
    }
  }

  Future<void> _registerTimerForWaitVerification() async {
    Timer.periodic(const Duration(seconds: 4), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      var user = FirebaseAuth.instance.currentUser!;
      if (user.emailVerified) {
        final Directory tempDir = await getApplicationDocumentsDirectory();
        _saveAccount(Account(
            id: user.uid,
            name: user.email ?? "",
            img: '${tempDir.path}/assets/images/default_account_logo.png'));
        timer.cancel();
      }
    });
  }

  Future<void> _saveAccount(Account account) async {
    emit(const AccountScreenState.loading());
    final result = await saveAccountUsecase.saveAccount(account);
    result.map(
        success: (succ) =>
            emit(AccountScreenState.authorized(account: account)),
        failure: (error) => emit(
            AccountScreenState.failure(error: error.error, textError: '')));
  }

  Future<void> exit() async{
   final result = await exitFromAccountUsecase.exitFromAccount();
   await FirebaseAuth.instance.signOut();
   result.map(
       success: (succ) =>
           emit(const AccountScreenState.notAuthorized()),
       failure: (error) => emit(
           AccountScreenState.failure(error: error.error, textError: '')));
  }

}
