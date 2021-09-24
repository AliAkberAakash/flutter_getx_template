class AssetConstants {
  static const base_path = "assets/images/";
  static const ic_profile = base_path + "ic_profile.svg";
  static const ic_settings = base_path + "ic_settings.svg";
  static const ic_language = base_path + "ic_language.svg";
  static const img_banner_demo = base_path + "img_banner_demo.png";
  static const ic_welcome = "images/ic_welcome.jpg";
  static const ic_background = "images/ic_background_two.png";
  static const signup_bg_image = "images/signup_bg_image.png";
  static const logoTransparent = "images/ic_logo_transparent.png";

  static const base_icon_path = "images/icons/";
  static const ic_menu_svg = base_icon_path + "ic_menu.svg";
  static const ic_home_svg = base_icon_path + "ic_home.svg";
  static const ic_free_busy_list_svg = base_icon_path + "ic_free_busy_list.svg";
  static const ic_bus_svg = base_icon_path + "ic_bus.svg";
  static const ic_notification_svg = base_icon_path + "ic_notification.svg";
  static const ic_profile_svg = base_icon_path + "ic_profile.svg";
  static const ic_settings_svg = base_icon_path + "ic_settings.svg";
  static const ic_sign_out_svg = base_icon_path + "ic_sign_out.svg";
  static const ic_vehicle_list_svg = base_icon_path + "ic_vehicle_list.svg";
  static const ic_about_us_svg = base_icon_path + "ic_about_us.svg";
  static const ic_contact_us_svg = base_icon_path + "ic_contact_us.svg";
  static const ic_driver_login_svg = base_icon_path + "ic_driver_login.svg";
  static const ic_faq_svg = base_icon_path + "ic_faq.svg";
  static const ic_privacy_and_concern_svg = base_icon_path + "ic_privacy_and_concern.svg";
  static const ic_lost_and_found_new_svg = base_icon_path + "ic_lost_and_found_new.svg";
  static const ic_terms_and_conditions_svg = base_icon_path + "ic_terms_and_conditions.svg";
  static const ic_refund_request_svg = base_icon_path + "ic_refund_request.svg";

  static const adminNoticeIcon = base_icon_path + "ic_admin_notice.svg";
  static const billingIcon = base_icon_path + "ic_billing.svg";
  static const pendingIcon = base_icon_path + "ic_pending.svg";
  static const successfulIcon = base_icon_path + "ic_successful.svg";
  static const vehicleIcon = base_icon_path + "ic_vehicle.svg";
  static const lostandFoundIcon = base_icon_path + "ic_lost_and_found.svg";
}

class NetworkConstants {
  //urls
  static const BASE_URL = "http://api.goshare.sg/";

  //header parameters
  static const ACCEPT = "Accept";
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const DRIVER_TOKEN = "Driver-Token";
  static const CONTENT_TYPE = "content-Type";

  //End urls
  static const SERVICE_PARTNER_SIGNUP = "servicepartner/create";
  static const SERVICE_PARTNER_LOGIN = "servicepartners/login";
  static const SERVICE_PARTNER_PROFILE = "servicepartner/profile";
  static const VEHICLE_LIST = "servicepartner/vehicles";
  static const DRIVER_LOGIN = "vehicles/login";
  static const ADD_VEHICLE = "servicepartner/vehicle/create";
  static const DRIVER_PROFILE = "vehicle/profile";
  static const SERVICE_PARTNER_PROFILE_UPDATE = "servicepartner/profile/update";
  static const SP_VEHICLE_RESET_PASSWORD = "servicepartner/vehicle/resetpassword";
  static const SEND_DRIVER_PASSWORD_RESET_CODE = "vehicle/resetpassword/code/sent";
  static const RESET_DRIVER_PASSWORD = "vehicle/resetpassword";
  static const UPDATE_VEHICLE_DETAILS = "servicepartner/vehicle/update";
  static const SEND_RESET_PASSWORD_CODE = "servicepartner/resetpassword/code/sent";

}

class PreferenceKey {
  static const darkMode = "darkMode";
  static const languageBengali = "languageBengali";
  static const servicePartner = "servicePartner";
}

class DefaultValue {
  static const bool kDefaultBoolean = false;
  static const int kDefaultInt = 0;
  static const double kDefaultDouble = 0.0;
  static const String kDefaultString = '';
}

class KeyConstants {
  static const TOKEN_KEY = "token";
  static const EMAIL_VERIFIED_KEY = "email_verified";
  static const DEVICE_VERIFIED_KEY = "device_verified";
  static const DEVICE_COOKIE = "device_cookie";
  static const CURRENCY_KEY = "currency";
  static const LANGUAGE_KEY = "language";
  static const MESSAGE_KEY = "message";
  static const SERVICE_PROVIDER_IMAGE_KEY = "image";
}
