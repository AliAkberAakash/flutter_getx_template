import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/general_user/profile/profile_update_request.dart';
import 'package:go_share/data/models/general_user/profile/profile_update_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class EditProfileController extends GetxController{

  final Repository _repository = Get.find();

  Future<UpdateProfileResponse> updateUserProfile(File? file, UpdateProfileRequest request) async{
    return await _repository.updateGeneralUserProfile(file, request);
  }

}