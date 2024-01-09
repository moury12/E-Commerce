import 'package:angoragh_e_commerce/bindings/home_binding.dart';
import 'package:angoragh_e_commerce/pages/home_page.dart';
import 'package:angoragh_e_commerce/pages/login_page.dart';
import 'package:angoragh_e_commerce/pages/splash_screen.dart';
import 'package:angoragh_e_commerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/global.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  navigatorKey = GlobalKey<NavigatorState>();
  snackbarKey = GlobalKey<ScaffoldMessengerState>();
  ServiceAPI.domain("https://application.anghorag.com/");
  ServiceAPI.extraSlag("api/");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: ThemeData.light(),
      getPages: AppRoutes.routes(),
      initialRoute: SplashScreen.routeName,
  initialBinding: InitialBinding(),
    );
  }
}


