import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_state.dart';
import 'package:otus_food/presentation/recipe_description_screen/screen/recipe_description_prepare.dart';
import 'package:otus_food/presentation/recipe_description_screen/screen/recipe_description_start.dart';
import 'package:otus_food/utils/colors.dart';

class RecipeDescriptionScreen extends StatelessWidget {
  RecipeDescriptionScreen({Key? key}) : super(key: key);
  final ValueNotifier<List<Comment>> valueNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return WillPopScope(
      onWillPop: () async {
        changeSystemColor(ColorsApp.defaultBackground);
        return true;
      },
      child: SafeArea(
          child: BlocConsumer<RecipeDescriptionCubit, RecipeDescriptionState>(
        builder: _builder,
        buildWhen: (previous, current) {
          return current.maybeMap(addNewComment: (comments) {
            return false;
          }, orElse: () {
            return true;
          });
        },
        listenWhen: (previous, current) {
          return current.maybeMap(addNewComment: (comments) {
            return true;
          }, orElse: () {
            return false;
          });
        },
        listener: _listener,
      )),
    );
  }

  void _listener(BuildContext context, RecipeDescriptionState state) {
    state.maybeMap(
        addNewComment: (comments) => valueNotifier.value = comments.comments,
        orElse: () {});
  }

  Widget _builder(BuildContext context, RecipeDescriptionState state) {
    return state.maybeWhen(
      loading: () => const CircularProgressIndicator(),
      successPrepareCooking:
          (recipe, ingredients, cookingSteps, comments, accounts) {
        valueNotifier.value = comments;
        return RecipeDescriptionPrepare(
          recipe: recipe,
          ingredients: ingredients,
          cookingSteps: cookingSteps,
          comments: comments,
          accounts: accounts,
          cubit: context.read<RecipeDescriptionCubit>(),
          valueNotifier: valueNotifier,
        );
      },
      failure: (error) => Container(
        color: Colors.red,
      ),
      successStartCooking: (recipe, ingredients, cookingSteps) =>
          RecipeDescriptionStart(
        recipe: recipe,
        ingredients: ingredients,
        cookingSteps: cookingSteps,
        cubit: context.read<RecipeDescriptionCubit>(),
      ),
      orElse: () => Container(
        color: Colors.red,
      ),
    );
  }
}
