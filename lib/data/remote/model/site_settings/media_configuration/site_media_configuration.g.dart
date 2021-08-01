// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_media_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteMediaConfiguration _$SiteMediaConfigurationFromJson(
    Map<String, dynamic> json) {
  return SiteMediaConfiguration()
    ..Entity = json['Entity'] as String?
    ..Category = json['Category'] as String?
    ..Width = json['Width'] as int?
    ..Height = json['Height'] as int?
    ..Size = json['Size'] as int?
    ..IsDefault = json['IsDefault'] as bool?
    ..WithWatermark = json['WithWatermark'] as bool?
    ..Extension =
        (json['Extension'] as List<dynamic>).map((e) => e as String).toList();
}

Map<String, dynamic> _$SiteMediaConfigurationToJson(
        SiteMediaConfiguration instance) =>
    <String, dynamic>{
      'Entity': instance.Entity,
      'Category': instance.Category,
      'Width': instance.Width,
      'Height': instance.Height,
      'Size': instance.Size,
      'IsDefault': instance.IsDefault,
      'WithWatermark': instance.WithWatermark,
      'Extension': instance.Extension,
    };
