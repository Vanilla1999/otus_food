import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    required int recipeId,
    required int accountId,
    required String text,
    required int time,
    required String img,
  }) = _Comment;
}