import 'package:angoragh_e_commerce/bindings/home_binding.dart';
import 'package:angoragh_e_commerce/pages/auth/login_page.dart';
import 'package:angoragh_e_commerce/pages/filter_page.dart';
import 'package:angoragh_e_commerce/pages/filter_page.dart';
import 'package:angoragh_e_commerce/pages/home/home_page.dart';
import 'package:angoragh_e_commerce/pages/product-details/productDetailsScreen.dart';
import 'package:angoragh_e_commerce/pages/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routes() => [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), binding: HomeBinding()),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: ProductDetailsScreen.routeName,
          page: () => const ProductDetailsScreen(),
        ), GetPage(
          name: FilterScreen.routeName,
          page: () => const FilterScreen(),
        ),
        // GetPage(
        //       name: ProductListWidget.routeName,
        //       page: () => const ProductListWidget(),
        //     ),
      ];
}
