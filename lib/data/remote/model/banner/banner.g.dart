// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return Banner()
    ..Id = json['Id'] as int
    ..HeadTitle = json['HeadTitle'] as String?
    ..Title = json['Title'] as String?
    ..Summary = json['Summary'] as String?
    ..ActualPrice = (json['ActualPrice'] as num?)?.toDouble()
    ..DiscountPrice = (json['DiscountPrice'] as num?)?.toDouble()
    ..ImageId = json['ImageId'] as int?
    ..ImageUrl = json['ImageUrl'] as String?
    ..ButtonText = json['ButtonText'] as String?
    ..Type = json['Type'] as String?
    ..Link = json['Link'] as String?
    ..ColorCode = json['ColorCode'] as String?
    ..BackgroundColorCode = json['BackgroundColorCode'] as String?
    ..Sequence = json['Sequence'] as int?
    ..Reference = json['Reference'] as String?
    ..Language = json['Language'] as String?
    ..Status = json['Status'] as String?;
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'Id': instance.Id,
      'HeadTitle': instance.HeadTitle,
      'Title': instance.Title,
      'Summary': instance.Summary,
      'ActualPrice': instance.ActualPrice,
      'DiscountPrice': instance.DiscountPrice,
      'ImageId': instance.ImageId,
      'ImageUrl': instance.ImageUrl,
      'ButtonText': instance.ButtonText,
      'Type': instance.Type,
      'Link': instance.Link,
      'ColorCode': instance.ColorCode,
      'BackgroundColorCode': instance.BackgroundColorCode,
      'Sequence': instance.Sequence,
      'Reference': instance.Reference,
      'Language': instance.Language,
      'Status': instance.Status,
    };
