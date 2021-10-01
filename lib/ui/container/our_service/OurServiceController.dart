import 'package:get/get.dart';
import 'package:go_share/data/models/container/AboutUsModel.dart';
import 'package:go_share/data/models/container/FaqModel.dart';
import 'package:go_share/data/models/service/ServiceModel.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:go_share/data/repository/container_repository/ContainerRepository.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/data/repository/service_repository/ServiceRepository.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class OurServiceController extends GetxController{

  final ServiceRepository repository = new ServiceRepository();

  Future<ServiceModel> FaqServiceProvider() async{
    var response = await repository.getServiceData();
    return response;
  }


}