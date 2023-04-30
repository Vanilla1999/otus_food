import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/navigation/screen_factory.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_cubit.dart';
import 'package:otus_food/presentation/account_screen/bloc/account_screen_state.dart';
import 'package:otus_food/presentation/account_screen/widgets/not_authorized.dart';
import 'package:otus_food/utils/colors.dart';
import 'package:otus_food/utils/flutter-icons-1f06c6de/my_flutter_app_icons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.defaultBackground,
        body: BlocBuilder<AccountScreenCubit, AccountScreenState>(
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, AccountScreenState state) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          authorized: (account) =>
              const Center(child: CircularProgressIndicator()),
          failure: (error) => Container(
            color: Colors.red,
          ),
          confirmation: () {},
          notAuthorized: () => NotAuthorized(cubit:context.read<AccountScreenCubit>()),
        ));
  }
}
