import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:otus_food/domain/get_account.dart';
import 'package:otus_food/domain/get_recipe_usecase.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_state.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';

class AccountScreenCubit extends Cubit<AccountScreenState> {
  AccountScreenCubit() : super(const AccountScreenState.loading());

  final GetAccount getAccountUseCase = getIt<GetAccount>();

  Future<void> initialData() async {
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
        failure: (error) =>
            emit(AccountScreenState.failure(error: error.error)));
  }

  Future<void> auth(String login, String password) async {
    print("auth");
    // final result = await getAccountUseCase.getAccount();
  }
}
