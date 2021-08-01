// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_social_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSocialAddress _$SiteSocialAddressFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteSocialAddress()
    ..Id = json['Id'] as int
    ..FacebookURL = json['FacebookURL'] as String?
    ..InstagramURL = json['InstagramURL'] as String?
    ..YoutubeURL = json['YoutubeURL'] as String?
    ..LinkedinURL = json['LinkedinURL'] as String?
    ..TwitterURL = json['TwitterURL'] as String?;
}

Map<String, dynamic> _$SiteSocialAddressToJson(SiteSocialAddress instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'FacebookURL': instance.FacebookURL,
      'InstagramURL': instance.InstagramURL,
      'YoutubeURL': instance.YoutubeURL,
      'LinkedinURL': instance.LinkedinURL,
      'TwitterURL': instance.TwitterURL,
    };
