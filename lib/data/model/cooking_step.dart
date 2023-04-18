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

extension TimeToString on int {
  String timeToString() {
    if (this / 10 >= 1) {
      return "$this:00";
    }else {
      return "0$this:00";
    }
  }
}
