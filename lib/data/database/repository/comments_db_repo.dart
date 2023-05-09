import 'package:otus_food/data/database/datasource/hive_datasource.dart';
import 'package:otus_food/data/database/dto/comment_hive.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/main.dart';

class MockCommentRepo extends CommentDbRepo {
  @override
  Future<List<Comment>> getCommentsByRecipeId(int recipeId) {
    return Future(() => [
      Comment(
              id: 1,
              recipeId: 1,
              accountId: "1",
              time:1682091139000,
              text:
                  "Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!",
              img: ["assets/images/comment_image.jpg"], accountName: "annna_obrazsova", accountImg: "assets/images/account_image.jpg"),
      Comment(
              id: 1,
              recipeId: 1,
              accountId: "1",
              time:1682091139000,
              text:
                  "Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!",
              img: ["assets/images/comment_image.jpg"], accountName: "annna_obrazsova", accountImg: "assets/images/account_image.jpg"),
        ]);
  }

  @override
  Future<void> saveComment(Comment commentHive) async{

  }
}

class CommentDbRepoImpl extends CommentDbRepo{

  final HiveDataSource _hiveDataSource = getIt<HiveDataSource>();

  @override
  Future<List<Comment>> getCommentsByRecipeId(int recipeId) async{
    final comments = await _hiveDataSource.getCommentsByRecipeId(recipeId);
    return comments.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> saveComment(Comment comment) async {
   await _hiveDataSource.saveComment(comment.toDb());
  }

}

abstract class CommentDbRepo {
  Future<List<Comment>> getCommentsByRecipeId(int recipeId);
  Future<void> saveComment(Comment comment);
}
