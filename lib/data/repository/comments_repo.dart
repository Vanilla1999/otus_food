import 'package:otus_food/data/model/comment.dart';

class MockCommentRepo extends CommentRepo {
  @override
  Future<List<Comment>> getCommentsByRecipeId(int recipeId) {
    return Future(() => [
          Comment(
              id: 1,
              recipeId: 1,
              accountId: 1,
              time:1682091139000,
              text:
                  "Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!",
              img: "assets/images/comment_image.jpg"),
          Comment(
              id: 1,
              recipeId: 1,
              accountId: 1,
              time:1682091139000,
              text:
                  "Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!",
              img: "assets/images/comment_image.jpg"),
        ]);
  }
}

abstract class CommentRepo {
  Future<List<Comment>> getCommentsByRecipeId(int recipeId);
}
