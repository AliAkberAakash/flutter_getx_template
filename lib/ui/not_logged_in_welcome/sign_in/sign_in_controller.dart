import 'package:get/get.dart';
import 'package:go_share/data/models/general_user/general_user_login_request.dart';
import 'package:go_share/data/models/general_user/general_user_login_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class SignInController extends GetxController{

  final Repository repository;

  SignInController(this.repository);

  Future<GeneralUserLoginResponse> loginGeneralUser(GeneralUserLoginRequest request) async{
    var response = await repository.loginGeneralUser(request);
    return response;
  }


}