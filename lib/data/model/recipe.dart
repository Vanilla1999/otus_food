import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    required int id,
    required String name,
    required String time,
    required String img,
  }) = _Recipe;
}