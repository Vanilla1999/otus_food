import 'package:json_annotation/json_annotation.dart';
import 'package:otus_food/data/network/dto/recipe_id_network.dart';
import 'package:otus_food/data/network/dto/network_response.dart';
import 'package:otus_food/data/network/dto/recipe_network.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_client.g.dart';

@RestApi()
abstract class NetworkClient {
  factory NetworkClient(Dio dio, {String baseUrl}) = _NetworkClient;

  @GET("/filter.php?a=Canadian")
  Future<NetworkResponse<RecipeIdNetwork>> getRecipes();

  @GET("/lookup.php?i={id}")
  Future<NetworkResponse<RecipeNetwork>> getRecipeById(@Path('id') int id);
}
