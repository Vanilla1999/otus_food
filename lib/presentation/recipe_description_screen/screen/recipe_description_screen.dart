import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/appbar_description.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_cubit.dart';
import 'package:otus_food/presentation/recipe_list_screen/bloc/recipe_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/presentation/recipe_list_screen/widgets/recipe_list_widget.dart';
import 'package:otus_food/utils/colors.dart';
import 'package:otus_food/utils/images.dart';

class RecipeDescriptionScreen extends StatelessWidget {
  const RecipeDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return WillPopScope(
      onWillPop: () async{
        changeSystemColor(ColorsApp.defaultBackground);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const AppbarDescription(),
          backgroundColor: ColorsApp.defaultBackground,
          body: BlocBuilder<RecipeListCubit, RecipeListState>(
            builder: _builder,
          ),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, RecipeListState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: state.when(
        loading: () => const CircularProgressIndicator(),
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
