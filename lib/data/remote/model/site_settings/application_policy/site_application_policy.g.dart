// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_application_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteApplicationPolicy _$SiteApplicationPolicyFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteApplicationPolicy()
    ..Id = json['Id'] as int
    ..MinimumPasswordLength = json['MinimumPasswordLength'] as int?
    ..UserPointOnRegistration =
        (json['UserPointOnRegistration'] as num?)?.toDouble()
    ..RequiredPointOnPostProduct =
        (json['RequiredPointOnPostProduct'] as num?)?.toDouble()
    ..RequiredPointOnPlaceBidding =
        (json['RequiredPointOnPlaceBidding'] as num?)?.toDouble()
    ..ConversionRate = (json['ConversionRate'] as num?)?.toDouble()
    ..ServiceChargeId = json['ServiceChargeId'] as int?
    ..IsDefault = json['IsDefault'] as bool?
    ..HasServiceCharge = json['HasServiceCharge'] as bool?
    ..HasAddToCart = json['HasAddToCart'] as bool?
    ..HasBargain = json['HasBargain'] as bool?
    ..BargainFactor = (json['BargainFactor'] as num?)?.toDouble()
    ..HasBuyNow = json['HasBuyNow'] as bool?
    ..HasPostItem = json['HasPostItem'] as bool?
    ..HasLanguage = json['HasLanguage'] as bool?;
}

Map<String, dynamic> _$SiteApplicationPolicyToJson(
        SiteApplicationPolicy instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'MinimumPasswordLength': instance.MinimumPasswordLength,
      'UserPointOnRegistration': instance.UserPointOnRegistration,
      'RequiredPointOnPostProduct': instance.RequiredPointOnPostProduct,
      'RequiredPointOnPlaceBidding': instance.RequiredPointOnPlaceBidding,
      'ConversionRate': instance.ConversionRate,
      'ServiceChargeId': instance.ServiceChargeId,
      'IsDefault': instance.IsDefault,
      'HasServiceCharge': instance.HasServiceCharge,
      'HasAddToCart': instance.HasAddToCart,
      'HasBargain': instance.HasBargain,
      'BargainFactor': instance.BargainFactor,
      'HasBuyNow': instance.HasBuyNow,
      'HasPostItem': instance.HasPostItem,
      'HasLanguage': instance.HasLanguage,
    };
