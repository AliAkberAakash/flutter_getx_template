import 'package:get/get.dart';
import 'package:go_share/ui/auth/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
