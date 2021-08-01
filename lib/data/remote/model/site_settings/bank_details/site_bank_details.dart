import 'package:json_annotation/json_annotation.dart';

part 'site_bank_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteBankDetails {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late String? BankName;

  @JsonKey(defaultValue: null)
  late String? AccountName;

  @JsonKey(defaultValue: null)
  late String? AccountNo;

  @JsonKey(defaultValue: null)
  late int? RoutingNo;

  @JsonKey(defaultValue: null)
  late String? Branch;

  @JsonKey(defaultValue: null)
  late String? Address;

  @JsonKey(defaultValue: null)
  late String? Remarks;

  @JsonKey(defaultValue: null)
  late int? UserId;

  @JsonKey(defaultValue: null)
  late String? Status;

  SiteBankDetails();

  factory SiteBankDetails.fromJson(Map<String, dynamic> json) =>
      _$SiteBankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SiteBankDetailsToJson(this);
}
