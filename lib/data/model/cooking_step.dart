import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/data/database/dto/cooking_step_hive.dart';

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

extension ModelToDb on CookingStep {
  CookingStepHive toDb() {
    return CookingStepHive(
      recipeId: recipeId,
      numberStep: numberStep,
      description: description,
      time: time,
    );
  }
}
