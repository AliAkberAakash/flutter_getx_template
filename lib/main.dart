import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nilam/data/local/service/local_service.dart';
import 'package:nilam/data/local/service/theme_service.dart';
import 'package:nilam/data/remote/service/remote_service.dart';
import 'package:nilam/essential/translations.dart';
import 'package:nilam/ui/auth/splash/splash_binding.dart';
import 'package:nilam/ui/auth/splash/splash_view.dart';
import 'package:nilam/ui/navigation_container/navigation_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppEssentials();

  runApp(MyApp());
}

Future<void> initializeAppEssentials() async {
  Get.log('Starting services ...');

  await GetStorage.init();
  Get.lazyPut(() => RemoteService());
  Get.lazyPut(() => LocalService());
  Get.put(ThemeService());

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
        statusBarColor: Colors.transparent,
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
      home: NavigationContainer(),
      //initialBinding: SplashBinding(),
      enableLog: kDebugMode,
    );
  }
}
