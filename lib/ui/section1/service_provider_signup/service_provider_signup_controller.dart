import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_request.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ServiceProviderSignupController extends GetxController{
  final Repository repository = Get.find();

  Future<ServicePartnerSignupResponse> serviceProviderSignup(
      ServicePartnerSignupRequest request,
      File image,
  ) async{
      var response = await repository.signupServicePartner(request, image);
      return response;
  }

}