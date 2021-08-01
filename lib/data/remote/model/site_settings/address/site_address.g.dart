// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteAddress _$SiteAddressFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteAddress()
    ..Id = json['Id'] as int
    ..Title = json['Title'] as String?
    ..Name = json['Name'] as String?
    ..Type = json['Type'] as String?
    ..Email = json['Email'] as String?
    ..Mobile = json['Mobile'] as String?
    ..CountryCode = json['CountryCode'] as String?
    ..DivisionId = json['DivisionId'] as int?
    ..DistrictId = json['DistrictId'] as int?
    ..ThanaId = json['ThanaId'] as int?
    ..UnionId = json['UnionId'] as int?
    ..Address1 = json['Address1'] as String?
    ..Address2 = json['Address2'] as String?
    ..PlaceId = json['PlaceId'] as int?
    ..Latitude = (json['Latitude'] as num?)?.toDouble()
    ..Longitude = (json['Longitude'] as num?)?.toDouble()
    ..IsDefault = json['IsDefault'] as bool?
    ..DivisionName = json['DivisionName'] as String?
    ..DistrictName = json['DistrictName'] as String?
    ..ThanaName = json['ThanaName'] as String?
    ..UnionName = json['UnionName'] as String?;
}

Map<String, dynamic> _$SiteAddressToJson(SiteAddress instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'Name': instance.Name,
      'Type': instance.Type,
      'Email': instance.Email,
      'Mobile': instance.Mobile,
      'CountryCode': instance.CountryCode,
      'DivisionId': instance.DivisionId,
      'DistrictId': instance.DistrictId,
      'ThanaId': instance.ThanaId,
      'UnionId': instance.UnionId,
      'Address1': instance.Address1,
      'Address2': instance.Address2,
      'PlaceId': instance.PlaceId,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'IsDefault': instance.IsDefault,
      'DivisionName': instance.DivisionName,
      'DistrictName': instance.DistrictName,
      'ThanaName': instance.ThanaName,
      'UnionName': instance.UnionName,
    };
