import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/service_partner/auth/service_partner_signup_request.dart';
import 'package:go_share/data/models/service_partner/auth/service_partner_signup_response.dart';
import 'package:go_share/utils/constants.dart';
import 'package:logger/logger.dart';

class Repository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();

  Future<ServicePartnerSignupResponse> signupServicePartner(ServicePartnerSignupRequest request) async{
    try{
      var responseJson = await helper.post(
        NetworkConstants.SERVICE_PARTNER_SIGNUP,
        request.toJson(),
      );
      if(responseJson.statusCode == 200){
        return ServicePartnerSignupResponse.fromJson(responseJson.data);
      }else{
        return ServicePartnerSignupResponse(
          success: false,
          msg: "Error from server"
        );
      }
    }catch(e){
      logger.d(e);
      return ServicePartnerSignupResponse(
          success: false,
          msg: "Data Parsing Error"
      );
    }
  }
}