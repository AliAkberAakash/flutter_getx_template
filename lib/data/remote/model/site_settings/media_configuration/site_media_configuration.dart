import 'package:json_annotation/json_annotation.dart';

part 'site_media_configuration.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SiteMediaConfiguration {
  @JsonKey(defaultValue: null)
  late String? Entity;

  @JsonKey(defaultValue: null)
  late String? Category;

  @JsonKey(defaultValue: null)
  late int? Width;

  @JsonKey(defaultValue: null)
  late int? Height;

  @JsonKey(defaultValue: null)
  late int? Size;

  @JsonKey(defaultValue: null)
  late bool? IsDefault;

  @JsonKey(defaultValue: null)
  late bool? WithWatermark;

  @JsonKey(defaultValue: null)
  late List<String> Extension;

  SiteMediaConfiguration();

  factory SiteMediaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SiteMediaConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SiteMediaConfigurationToJson(this);
}
