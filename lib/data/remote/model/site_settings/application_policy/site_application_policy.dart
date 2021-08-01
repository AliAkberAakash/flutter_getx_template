import 'package:json_annotation/json_annotation.dart';

part 'site_application_policy.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteApplicationPolicy {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late int? MinimumPasswordLength;

  @JsonKey(defaultValue: null)
  late double? UserPointOnRegistration;

  @JsonKey(defaultValue: null)
  late double? RequiredPointOnPostProduct;

  @JsonKey(defaultValue: null)
  late double? RequiredPointOnPlaceBidding;

  @JsonKey(defaultValue: null)
  late double? ConversionRate;

  @JsonKey(defaultValue: null)
  late int? ServiceChargeId;

  @JsonKey(defaultValue: null)
  late bool? IsDefault;

  @JsonKey(defaultValue: null)
  late bool? HasServiceCharge;

  @JsonKey(defaultValue: null)
  late bool? HasAddToCart;

  @JsonKey(defaultValue: null)
  late bool? HasBargain;

  @JsonKey(defaultValue: null)
  late double? BargainFactor;

  @JsonKey(defaultValue: null)
  late bool? HasBuyNow;

  @JsonKey(defaultValue: null)
  late bool? HasPostItem;

  @JsonKey(defaultValue: null)
  late bool? HasLanguage;

  SiteApplicationPolicy();

  factory SiteApplicationPolicy.fromJson(Map<String, dynamic> json) =>
      _$SiteApplicationPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$SiteApplicationPolicyToJson(this);
}
