import 'package:flutter/material.dart';
import 'package:otus_food/data/model/account.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/presentation/recipe_description_screen/bloc/recipe_description_cubit.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/comments_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/description_prepare_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/ingridients_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/appbar_description_prepare.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/cooking_steps_widget.dart';
import 'package:otus_food/presentation/recipe_description_screen/widgets/prepare_cooking/start_cooking_button_widget.dart';

class RecipeDescriptionPrepare extends StatelessWidget {
  final Recipe recipe;
  final List<Comment> comments;
  final ValueNotifier<List<Comment>> valueNotifier;
  final RecipeDescriptionCubit cubit;
 final ScrollController _controller = ScrollController();
   RecipeDescriptionPrepare({
    Key? key,
    required this.recipe,
    required this.comments,
    required this.cubit,
    required this.valueNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppbarDescription(),
      backgroundColor: Colors.white,
      body: ListView(
        controller: _controller,
          physics: const BouncingScrollPhysics(), children: [
        DescriptionPrepareWidget(
          recipe: recipe,
          cubit: cubit,
        ),
        IngridientsWidget(ingredients: recipe.ingredients),
        CookingStepsWidget(cookingSteps: recipe.cookingSteps),
        StartCookingButtonWidget(
          cubit: cubit,
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: const Color(0xff797676),
        ),
        CommentsWidget(
          comments: comments,
          cubit: cubit,
          valueNotifier: valueNotifier,
            scrollController:_controller
        )
      ]),
    );
  }
}
