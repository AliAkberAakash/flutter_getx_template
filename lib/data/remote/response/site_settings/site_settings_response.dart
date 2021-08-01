import 'package:go_share/constants.dart';
import 'package:go_share/data/remote/model/site_settings/address/site_address.dart';
import 'package:go_share/data/remote/model/site_settings/application_policy/site_application_policy.dart';
import 'package:go_share/data/remote/model/site_settings/bank_details/site_bank_details.dart';
import 'package:go_share/data/remote/model/site_settings/footer_menu/site_footer_menu.dart';
import 'package:go_share/data/remote/model/site_settings/media_configuration/site_media_configuration.dart';
import 'package:go_share/data/remote/model/site_settings/social_address/site_social_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_settings_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteSettingsResponse {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: defaultString)
  late String SiteTitle;

  @JsonKey(defaultValue: null)
  late String? SiteSlogan;

  @JsonKey(defaultValue: null)
  late String? SiteSummary;

  @JsonKey(defaultValue: null)
  late String? SiteNotice;

  @JsonKey(defaultValue: null)
  late String? SiteUrl;

  @JsonKey(defaultValue: null)
  late String? APIUrl;

  @JsonKey(defaultValue: null)
  late String? DocumentBaseUrl;

  @JsonKey(defaultValue: null)
  late String? LogoPath;

  @JsonKey(defaultValue: null)
  late String? MobileLogoPath;

  @JsonKey(defaultValue: null)
  late String? SocialLogoPath;

  @JsonKey(defaultValue: null)
  late String? FaviconPath;

  @JsonKey(defaultValue: null)
  late String? Email;

  @JsonKey(defaultValue: null)
  late String? Mobile;

  @JsonKey(defaultValue: null)
  late String? HotLine;

  @JsonKey(defaultValue: null)
  late String? AndroidAppUrl;

  @JsonKey(defaultValue: null)
  late String? IOSAppUrl;

  @JsonKey(defaultValue: null)
  late String? MetaKeywords;

  @JsonKey(defaultValue: null)
  late String? MetaDescription;

  @JsonKey(defaultValue: null)
  late String? MetaAuthor;

  @JsonKey(defaultValue: null)
  late String? CurrencyIcon;

  @JsonKey(defaultValue: null)
  late String? Currency;

  @JsonKey(defaultValue: null)
  late String? Language;

  @JsonKey(defaultValue: null)
  late double? DeliveryCharge;

  @JsonKey(defaultValue: null)
  late double? DeliveryChargeFreeAmount;

  @JsonKey(defaultValue: null)
  late String? GoogleAnalyticsId;

  @JsonKey(defaultValue: null)
  late String? FacebookAppId;

  @JsonKey(defaultValue: null)
  late int? DeliveryFrom;

  @JsonKey(defaultValue: null)
  late int? DeliveryTo;

  @JsonKey(defaultValue: null)
  late bool? IsDefault;

  @JsonKey(defaultValue: null)
  late String? TermsAndConditionURL;

  @JsonKey(defaultValue: null)
  late String? PrivacyPolicyURL;

  @JsonKey(defaultValue: null)
  late bool? IsECommerce;

  @JsonKey(defaultValue: null)
  late bool? IsUsePoint;

  @JsonKey(defaultValue: null)
  late int? TenantId;

  @JsonKey(defaultValue: null)
  late SiteAddress? Address;

  @JsonKey(defaultValue: null)
  late SiteSocialAddress? SocialAddress;

  @JsonKey(defaultValue: null)
  late SiteApplicationPolicy? ApplicationPolicy;

  @JsonKey(defaultValue: [])
  late List<SiteBankDetails> BankDetails;

  @JsonKey(defaultValue: [])
  late List<SiteFooterMenu> FooterMenus;

  @JsonKey(defaultValue: [])
  late List<SiteMediaConfiguration> MediaConfiguration;

  SiteSettingsResponse();

  factory SiteSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteSettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsResponseToJson(this);
}
