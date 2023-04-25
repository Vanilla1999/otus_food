import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_id_network.freezed.dart';
part 'recipe_id_network.g.dart';

@freezed
class RecipeIdNetwork with _$RecipeIdNetwork {
  @JsonSerializable(explicitToJson: true)
  factory RecipeIdNetwork({
    @JsonKey(name: 'strMeal') String? name,
    @JsonKey(name: 'strMealThumb') String? urlImage,
    @JsonKey(name: 'idMeal') String? idRecipe,
  }) = _RecipeIdNetwork;

  factory RecipeIdNetwork.fromJson(Map<String, dynamic> json) =>
      _$RecipeIdNetworkFromJson(json);
}
