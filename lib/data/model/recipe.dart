import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    required int id,
    required String name,
    required int time,
    required String img,
  }) = _Recipe;
}
