// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteBankDetails _$SiteBankDetailsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return SiteBankDetails()
    ..Id = json['Id'] as int
    ..BankName = json['BankName'] as String?
    ..AccountName = json['AccountName'] as String?
    ..AccountNo = json['AccountNo'] as String?
    ..RoutingNo = json['RoutingNo'] as int?
    ..Branch = json['Branch'] as String?
    ..Address = json['Address'] as String?
    ..Remarks = json['Remarks'] as String?
    ..UserId = json['UserId'] as int?
    ..Status = json['Status'] as String?;
}

Map<String, dynamic> _$SiteBankDetailsToJson(SiteBankDetails instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'BankName': instance.BankName,
      'AccountName': instance.AccountName,
      'AccountNo': instance.AccountNo,
      'RoutingNo': instance.RoutingNo,
      'Branch': instance.Branch,
      'Address': instance.Address,
      'Remarks': instance.Remarks,
      'UserId': instance.UserId,
      'Status': instance.Status,
    };
