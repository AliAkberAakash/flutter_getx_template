import 'package:get/get.dart';
import 'package:go_share/data/models/general_user/profile/profile_update_request.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class EditProfileController extends GetxController{

  final Repository _repository = Get.find();

  updateUserProfile(UpdateProfileRequest request) async{
    var response = await _repository.updateGeneralUserProfile(request);
  }

}