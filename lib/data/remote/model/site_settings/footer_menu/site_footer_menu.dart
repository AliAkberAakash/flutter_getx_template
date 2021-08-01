import 'package:json_annotation/json_annotation.dart';

part 'site_footer_menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteFooterMenu {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late String? PageTitle;

  @JsonKey(defaultValue: null)
  late String? PageContent;

  @JsonKey(defaultValue: null)
  late String? PageBannerUrl;

  @JsonKey(defaultValue: null)
  late int? ImageId;

  @JsonKey(defaultValue: null)
  late String? Link;

  @JsonKey(defaultValue: null)
  late String? Slug;

  @JsonKey(defaultValue: null)
  late int? CategoryId;

  @JsonKey(defaultValue: null)
  late int? Placement;

  @JsonKey(defaultValue: null)
  late int? CategorySequence;

  @JsonKey(defaultValue: null)
  late int? Sequence;

  @JsonKey(defaultValue: null)
  late String? PageType;

  @JsonKey(defaultValue: null)
  late String? Param;

  @JsonKey(defaultValue: null)
  late bool? IsSystemRequired;

  @JsonKey(defaultValue: null)
  late String? Status;

  @JsonKey(defaultValue: null)
  late String? CategoryName;

  SiteFooterMenu();

  factory SiteFooterMenu.fromJson(Map<String, dynamic> json) =>
      _$SiteFooterMenuFromJson(json);

  Map<String, dynamic> toJson() => _$SiteFooterMenuToJson(this);
}
