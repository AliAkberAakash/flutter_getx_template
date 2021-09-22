import 'dart:io';

import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/container/AboutUsModel.dart';
import 'package:go_share/data/models/container/contactus/ContactUsModel.dart';
import 'package:go_share/data/models/container/contactus/ContactUsResponse.dart';
import 'package:go_share/data/models/container/contactus/FaqModel.dart';
import 'package:go_share/data/models/container/contactus/SettingsModel.dart';
import 'package:go_share/data/models/container/lostandfound/LostAndFoundModel.dart';
import 'package:go_share/data/models/container/lostandfound/LostAndFoundResponse.dart';
import 'package:go_share/data/models/driver/driver_login_request.dart';
import 'package:go_share/data/models/driver/driver_login_response.dart';
import 'package:go_share/data/models/driver/driver_password_reset_code_response.dart';
import 'package:go_share/data/models/driver/driver_password_reset_request.dart';
import 'package:go_share/data/models/driver/driver_password_reset_response.dart';
import 'package:go_share/data/models/driver/driver_profile_response.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
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

class ContainerRepository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();


  Future<AboutUsModel> getAboutUsData() async{
    try{
      var responseJson = await helper.get(NetworkConstants.ABOUT_US);
      if(responseJson.data !=null){
        return AboutUsModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }

  Future<SettingsModel> getTCPP() async{
    try{
      var responseJson = await helper.get(NetworkConstants.SETTINGS);
      if(responseJson.data !=null){
        return SettingsModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }




  Future<dynamic> postContactUsData(ContactUsModel request) async {

    try{
      var responseJson = await helper.post(
        NetworkConstants.CONTACT_US,
        request.toJson(),
      );
      return ContactUsResponse.fromJson(responseJson.data);

    }catch(e){
      logger.d(e);

    }

  }

  Future<dynamic> postLostandFoundData(LostAndFoundModel request) async {

    try{
      var responseJson = await helper.post(
        NetworkConstants.LOSTANDFOUND,
        request.toJson(),
      );
      return LostAndFoundResponse.fromJson(responseJson.data);

    }catch(e){
      logger.d(e);
      print(e);

    }

  }



  Future<FaqModel> getFaq() async{
    try{
      var responseJson = await helper.get(NetworkConstants.FAQ);
      if(responseJson.data !=null){
        return FaqModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }



}