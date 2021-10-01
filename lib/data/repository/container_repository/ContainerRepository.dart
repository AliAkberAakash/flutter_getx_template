import 'dart:io';

import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/container/AboutUsModel.dart';
import 'package:go_share/data/models/container/FaqModel.dart';
import 'package:go_share/data/models/container/contactus/ContactUsModel.dart';
import 'package:go_share/data/models/container/contactus/ContactUsResponse.dart';

import 'package:go_share/data/models/container/SettingsModel.dart';
import 'package:go_share/data/models/container/lostandfound/LostAndFoundModel.dart';
import 'package:go_share/data/models/container/lostandfound/LostAndFoundResponse.dart';
import 'package:go_share/utils/constants.dart';
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