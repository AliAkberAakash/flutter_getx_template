import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_share/data/models/general_user/general_user_login_request.dart';
import 'package:go_share/data/models/general_user/general_user_login_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class SignInController extends GetxController{

  final Repository repository;

  SignInController(this.repository);

  Future<GeneralUserLoginResponse> loginGeneralUser(GeneralUserLoginRequest request) async{
    var response = await repository.loginGeneralUser(request);
    return response;
  }
  Future storeUser(User user) async{
    String jsonString = json.encode(user.toJson());
    await SharedPrefUtil.writeString(NetworkConstants.GENERAL_USER_PROFILE, jsonString);
  }

  Future storeToken(String token) async {
    token = "Bearer "+token;
    await SharedPrefUtil.writeString(NetworkConstants.GENERAL_USER_TOKEN, token);
  }



}