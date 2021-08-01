// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSettingsResponse _$SiteSettingsResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteSettingsResponse()
    ..Id = json['Id'] as int
    ..SiteTitle = json['SiteTitle'] as String? ?? ''
    ..SiteSlogan = json['SiteSlogan'] as String?
    ..SiteSummary = json['SiteSummary'] as String?
    ..SiteNotice = json['SiteNotice'] as String?
    ..SiteUrl = json['SiteUrl'] as String?
    ..APIUrl = json['APIUrl'] as String?
    ..DocumentBaseUrl = json['DocumentBaseUrl'] as String?
    ..LogoPath = json['LogoPath'] as String?
    ..MobileLogoPath = json['MobileLogoPath'] as String?
    ..SocialLogoPath = json['SocialLogoPath'] as String?
    ..FaviconPath = json['FaviconPath'] as String?
    ..Email = json['Email'] as String?
    ..Mobile = json['Mobile'] as String?
    ..HotLine = json['HotLine'] as String?
    ..AndroidAppUrl = json['AndroidAppUrl'] as String?
    ..IOSAppUrl = json['IOSAppUrl'] as String?
    ..MetaKeywords = json['MetaKeywords'] as String?
    ..MetaDescription = json['MetaDescription'] as String?
    ..MetaAuthor = json['MetaAuthor'] as String?
    ..CurrencyIcon = json['CurrencyIcon'] as String?
    ..Currency = json['Currency'] as String?
    ..Language = json['Language'] as String?
    ..DeliveryCharge = (json['DeliveryCharge'] as num?)?.toDouble()
    ..DeliveryChargeFreeAmount =
        (json['DeliveryChargeFreeAmount'] as num?)?.toDouble()
    ..GoogleAnalyticsId = json['GoogleAnalyticsId'] as String?
    ..FacebookAppId = json['FacebookAppId'] as String?
    ..DeliveryFrom = json['DeliveryFrom'] as int?
    ..DeliveryTo = json['DeliveryTo'] as int?
    ..IsDefault = json['IsDefault'] as bool?
    ..TermsAndConditionURL = json['TermsAndConditionURL'] as String?
    ..PrivacyPolicyURL = json['PrivacyPolicyURL'] as String?
    ..IsECommerce = json['IsECommerce'] as bool?
    ..IsUsePoint = json['IsUsePoint'] as bool?
    ..TenantId = json['TenantId'] as int?
    ..Address = json['Address'] == null
        ? null
        : SiteAddress.fromJson(json['Address'] as Map<String, dynamic>)
    ..SocialAddress = json['SocialAddress'] == null
        ? null
        : SiteSocialAddress.fromJson(
            json['SocialAddress'] as Map<String, dynamic>)
    ..ApplicationPolicy = json['ApplicationPolicy'] == null
        ? null
        : SiteApplicationPolicy.fromJson(
            json['ApplicationPolicy'] as Map<String, dynamic>)
    ..BankDetails = (json['BankDetails'] as List<dynamic>?)
            ?.map((e) => SiteBankDetails.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..FooterMenus = (json['FooterMenus'] as List<dynamic>?)
            ?.map((e) => SiteFooterMenu.fromJson(e as Map<String, dynamic>))
            .toList() ??
        []
    ..MediaConfiguration = (json['MediaConfiguration'] as List<dynamic>?)
            ?.map((e) =>
                SiteMediaConfiguration.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
}

Map<String, dynamic> _$SiteSettingsResponseToJson(
        SiteSettingsResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'SiteTitle': instance.SiteTitle,
      'SiteSlogan': instance.SiteSlogan,
      'SiteSummary': instance.SiteSummary,
      'SiteNotice': instance.SiteNotice,
      'SiteUrl': instance.SiteUrl,
      'APIUrl': instance.APIUrl,
      'DocumentBaseUrl': instance.DocumentBaseUrl,
      'LogoPath': instance.LogoPath,
      'MobileLogoPath': instance.MobileLogoPath,
      'SocialLogoPath': instance.SocialLogoPath,
      'FaviconPath': instance.FaviconPath,
      'Email': instance.Email,
      'Mobile': instance.Mobile,
      'HotLine': instance.HotLine,
      'AndroidAppUrl': instance.AndroidAppUrl,
      'IOSAppUrl': instance.IOSAppUrl,
      'MetaKeywords': instance.MetaKeywords,
      'MetaDescription': instance.MetaDescription,
      'MetaAuthor': instance.MetaAuthor,
      'CurrencyIcon': instance.CurrencyIcon,
      'Currency': instance.Currency,
      'Language': instance.Language,
      'DeliveryCharge': instance.DeliveryCharge,
      'DeliveryChargeFreeAmount': instance.DeliveryChargeFreeAmount,
      'GoogleAnalyticsId': instance.GoogleAnalyticsId,
      'FacebookAppId': instance.FacebookAppId,
      'DeliveryFrom': instance.DeliveryFrom,
      'DeliveryTo': instance.DeliveryTo,
      'IsDefault': instance.IsDefault,
      'TermsAndConditionURL': instance.TermsAndConditionURL,
      'PrivacyPolicyURL': instance.PrivacyPolicyURL,
      'IsECommerce': instance.IsECommerce,
      'IsUsePoint': instance.IsUsePoint,
      'TenantId': instance.TenantId,
      'Address': instance.Address,
      'SocialAddress': instance.SocialAddress,
      'ApplicationPolicy': instance.ApplicationPolicy,
      'BankDetails': instance.BankDetails,
      'FooterMenus': instance.FooterMenus,
      'MediaConfiguration': instance.MediaConfiguration,
    };
