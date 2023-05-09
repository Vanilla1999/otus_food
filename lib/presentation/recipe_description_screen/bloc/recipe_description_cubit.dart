import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';
import 'package:otus_food/data/model/ingredient.dart';
import 'package:otus_food/data/model/recipe.dart';
import 'package:otus_food/domain/get_account.dart';
import 'package:otus_food/domain/get_comments_by_recipe_id.dart';
import 'package:otus_food/domain/save_comment_usecase.dart';
import 'package:otus_food/main.dart';

import 'recipe_description_state.dart';

class RecipeDescriptionCubit extends Cubit<RecipeDescriptionState> {
  RecipeDescriptionCubit() : super(const RecipeDescriptionState.loading());
  GetCommentsByRecipeId getCommentsByRecipeId = getIt<GetCommentsByRecipeId>();
  SaveCommentUseCase _commentUseCase = getIt<SaveCommentUseCase>();
  Recipe? _recipe;
  List<Comment> _comments = [];

  Future<void> initialData(Recipe recipe) async {
    final result = await getCommentsByRecipeId.getCommentsByRecipeId(recipe.id);
    result.when(
        success: (comments) {
          _recipe = recipe;
          _comments.addAll(comments);
          emit(RecipeDescriptionState.successPrepareCooking(
              recipe: recipe, comments: comments));
        },
        failure: (error) => emit(RecipeDescriptionState.failure(error: error)));
  }

  void startCooking() {
    emit(RecipeDescriptionState.successStartCooking(recipe: _recipe!));
  }

  Future<void> addNewComment(String comment, List<String> imgs) async {
    final result = await _commentUseCase.saveComment(Comment(
        id: 0,
        recipeId: _recipe!.id,
        accountId: "null",
        text: comment,
        time: DateTime.now().millisecondsSinceEpoch,
        img: imgs,
        accountName: "Не авторизированный пользователь",
        accountImg: 'assets/images/account_image.jpg'),_recipe!.id);
    result.when(
        success: () async {
          final result =
              await getCommentsByRecipeId.getCommentsByRecipeId(_recipe!.id);
          result.when(
              success: (comments) {
                emit(RecipeDescriptionState.addNewComment(
                    comments: comments.toList()));
              },
              failure: (error) =>
                  emit(RecipeDescriptionState.failure(error: error)));
        },
        failure: (error) => emit(RecipeDescriptionState.failure(error: error)));
  }

  Future<void> removeFromDisk(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
      print("removed $path");
    }
  }
}
