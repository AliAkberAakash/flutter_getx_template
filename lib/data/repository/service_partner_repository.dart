import 'dart:io';

import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/driver/driver_login_request.dart';
import 'package:go_share/data/models/driver/driver_login_response.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_request.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_response.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:go_share/data/models/vehicles/vehicle_list_response.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';
import 'package:logger/logger.dart';

class Repository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();

  Future<ServicePartnerSignupResponse> signupServicePartner(
      ServicePartnerSignupRequest request,
      File image,
      ) async{
    try{
      var responseJson = await helper.postMultiPart(
        NetworkConstants.SERVICE_PARTNER_SIGNUP,
        KeyConstants.SERVICE_PROVIDER_IMAGE_KEY,
        image,
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
          msg: "Data parsing error"
      );
    }
  }

  Future<ServicePartnerLoginResponse> loginServicePartner(
      ServicePartnerLoginRequest request
      ) async {

    try{
      var responseJson = await helper.post(
        NetworkConstants.SERVICE_PARTNER_LOGIN,
        request.toJson(),
      );

      if(responseJson.statusCode == 200){
        return ServicePartnerLoginResponse.fromJson(responseJson.data);
      }else{
        return ServicePartnerLoginResponse(
          message: "Error from server",
        );
      }
    }catch(e){
      logger.d(e);
      return ServicePartnerLoginResponse(
        message: "Data parsing error",
      );
    }

  }

  Future<ServicePartnerProfileResponse> getServicePartnerProfile() async{
    try{
      var responseJson = await helper.get(NetworkConstants.SERVICE_PARTNER_PROFILE);
      if(responseJson.data !=null){
        return ServicePartnerProfileResponse.fromJson(responseJson.data);
      }else{
        return ServicePartnerProfileResponse(
          message: "Error from server"
        );
      }
    }catch(e){
      logger.d(e);
      return ServicePartnerProfileResponse(
          message: "Data parsing error"
      );
    }
  }

  Future<bool> isLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.AUTHORIZATION);
    return token.isNotEmpty;
  }

  Future<bool> isDriverLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.DRIVER_TOKEN);
    return token.isNotEmpty;
  }

  Future<VehicleListResponse> getVehicleList() async{
    try{
      var response = await helper.get(NetworkConstants.VEHICLE_LIST);
      return VehicleListResponse.fromJson(response.data);
    }catch(e){
      return VehicleListResponse(
        msg: "Error from server",
      );
    }
  }

  Future<DriverLoginResponse> loginDriver(DriverLoginRequest request) async{
    try{
      var response = await helper.post(NetworkConstants.DRIVER_LOGIN, request.toJson());
      if(response.statusCode==200){
        return DriverLoginResponse.fromJson(response.data);
      }else{
        return DriverLoginResponse(
          message: "Error from server",
        );
      }
    }catch(e){
      logger.d(e);
      return DriverLoginResponse(
        message: "Driver login data parsing error",
      );
    }
  }

}