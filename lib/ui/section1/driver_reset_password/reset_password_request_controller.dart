import 'package:get/get.dart';
import 'package:go_share/data/models/driver/driver_password_reset_code_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ResetPasswordRequestController extends GetxController{
  
  final Repository repository = Get.find();

  Future<DriverPasswordResetCodeResponse>requestDriverPasswordResetCode() async {
    return await repository.requestDriverPasswordResetCode();
  }
  
  
  
}