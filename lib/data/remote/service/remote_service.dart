import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/data/remote/response/banner/banner_response.dart';
import 'package:go_share/data/remote/response/featured_product/featured_product_response.dart';
import 'package:go_share/data/remote/response/site_settings/site_settings_response.dart';
import 'package:go_share/data/remote/response/token/token_response.dart';
import 'package:go_share/util/helper/text.dart';
import 'package:go_share/util/lib/network/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteService extends GetxService {
  RemoteService() {
    if (ApiUtil.client == null) {
      ApiUtil.client = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseApiUrl,
          headers: {
            HttpHeaders.acceptHeader: responseOfJsonType,
          },
        ),
      );

      ApiUtil.client!.interceptors.add(
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
        ),
      );
    }
  }

  // Authorization
  Future<TokenResponse> getToken({
    String? userName,
    String? password,
    bool? otp,
    String clientId = valueClientID,
    String clientSecret = valueClientSecret,
    String grantType = valueGrantTypeClientCredentials,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyClientId, clientId);
    ApiUtil.appendParamIntoData(bodyData, keyClientSecret, clientSecret);
    ApiUtil.appendParamIntoData(bodyData, keyGrantType, grantType);

    // Optional fields (Nullable)
    ApiUtil.appendParamIntoData(bodyData, keyUserName, userName);
    ApiUtil.appendParamIntoData(bodyData, keyPassword, password);
    ApiUtil.appendParamIntoData(
      bodyData,
      keyUserOTP,
      otp ??
          (TextUtil.isNotEmpty(userName)
              ? !(TextUtil.isNotEmpty(password))
              : null),
    );

    final response = await ApiUtil.postFormUrlEncodedRequest(
      endPoint: tokenUrl,
      data: bodyData,
    );

    return TokenResponse.fromJson(response.data);
  }

  // Site Settings
  Future<SiteSettingsResponse> getSiteSettings() async {
    final bodyData = HashMap<String, String>();
    final response = await ApiUtil.postRequest(
      endPoint: siteSettingsUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return SiteSettingsResponse.fromJson(response.data);
  }

  // Item
  Future<FeaturedProductResponse> getFeaturedProducts({
    int? start,
    int? length,
  }) async {
    String url = featuredProductsUrl;

    url = ApiUtil.appendParamIntoPostfix(
      url,
      keyStart,
      start?.toString(),
    );

    url = ApiUtil.appendParamIntoPostfix(
      url,
      keyLength,
      length?.toString(),
    );

    final response = await ApiUtil.postRequest(
      endPoint: url,
      data: {},
      shouldGetOtherHeaders: true,
    );

    return FeaturedProductResponse.fromJson(response.data);
  }

  Future<FeaturedProductResponse> getFeaturedAuctions({
    int? start,
    int? length,
  }) async {
    String url = featuredAuctionsUrl;

    url = ApiUtil.appendParamIntoPostfix(
      url,
      keyStart,
      start?.toString(),
    );

    url = ApiUtil.appendParamIntoPostfix(
      url,
      keyLength,
      length?.toString(),
    );

    final response = await ApiUtil.postRequest(
      endPoint: url,
      data: {},
      shouldGetOtherHeaders: true,
    );

    return FeaturedProductResponse.fromJson(response.data);
  }

  Future<BannerResponse> getBannerList() async {
    final response = await ApiUtil.postRequest(
      endPoint: getAllBannersUrl,
      data: {},
      shouldGetOtherHeaders: true,
    );

    return BannerResponse.fromJson(response.data);
  }
}
