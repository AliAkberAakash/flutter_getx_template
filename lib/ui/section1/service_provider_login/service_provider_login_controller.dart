import 'package:get/get.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class ServiceProviderLoginController extends GetxController{

  final Repository repository = Get.find();

  Future<ServicePartnerLoginResponse> loginServiceProvider(
      ServicePartnerLoginRequest request,
      ) async{
    var response = await repository.loginServicePartner(request);
    return response;
  }

  Future storeToken(String token) async {
    await SharedPrefUtil.writeString(NetworkConstants.AUTHORIZATION, token);
  }

}