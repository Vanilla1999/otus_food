
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';
part 'network_response.g.dart';

@Freezed(genericArgumentFactories: true)
class NetworkResponse <T> with _$NetworkResponse <T> {
  @JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
  factory NetworkResponse({
    @JsonKey(name: 'meals') List<T>? recipes,
  }) = _NetworkResponse;

  factory NetworkResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NetworkResponseFromJson(json,fromJsonT);
}

