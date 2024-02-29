import 'package:angoragh_e_commerce/bindings/initial_binding.dart';
import 'package:angoragh_e_commerce/pages/home_page.dart';
import 'package:angoragh_e_commerce/pages/auth/login_page.dart';
import 'package:angoragh_e_commerce/pages/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routes() => [
        GetPage(
            name:'/',
            page: () => SplashScreen(),
          ),
    GetPage(
            name: HomeScreen.routeName,
            page: () => HomeScreen(),
         ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
      ];
}
