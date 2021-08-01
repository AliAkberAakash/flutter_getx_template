import 'package:json_annotation/json_annotation.dart';

part 'site_address.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteAddress {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late String? Title;

  @JsonKey(defaultValue: null)
  late String? Name;

  @JsonKey(defaultValue: null)
  late String? Type;

  @JsonKey(defaultValue: null)
  late String? Email;

  @JsonKey(defaultValue: null)
  late String? Mobile;

  @JsonKey(defaultValue: null)
  late String? CountryCode;

  @JsonKey(defaultValue: null)
  late int? DivisionId;

  @JsonKey(defaultValue: null)
  late int? DistrictId;

  @JsonKey(defaultValue: null)
  late int? ThanaId;

  @JsonKey(defaultValue: null)
  late int? UnionId;

  @JsonKey(defaultValue: null)
  late String? Address1;

  @JsonKey(defaultValue: null)
  late String? Address2;

  @JsonKey(defaultValue: null)
  late int? PlaceId;

  @JsonKey(defaultValue: null)
  late double? Latitude;

  @JsonKey(defaultValue: null)
  late double? Longitude;

  @JsonKey(defaultValue: null)
  late bool? IsDefault;

  @JsonKey(defaultValue: null)
  late String? DivisionName;

  @JsonKey(defaultValue: null)
  late String? DistrictName;

  @JsonKey(defaultValue: null)
  late String? ThanaName;

  @JsonKey(defaultValue: null)
  late String? UnionName;

  SiteAddress();

  factory SiteAddress.fromJson(Map<String, dynamic> json) =>
      _$SiteAddressFromJson(json);

  Map<String, dynamic> toJson() => _$SiteAddressToJson(this);
}
