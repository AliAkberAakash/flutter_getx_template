import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_share/data/models/general_user/general_user_login_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class NavigationContainerController extends GetxController{

  final Repository repository = Get.find();

  var userState = Rx<User?>(null);

  NavigationContainerController(){
    getUser();
  }

  Future logoutServiceProvider() async{
    await repository.logoutGeneralUser();
  }

  getUser() async{
    var jsonString = await SharedPrefUtil.getString(NetworkConstants.GENERAL_USER_PROFILE);
    if(jsonString.isNotEmpty){
      var userJson = jsonDecode(jsonString);
      var user = User.fromJson(userJson);
      userState.value = user;
    }else{
      userState.value = null;
    }
  }

}