import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_update_request.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_update_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ServicePartnerProfileUpdateController extends GetxController{

  final Repository repository = Get.find();

  Future<ServicePartnerProfileUpdateResponse> updateProfile(ServicePartnerProfileUpdateRequest request, File? file) async{
    var response = await repository.updateServicePartnerProfile(request, file);
    return response;
  }

}