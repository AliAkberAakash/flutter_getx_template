// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_footer_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteFooterMenu _$SiteFooterMenuFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteFooterMenu()
    ..Id = json['Id'] as int
    ..PageTitle = json['PageTitle'] as String?
    ..PageContent = json['PageContent'] as String?
    ..PageBannerUrl = json['PageBannerUrl'] as String?
    ..ImageId = json['ImageId'] as int?
    ..Link = json['Link'] as String?
    ..Slug = json['Slug'] as String?
    ..CategoryId = json['CategoryId'] as int?
    ..Placement = json['Placement'] as int?
    ..CategorySequence = json['CategorySequence'] as int?
    ..Sequence = json['Sequence'] as int?
    ..PageType = json['PageType'] as String?
    ..Param = json['Param'] as String?
    ..IsSystemRequired = json['IsSystemRequired'] as bool?
    ..Status = json['Status'] as String?
    ..CategoryName = json['CategoryName'] as String?;
}

Map<String, dynamic> _$SiteFooterMenuToJson(SiteFooterMenu instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'PageTitle': instance.PageTitle,
      'PageContent': instance.PageContent,
      'PageBannerUrl': instance.PageBannerUrl,
      'ImageId': instance.ImageId,
      'Link': instance.Link,
      'Slug': instance.Slug,
      'CategoryId': instance.CategoryId,
      'Placement': instance.Placement,
      'CategorySequence': instance.CategorySequence,
      'Sequence': instance.Sequence,
      'PageType': instance.PageType,
      'Param': instance.Param,
      'IsSystemRequired': instance.IsSystemRequired,
      'Status': instance.Status,
      'CategoryName': instance.CategoryName,
    };
