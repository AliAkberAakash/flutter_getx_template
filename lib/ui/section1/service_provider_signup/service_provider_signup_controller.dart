import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/service_partner/auth/service_partner_signup_request.dart';
import 'package:go_share/data/models/service_partner/auth/service_partner_signup_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ServiceProviderSignupController extends GetxController{
  final Repository repository = Repository();
  Rx<ServicePartnerSignupResponse?> servicePartnerSignupResponse = Rx<ServicePartnerSignupResponse?>(null);

  void serviceProviderSignup(
      ServicePartnerSignupRequest request,
      File image,
  ) async{
    if(validate(request)){
      servicePartnerSignupResponse.value = await repository.signupServicePartner(request, image);
    }
  }

  bool validate(ServicePartnerSignupRequest request){
    return true;
  }

}