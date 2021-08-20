import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_share/data/local/service/local_service.dart';
import 'package:go_share/data/local/service/theme_service.dart';
import 'package:go_share/data/remote/service/remote_service.dart';
import 'package:go_share/essential/translations.dart';
import 'package:go_share/ui/book_a_bus/address_screen.dart';
import 'package:go_share/ui/book_a_bus/payment_screen.dart';
import 'package:go_share/ui/container/widget_container/widget_container.dart';
import 'package:go_share/ui/section4/notification/notification_screen.dart';
import 'package:go_share/ui/section4/sign_in/sign_in_screen.dart';
import 'package:go_share/ui/section4/welcome/welcome_screen.dart';

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
      home: PaymentScreen(),
      enableLog: kDebugMode,
    );
  }
}
