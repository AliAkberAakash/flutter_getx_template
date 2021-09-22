import 'package:get/get.dart';
import 'package:go_share/data/models/container/AboutUsModel.dart';
import 'package:go_share/data/models/container/FaqModel.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_response.dart';
import 'package:go_share/data/repository/container_repository/ContainerRepository.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class FaqController extends GetxController{

  final ContainerRepository repository = new ContainerRepository();

  Future<FaqModel> FaqServiceProvider() async{
    var response = await repository.getFaq();
    return response;
  }


}