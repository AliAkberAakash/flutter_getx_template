import 'package:json_annotation/json_annotation.dart';

part 'site_social_address.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteSocialAddress {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late String? FacebookURL;

  @JsonKey(defaultValue: null)
  late String? InstagramURL;

  @JsonKey(defaultValue: null)
  late String? YoutubeURL;

  @JsonKey(defaultValue: null)
  late String? LinkedinURL;

  @JsonKey(defaultValue: null)
  late String? TwitterURL;

  SiteSocialAddress();

  factory SiteSocialAddress.fromJson(Map<String, dynamic> json) =>
      _$SiteSocialAddressFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSocialAddressToJson(this);
}
