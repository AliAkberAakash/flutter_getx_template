import 'package:get/get.dart';
import 'package:nilam/ui/auth/registration/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationController());
  }
}
