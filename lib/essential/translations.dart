import 'package:get/get.dart';
import 'package:nilam/constants.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "no_item_found": "No item found!",
          "no_internet_connection": "No Internet Connection",
          "name": "Name",
          "email_address": "Email address",
          "email_phone": "Email/Phone",
          "phone_number": "Phone number",
          "password": "Password",
          "confirm_password": "Confirm password",
          "old_password": "Old password",
          "new_password": "New password",
          "confirm_new_password": "Confirm new password",
          "sign_in": "Sign in",
          "sign_up": "Sign up",
          "terms_and_conditions": "Terms & Conditions",
          "forgot_password": "Forgot password?",
          "done": "Done",
          "skip": "Skip",
          "see_all": "See All",
          "handle_not_found": "Handle not found",
          "invalid_email": "Invalid email address found",
          "invalid_phone": "Invalid phone number found",
          "fill_up_all_fields": "Please fill up all the fields",
          "fill_up_the_field": "Please fill up the field",
          "valid_email_required": "Please enter a valid email address",
          "valid_email_phone_required": "Please enter a valid email/phone",
          "passwords_do_not_match": "Passwords do not match",
          "code_length_required":
              "Verification code should contain $minimumVerificationCodeLength characters",
          "minimum_password_length_required":
              "Password should contain at least $minimumPasswordLength characters",
          "weak_password": "The password provided is too weak.",
          "duplicate_email": "The account already exists for that email.",
          "splash_title": "The Nilam App",
          "splash_error_fetching_token": "Could not get the token",
          "splash_error_fetching_site_settings":
              "Could not fetch site settings",
          "home": "Home",
          "my_auction": "My Auction",
          "notifications": "Notifications",
          "profile": "Profile",
          "view_more": "View more",
          "current_bid": "Current bid",
          "bid_start": "Bid start",
          "app_currency": "BDT",
          "home_content_featured_auctions": "Featured auctions",
          "home_content_featured_products": "Featured products",
          "home_content_recommended_products": "Recommended for you",
          "home_content_error_no_featured_products":
              "No featured product was found",
          "home_content_error_no_featured_auctions":
              "No featured auction was found",
          "home_content_error_no_recommended_products":
              "No recommended product was found",
          "home_content_ended": "Ended",
        },
      };
}
