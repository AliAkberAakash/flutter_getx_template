import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Default values
const bool defaultBoolean = false;
const int defaultInt = 0;
const double defaultDouble = 0.0;
const String defaultString = "";
const String spaceString = " ";
const String newLineString = "\n";

// App colors (main)
const Color colorPrimary = const Color(0xFF353A44);
const Color colorAccent = const Color(0xFF258633);

// App colors (light)
const Color colorLightGray1 = const Color(0xFF353A44);
const Color colorLightGray2 = const Color(0xFF404551);
const Color colorLightGray3 = const Color(0xFF6A6B6D);
const Color colorLightGray4 = const Color(0xFF8F949E);
const Color colorLightGray5 = const Color(0xFF272B31);
const Color colorLightGray6 = const Color(0xFFD5D5D5);
const Color colorLightGray7 = const Color(0xFF333741);
const Color colorLightWhite1 = const Color(0xFFFAFAFA);
const Color colorLightWhite2 = const Color(0xFFDBDBDB);
const Color colorLightGreen1 = const Color(0xFF0ABB87);
const Color colorLightGreenAccent1 = const Color(0xFF20C3AF);
const Color colorLightGreenAccent2 = const Color(0xFFDDF6F3);
const Color colorLightOrange1 = const Color(0xFFFF9900);

// App colors (others)
const Color colorSplashNavigationBarBackground = const Color(0xFF0B0C0E);
const Color colorPageBackground = const Color(0xFFF4F5F7);

// Service
const SystemUiOverlayStyle systemUiOverlayStyleGlobal =
    const SystemUiOverlayStyle(
  systemNavigationBarColor: colorPageBackground,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);

// App essentials
const String responseOfJsonType = "application/json";
const String fontFamilyPoppins = "Poppins";
const String fontFamilyRoboto = "Roboto";
const String valueClientID = "APP_CLIENT";
const String valueClientSecret = "APP_CLIENT_AF61E59520943DC26494F8941B";
const String valueGrantTypeClientCredentials = "client_credentials";
const String valueGrantTypeRefreshToken = "refresh_token";
const int minimumPasswordLength = 8;
const int minimumVerificationCodeLength = 4;
const String prefixAuthToken = "Bearer ";

// Backend
const String baseDevelopmentUrl = "";
const String baseLiveUrl = "";
const String baseUrl = baseDevelopmentUrl;

const String baseAppDevelopmentUrl = "https://demoapi.nilam.xyz";
const String baseAppLiveUrl = "";
const String baseAppUrl = baseAppDevelopmentUrl;

final String baseApiUrl = join(baseAppUrl, "api/v1");
final String tokenUrl = join(baseApiUrl, "token");
final String siteSettingsUrl = join(baseApiUrl, "sitesetting/get");
final String featuredProductsUrl = join(
  baseApiUrl,
  "item/get-featured-products",
);
final String featuredAuctionsUrl = join(
  baseApiUrl,
  "item/get-featured-auctions",
);
final String getAllBannersUrl = join(
  baseApiUrl,
  "banner/getall",
);
// Key
const String keySuccess = "success";
const String keyData = "data";
const String keyMessage = "message";
const String keyTrainingCategories = "training_categories";
const String keyTimeLengths = "time_lengths";
const String keyProfessions = "professions";
const String keyCategoryIconUrl = "cat_icon_url";
// --------------------------------------------- //
const String keyAccessToken = "access_token";
const String keyClientId = "client_id";
const String keyClientSecret = "client_secret";
const String keyGrantType = "grant_type";
const String keyUserName = "username";
const String keyPassword = "password";
const String keyUserOTP = "use_otp";
const String keySiteSettings = "site_settings";
const String keyStart = "start";
const String keyLength = "length";

// Regular Expression
const String regularExpressionEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String regularExpressionPhone =
    "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" +
        "([0-9][0-9\\- \\.]+[0-9])";
