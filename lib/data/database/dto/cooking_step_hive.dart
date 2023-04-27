import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/data/model/cooking_step.dart';

part 'cooking_step_hive.freezed.dart';

part 'cooking_step_hive.g.dart';

@freezed
class CookingStepHive with _$CookingStepHive {
  @HiveType(typeId: 3)
  factory CookingStepHive({
    @HiveField(0) required int recipeId,
    @HiveField(1) required int numberStep,
    @HiveField(2) required String description,
    @HiveField(3) required int time,
  }) = _CookingStepHive;
}

extension DbToModel on CookingStepHive {
  CookingStep toModel() {
    return CookingStep(
      recipeId: recipeId,
      numberStep: numberStep,
      description: description,
      time: time,
    );
  }
}
