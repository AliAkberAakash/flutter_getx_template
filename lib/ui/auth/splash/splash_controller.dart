import 'dart:async';

import 'package:get/get.dart';
import 'package:go_share/base/exception/app_exception.dart';
import 'package:go_share/data/local/service/local_service.dart';
import 'package:go_share/data/remote/response/site_settings/site_settings_response.dart';
import 'package:go_share/data/remote/service/remote_service.dart';
import 'package:go_share/ui/home/container/home_container_binding.dart';
import 'package:go_share/ui/home/container/home_container_view.dart';
import 'package:go_share/util/helper/text.dart';
import 'package:go_share/util/lib/toast.dart';

class SplashController extends GetxController {
  late LocalService _localService;
  late RemoteService _remoteService;

  @override
  void onInit() {
    super.onInit();

    _localService = Get.find<LocalService>();
    _remoteService = Get.find<RemoteService>();
  }

  @override
  void onReady() {
    super.onReady();
    fetchTokenAndSiteSettings();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void goToNextPage() {
    Get.off(
      () => HomeContainerView(),
      binding: HomeContainerBinding(),
    );
  }

  Future<void> fetchTokenAndSiteSettings() async {
    try {
      // Token section
      bool shouldWeFetchToken = false;
      String? accessToken;

      if (_localService.doWeHaveAccessToken()) {
        accessToken = _localService.getAccessToken();

        if (!TextUtil.isNotEmpty(accessToken)) {
          await _localService.removeAccessToken();
          shouldWeFetchToken = true;
        }
      } else {
        shouldWeFetchToken = true;
      }

      if (shouldWeFetchToken) {
        final response = await _remoteService.getToken();
        accessToken = "${response.tokenType} ${response.accessToken}";
        await _localService.storeAccessToken(accessToken);
      }

      Get.log("Access Token: \'$accessToken\'");

      // Site settings section
      bool shouldWeFetchSiteSettings = false;
      SiteSettingsResponse? siteSettings;

      if (_localService.doWeHaveSiteSettings()) {
        siteSettings = _localService.getSiteSettings();

        if (siteSettings == null) {
          await _localService.removeSiteSettings();
          shouldWeFetchSiteSettings = true;
        }
      } else {
        shouldWeFetchSiteSettings = true;
      }

      if (shouldWeFetchSiteSettings) {
        await getSiteSettings();
      } else {
        Timer(
          Duration(seconds: 2),
          goToNextPage,
        );
      }
    } catch (e) {
      Get.log("Error: ${e.toString()}");

      if (e is AppException) {
        ToastUtil.show(e.toString());
      } else {
        ToastUtil.show('splash_error_fetching_token'.tr);
      }
    }
  }

  Future<void> getSiteSettings() async {
    try {
      final response = await _remoteService.getSiteSettings();
      await _localService.storeSiteSettings(response);

      Timer(
        Duration(seconds: 2),
        goToNextPage,
      );
    } catch (e) {
      Get.log("Error: ${e.toString()}");

      if (e is AppException) {
        ToastUtil.show(e.toString());
      } else {
        ToastUtil.show('splash_error_fetching_site_settings'.tr);
      }
    }
  }
}
