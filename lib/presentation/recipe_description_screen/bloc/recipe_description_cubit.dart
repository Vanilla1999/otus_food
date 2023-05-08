import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/domain/get_comments_by_recipe_id.dart';
import 'package:otus_food/main.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState> {
  RecipeDescriptionCubit() : super(const RecipeDescriptionState.loading());
  GetCommentsByRecipeId getCommentsByRecipeId =
  getIt<GetCommentsByRecipeId>();
  Recipe? _recipe;
  List<Comment> _comments = [];

  Future<void> initialData(Recipe recipe) async {
    final result = await getCommentsByRecipeId
        .getCommentsByRecipeId(recipe.id);
    result.when(
        success: (comments) {
          _recipe = recipe;
          _comments.addAll(comments);
          emit(RecipeDescriptionState.successPrepareCooking(
              recipe: recipe,
              comments: comments));
        },
        failure: (error) => emit(RecipeDescriptionState.failure(error: error)));
  }

  void startCooking() {
    emit(RecipeDescriptionState.successStartCooking(
        recipe: _recipe!));
  }

  Future<void> addNewComment(String comment, String img) async {
    //save to bd/sendToNetwork
    _comments.add(Comment(
        id: 0,
        recipeId: 0,
        accountId: "1",
        text: comment,
        time: DateTime
            .now()
            .millisecondsSinceEpoch,
        img: img,
        accountName: 'Vanilla',
        accountImg: 'assets/images/account_image.jpg'));
    emit(RecipeDescriptionState.addNewComment(comments: _comments.toList()));
  }

  Future<void> removeFromDisk(String path)async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
      print("removed $path");
    }
  }

}
