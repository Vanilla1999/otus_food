
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_step.freezed.dart';



@freezed
class CookingStep with _$CookingStep {
  factory CookingStep({
    required int recipeId,
    required int numberStep,
    required String description,
  required int time,
  }) = _CookingStep;
}