import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class Banner {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late String? HeadTitle;

  @JsonKey(defaultValue: null)
  late String? Title;

  @JsonKey(defaultValue: null)
  late String? Summary;

  @JsonKey(defaultValue: null)
  late double? ActualPrice;

  @JsonKey(defaultValue: null)
  late double? DiscountPrice;

  @JsonKey(defaultValue: null)
  late int? ImageId;

  @JsonKey(defaultValue: null)
  late String? ImageUrl;

  @JsonKey(defaultValue: null)
  late String? ButtonText;

  @JsonKey(defaultValue: null)
  late String? Type;

  @JsonKey(defaultValue: null)
  late String? Link;

  @JsonKey(defaultValue: null)
  late String? ColorCode;

  @JsonKey(defaultValue: null)
  late String? BackgroundColorCode;

  @JsonKey(defaultValue: null)
  late int? Sequence;

  @JsonKey(defaultValue: null)
  late String? Reference;

  @JsonKey(defaultValue: null)
  late String? Language;

  @JsonKey(defaultValue: null)
  late String? Status;

  Banner();

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
