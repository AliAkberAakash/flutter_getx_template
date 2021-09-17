import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_share/data/local/service/theme_service.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/essential/translations.dart';
import 'package:go_share/ui/container/widget_container/widget_container.dart';
import 'package:go_share/ui/section1/service_provider_profile/service_provider_profile_controller.dart';
import 'package:go_share/ui/section1/service_provider_vehicle_list/service_provider_vehicle_list_controller.dart';
import 'package:go_share/utils/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppEssentials();

  runApp(MyApp());
}

Future<void> initializeAppEssentials() async {
  Get.log('Starting services ...');

  Get.put(ThemeService());
  Get.put(Repository());
  Get.put(ServiceProviderProfileController());
  Get.put(ServiceProviderVehicleListController());

  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: accent,
      ),
    );

    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      // TODO: Change this ThemeMode if force theme update is needed
      themeMode: ThemeMode.system,
      theme: Get.find<ThemeService>().getTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      home: WidgetContainerView(),
      enableLog: kDebugMode,
    );
  }
}
