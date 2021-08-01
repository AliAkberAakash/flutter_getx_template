import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilam/data/local/service/local_service.dart';
import 'package:nilam/data/remote/response/banner/banner_response.dart';
import 'package:nilam/data/remote/response/featured_product/featured_product_response.dart';
import 'package:nilam/data/remote/response/site_settings/site_settings_response.dart';
import 'package:nilam/data/remote/service/remote_service.dart';
import 'package:nilam/util/helper/text.dart';

class HomeContentController extends GetxController {
  late RxBool isLoading;
  late double carouselHeight;
  late ScrollController scrollController;
  late RemoteService _remoteService;
  late LocalService _localService;
  SiteSettingsResponse? siteSettings;
  late String currency;

  @override
  void onInit() {
    isLoading = false.obs;
    carouselHeight = 200.0;
    scrollController = ScrollController();
    _remoteService = Get.find<RemoteService>();
    _localService = Get.find<LocalService>();

    siteSettings = _localService.getSiteSettings();

    if (siteSettings != null) {
      if (TextUtil.isNotEmpty(siteSettings!.CurrencyIcon)) {
        currency = siteSettings!.CurrencyIcon!;
      } else if (TextUtil.isNotEmpty(siteSettings!.Currency)) {
        currency = siteSettings!.Currency!;
      } else {
        currency = 'app_currency'.tr;
      }
    } else {
      currency = 'app_currency'.tr;
    }

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }

  Future<FeaturedProductResponse> getFeaturedProducts({
    int? start,
    int? length,
  }) async {
    return _remoteService.getFeaturedProducts(
      start: start,
      length: length,
    );
  }

  Future<FeaturedProductResponse> getFeaturedAuctions({
    int? start,
    int? length,
  }) async {
    return _remoteService.getFeaturedAuctions(
      start: start,
      length: length,
    );
  }

  Future<BannerResponse> getBannerList() async {
    return _remoteService.getBannerList();
  }
}
