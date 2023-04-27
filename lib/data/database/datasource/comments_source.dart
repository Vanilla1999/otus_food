part of 'hive_datasource.dart';

class CommentSource {
  Future<List<CommentHive>> getCommentsByRecipeId(int recipeId) async {
    final Box<CommentHive> commentBox;
    commentBox = await Hive.openBox<CommentHive>(commentBoxName);
    return commentBox.values
        .where((element) => element.recipeId == recipeId)
        .toList();
  }

  Future<void> saveComment(CommentHive comment) async {
    final Box<CommentHive> commentBox;
    commentBox = await Hive.openBox<CommentHive>(commentBoxName);
    commentBox.add(comment);
  }

  Future<void> clearComments() async {
    final Box<CommentHive> commentBox;
    commentBox = await Hive.openBox<CommentHive>(commentBoxName);
    commentBox.clear();
  }
}
