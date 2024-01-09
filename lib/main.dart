import 'package:angoragh_e_commerce/bindings/home_binding.dart';
import 'package:angoragh_e_commerce/pages/home_page.dart';
import 'package:angoragh_e_commerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfecto',
      theme: ThemeData.light(),
      getPages: AppRoutes.routes(),
      initialRoute: HomeScreen.routeName,
  initialBinding: HomeBindings(),
    );
  }
}


