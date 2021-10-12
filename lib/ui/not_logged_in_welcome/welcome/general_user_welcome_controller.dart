import 'package:get/get.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class GeneralUserWelcomeController extends GetxController{
  final Repository repository = Get.find();

  Future<bool> isLoggedIn() async{
    return await repository.isGeneralUserLoggedIn();
  }
}