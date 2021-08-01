import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TokenResponse {
  @JsonKey(defaultValue: null)
  late int? expiresIn;

  @JsonKey(defaultValue: null)
  late String? accessToken;

  @JsonKey(defaultValue: null)
  late String? tokenType;

  TokenResponse();

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
