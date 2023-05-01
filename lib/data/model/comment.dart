import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/comment_hive.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    required int recipeId,
    required String accountId,
    required String accountName,
    required String accountImg,
    required String text,
    required int time,
    required String img,
  }) = _Comment;
}

extension ModelToDb on Comment {
  CommentHive toDb() {
    return CommentHive(
        id: id,
        recipeId: recipeId,
        accountId: accountId,
        text: text,
        img: img,
        time: time,
        accountImg: accountImg,
        accountName: accountName);
  }
}
