import 'package:go_share/core/network/api_base_helper.dart';
import 'package:go_share/core/network/dio_factory.dart';
import 'package:go_share/data/models/service/ServiceModel.dart';
import 'package:go_share/utils/constants.dart';
import 'package:logger/logger.dart';

class ServiceRepository{

  final ApiBaseHelper helper = ApiBaseHelper(dioFactory: DioFactory());

  Logger logger = Logger();


  Future<ServiceModel> getServiceData() async{
    try{
      var responseJson = await helper.get(NetworkConstants.OURSERVICE);
      if(responseJson.data !=null){
        return ServiceModel.fromJson(responseJson.data);
      }
    }catch(e){
      logger.d(e);

    }throw{

    };
  }

}