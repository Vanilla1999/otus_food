import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/model/comment.dart';
import 'package:otus_food/data/model/cooking_step.dart';

part 'comment_hive.freezed.dart';
part 'comment_hive.g.dart';

@freezed
class CommentHive with _$CommentHive {
  @HiveType(typeId: 4)
  factory CommentHive({
    @HiveField(0)required int id,
    @HiveField(1) required int recipeId,
    @HiveField(2)required int accountId,
    @HiveField(3)required String accountName,
    @HiveField(4)required String accountImg,
    @HiveField(5)required String text,
    @HiveField(6) required int time,
    @HiveField(7) required String img,
  }) = _CommentHive;
}
extension DbToModel on CommentHive {
  Comment toModel() {
    return Comment(
      id:id,
      recipeId: recipeId,
      accountId: accountId,
      accountName: accountName,
      accountImg: accountImg,
      text: text,
      img: img,
      time:time
    );
  }
}