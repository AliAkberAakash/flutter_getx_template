// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return TokenResponse()
    ..expiresIn = json['expires_in'] as int?
    ..accessToken = json['access_token'] as String?
    ..tokenType = json['token_type'] as String?;
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
