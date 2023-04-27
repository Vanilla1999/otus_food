import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_cubit.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';
import 'package:otus_food/presentation/recipe_list_screen/widgets/recipe_list_widget.dart';
import 'package:otus_food/utils/colors.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.defaultBackground,
        body: BlocBuilder<RecipeListCubit, RecipeListState>(
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, RecipeListState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (recipeList) => RecipeListWidget(
          recipeList: recipeList,
        ),
        failure: (error) => Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
