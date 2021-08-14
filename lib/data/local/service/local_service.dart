import 'package:get/get.dart';
import 'package:go_share/constants.dart';
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
}
