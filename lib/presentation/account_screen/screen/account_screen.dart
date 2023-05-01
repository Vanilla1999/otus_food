import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/navigation/screen_factory.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_cubit.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_state.dart';
import 'package:otus_food/presentation/account_screen/widgets/authorized_widget.dart';
import 'package:otus_food/presentation/account_screen/widgets/not_authorized.dart';
import 'package:otus_food/presentation/account_screen/widgets/sing_up_widget.dart';
import 'package:otus_food/presentation/components/snack_bar_service.dart';
import 'package:otus_food/utils/colors.dart';
import 'package:otus_food/utils/flutter-icons-1f06c6de/my_flutter_app_icons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.defaultBackground,
        body: BlocConsumer<AccountScreenCubit, AccountScreenState>(
          builder: _builder,
          buildWhen: (previous, current) {
            return current.maybeMap(failureForSnackBar: (comments) {
              return false;
            }, orElse: () {
              return true;
            });
          },
          listenWhen: (previous, current) {
            return current.maybeMap(failureForSnackBar: (comments) {
              return true;
            }, orElse: () {
              return false;
            });
          },
          listener: _listener,
        ),
      ),
    );
  }

  void _listener(BuildContext context, AccountScreenState state) {
    state.maybeMap(
        failureForSnackBar: (textError) => SnackBarService.showSnackBar(
              context,
              textError.textError,
              true,
            ),
        orElse: () {});
  }

  Widget _builder(BuildContext context, AccountScreenState state) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          authorized: (account) => Authorized(
            cubit: context.read<AccountScreenCubit>(), account: account,
          ),
          failure: (error, textError) {
            return Container(
              color: Colors.red,
            );
          },
          confirmation: () => const Center(child: Text("Поддтвердите адрес электронной почты"),),
          notAuthorized: () =>
              NotAuthorized(cubit: context.read<AccountScreenCubit>()),
          orElse: () => Container(
            color: Colors.red,
          ),
        ));
  }
}
