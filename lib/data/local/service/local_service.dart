import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/data/remote/response/site_settings/site_settings_response.dart';
import 'package:go_share/util/helper/text.dart';
import 'package:go_share/util/lib/preference.dart';

class LocalService extends GetxService {
  late PreferenceUtil _preferenceUtil;

  LocalService() {
    _preferenceUtil = PreferenceUtil.on;
  }

  bool doWeHaveAccessToken() {
    return _preferenceUtil.contains(keyAccessToken);
  }

  Future<void> storeAccessToken(String accessToken) {
    return _preferenceUtil.write<String>(
      keyAccessToken,
      accessToken,
    );
  }

  String getAccessToken() {
    return _preferenceUtil.read<String>(
      keyAccessToken,
      defaultValue: defaultString,
    )!;
  }

  Future<void> removeAccessToken() async {
    await _preferenceUtil.delete(keyAccessToken);
  }

  Future<void> storeSiteSettings(SiteSettingsResponse response) async {
    return _preferenceUtil.write<String>(
      keySiteSettings,
      jsonEncode(response.toJson()),
    );
  }

  SiteSettingsResponse? getSiteSettings() {
    final encodedResponse = _preferenceUtil.read<String>(
      keySiteSettings,
      defaultValue: defaultString,
    )!;

    return TextUtil.isNotEmpty(encodedResponse)
        ? SiteSettingsResponse.fromJson(
            jsonDecode(encodedResponse) as Map<String, dynamic>,
          )
        : null;
  }

  bool doWeHaveSiteSettings() {
    return _preferenceUtil.contains(keySiteSettings);
  }

  Future<void> removeSiteSettings() async {
    await _preferenceUtil.delete(keySiteSettings);
  }
}
