import 'dart:io';

import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/driver/driver_login_request.dart';
import 'package:go_share/data/models/driver/driver_login_response.dart';
import 'package:go_share/data/models/driver/driver_password_reset_code_response.dart';
import 'package:go_share/data/models/driver/driver_password_reset_request.dart';
import 'package:go_share/data/models/driver/driver_password_reset_response.dart';
import 'package:go_share/data/models/driver/driver_profile_response.dart';
import 'package:go_share/data/models/general_user/general_user_login_request.dart';
import 'package:go_share/data/models/general_user/general_user_login_response.dart';
import 'package:go_share/data/models/general_user/general_user_signup_request.dart';
import 'package:go_share/data/models/general_user/general_user_signup_response.dart';
import 'package:go_share/data/models/general_user/profile/general_user_profile_response.dart';
import 'package:go_share/data/models/general_user/profile/profile_update_request.dart';
import 'package:go_share/data/models/general_user/profile/profile_update_response.dart';
import 'package:go_share/data/models/google_map/geocoding_response.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:go_share/data/models/service_partner/auth/password_reset_code_request.dart';
import 'package:go_share/data/models/service_partner/auth/password_reset_request.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_request.dart';
import 'package:go_share/data/models/service_partner/auth/signup/service_partner_signup_response.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_update_request.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_update_response.dart';
import 'package:go_share/data/models/service_partner/vehicle/sp_reset_vehicle_login_request.dart';
import 'package:go_share/data/models/service_partner/vehicle/sp_reset_veicle_login_response.dart';
import 'package:go_share/data/models/vehicles/add_vehicle_request.dart';
import 'package:go_share/data/models/vehicles/ass_vehicle_response.dart';
import 'package:go_share/data/models/vehicles/update_vehicle_details_request.dart';
import 'package:go_share/data/models/vehicles/update_vehicle_details_response.dart';
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

  Future<bool> isGeneralUserLoggedIn() async{
    var token = await SharedPrefUtil.getString(NetworkConstants.GENERAL_USER_TOKEN);
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
        data: null,
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
        message: "Wrong Credentials",
      );
    }
  }

  Future<AddVehicleResponse> addVehicle(AddVehicleRequest request, File image) async {
    try{
      var response = await helper.postMultiPart(
          NetworkConstants.ADD_VEHICLE,
          "image",
          image,
          request.toJson(),
      );
      if(response.statusCode==200){
        return AddVehicleResponse.fromJson(response.data);
      }else{
        return AddVehicleResponse(
          success: false,
        );
      }
    }catch(e){
      logger.d(e);
      return AddVehicleResponse(
        success: false,
      );
    }
  }

  Future<DriverProfileResponse> getDriverProfile() async{
    try{
      var response = await helper.getDriver(NetworkConstants.DRIVER_PROFILE);
      if(response.statusCode==200)
        return DriverProfileResponse.fromJson(response.data);
      else return DriverProfileResponse();
    }catch(e){
      logger.d(e);
      return DriverProfileResponse();
    }
  }

  Future logoutServicePartner() async{
    await SharedPrefUtil.delete(NetworkConstants.AUTHORIZATION);
  }
  Future logoutGeneralUser() async{
    await SharedPrefUtil.delete(NetworkConstants.GENERAL_USER_TOKEN);
  }

  
  Future<ServicePartnerProfileUpdateResponse> updateServicePartnerProfile(
      ServicePartnerProfileUpdateRequest request,
      File? file,
      ) async{
    try{
      var response;

      if(file != null) {
        response = await helper.postMultiPart(
          NetworkConstants.SERVICE_PARTNER_PROFILE_UPDATE,
          "image",
          file,
          request.toJson(),
        );
      }else{
        response = await helper.post(
          NetworkConstants.SERVICE_PARTNER_PROFILE_UPDATE,
          request.toJson(),
        );
      }

      if(response.statusCode==200){
        return ServicePartnerProfileUpdateResponse.fromJson(
          response.data
        );
      }else{
        return ServicePartnerProfileUpdateResponse(
            success: false,
            msg: "Error from the Server"
        );
      }

    }catch(e){
      logger.d(e);
      return ServicePartnerProfileUpdateResponse(
          success: false,
          msg: "Data Parsing Error"
      );
    }
  }

  Future<SpResetVehicleLoginResponse> resetSPVehicleLogin(SpResetVehicleLoginRequest request) async{
    try{
      var response = await helper.post(
        NetworkConstants.SP_VEHICLE_RESET_PASSWORD,
        request.toJson(),
      );

      if(response.statusCode == 200){
        return SpResetVehicleLoginResponse.fromJson(response.data);
      }else{
        return SpResetVehicleLoginResponse(
          success: false,
          msg: "Server error",
        );
      }

    }catch(e){
      logger.d(e);
      return SpResetVehicleLoginResponse(
        success: false,
        msg: "Data Parsing Error",
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestDriverPasswordResetCode() async{
    try{
      var response = await helper.postDriver(NetworkConstants.SEND_DRIVER_PASSWORD_RESET_CODE, {});
      return DriverPasswordResetCodeResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return DriverPasswordResetCodeResponse(
        success: false,
        msg: "Failed to send code"
      );
    }
  }

  Future<DriverPasswordResetResponse> resetDriverPassword(DriverPasswordResetRequest request) async{
    try{
      var response = await helper.postDriver(NetworkConstants.RESET_DRIVER_PASSWORD, request.toJson());
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to reset Password"
      );
    }
  }

  Future<UpdateVehicleDetailsResponse> updateVehicleDetails(
      UpdateVehicleDetailsRequest request,
      File? file,
      ) async{
    try{
      var response;

      if(file != null) {
        response = await helper.postMultiPart(
          NetworkConstants.UPDATE_VEHICLE_DETAILS,
          "image",
          file,
          request.toJson(),
        );
      }else{
        response = await helper.post(
          NetworkConstants.UPDATE_VEHICLE_DETAILS,
          request.toJson(),
        );
      }

      if(response.statusCode==200){
        return UpdateVehicleDetailsResponse.fromJson(
            response.data
        );
      }else{
        return UpdateVehicleDetailsResponse(
            success: false,
            msg: "Error from the Server"
        );
      }

    }catch(e){
      logger.d(e);
      return UpdateVehicleDetailsResponse(
          success: false,
          msg: "Data Parsing Error"
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestSPPasswordResetCode(
      PasswordResetCodeRequest request) async{

      try{
        var response = await helper.post(
          NetworkConstants.SEND_RESET_PASSWORD_CODE,
          request.toJson(),
        );
        return DriverPasswordResetCodeResponse.fromJson(response.data);
      }catch(e){
        return DriverPasswordResetCodeResponse(
            success: false,
            msg: "Failed to send code"
        );
      }

  }

  Future<DriverPasswordResetResponse> requestSPPasswordReset(
      PasswordResetRequest request) async{
    try{
      var response = await helper.post(
        NetworkConstants.RESET_SP_PASSWORD,
        request.toJson(),
      );
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<GeoCodingResponse> getGeoCodingResponse(String postalCode) async{

    try{
      var params = {
        "components":"postal_code:$postalCode|country:SG", //
        "key":"AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc",
      };
      var response = await helper.getRawWithParams(
          NetworkConstants.GET_ADDRESS_FROM_PO_CODE,
          params,
      );
      return GeoCodingResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return GeoCodingResponse(
        status: "No Result",
        results: [],
      );
    }

  }

  Future<GeoCodingResponse> getPostCodeFromAddress(String address) async{
    try{
      var params = {
        "address":"$address", //
        "key":"AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc",
      };
      var response = await helper.getRawWithParams(
        NetworkConstants.GET_ADDRESS_FROM_PO_CODE,
        params,
      );
      return GeoCodingResponse.fromJson(response.data);
    }catch(e){
      logger.d(e);
      return GeoCodingResponse(
        status: "No Result",
        results: [],
      );
    }

  }

  Future<GeneralUserLoginResponse> loginGeneralUser(GeneralUserLoginRequest request) async{
    try{
      var response = await helper.post(
        NetworkConstants.GENERAL_USER_LOGIN,
        request.toJson(),
      );
      return GeneralUserLoginResponse.fromJson(response.data);
    }catch(e){
      return GeneralUserLoginResponse(
          msg: "Failed to send code"
      );
    }
  }

  Future<GeneralUserProfileResponse> getGeneralUserProfile() async{
    try{
      var response = await helper.getGeneralUser(
        NetworkConstants.GENERAL_USER_PROFILE,
      );
      return GeneralUserProfileResponse.fromJson(response.data);
    }catch(e){
      return GeneralUserProfileResponse(
          msg: "Failed to send code"
      );
    }
  }

  Future<DriverPasswordResetCodeResponse> requestGUPasswordResetCode(
      PasswordResetCodeRequest request) async{

    try{
      var response = await helper.postGeneralUser(
        NetworkConstants.GU_REQUEST_CODE,
        request.toJson(),
      );
      return DriverPasswordResetCodeResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetCodeResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<DriverPasswordResetResponse> requestGUPasswordReset(
      PasswordResetRequest request) async{
    try{
      var response = await helper.postGeneralUser(
        NetworkConstants.GU_RESET_PASSWORD,
        request.toJson(),
      );
      return DriverPasswordResetResponse.fromJson(response.data);
    }catch(e){
      return DriverPasswordResetResponse(
          success: false,
          msg: "Failed to send code"
      );
    }

  }

  Future<GeneralUserSignupResponse> signupGeneralUser(
      GeneralUserSignupRequest request) async {
    try {
      var responseJson = await helper.post(
          NetworkConstants.GENERAL_USER_SIGNUP, request.toJson());
      if (responseJson.statusCode == 200) {
        return GeneralUserSignupResponse.fromJson(responseJson.data);
      } else {
        return GeneralUserSignupResponse(success: false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return GeneralUserSignupResponse(success: false, msg: 'Data Parsing Error');
    }
  }
  Future<UpdateProfileResponse> updateGeneralUserProfile(File? file,
      UpdateProfileRequest request) async {
    try {

      var responseJson;

      if(file!=null){
        responseJson = await helper.postGeneralUserMultiPart(
            NetworkConstants.GU_UPDATE_PROFILE,
            "image",
            file,
            request.toJson());
      }else{
        responseJson = await helper.postGeneralUser(
            NetworkConstants.GU_UPDATE_PROFILE,
            request.toJson());
      }

      if (responseJson.statusCode == 200) {
        return UpdateProfileResponse.fromJson(responseJson.data);
      } else {
        return UpdateProfileResponse(success:false, msg: 'Error from server');
      }
    } catch (e) {
      logger.d(e);
      return UpdateProfileResponse(success:false, msg: 'Data Parsing Error');
    }
  }


}