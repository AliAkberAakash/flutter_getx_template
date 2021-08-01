import 'package:get/get.dart';
import 'package:nilam/ui/auth/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
