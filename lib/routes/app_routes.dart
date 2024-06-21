import 'package:angoragh_e_commerce/bindings/home_binding.dart';
import 'package:angoragh_e_commerce/pages/auth/login_page.dart';
import 'package:angoragh_e_commerce/pages/camping-details/camping_details_page.dart';
import 'package:angoragh_e_commerce/pages/camping-details/camping_details_page.dart';
import 'package:angoragh_e_commerce/pages/filter_page.dart';
import 'package:angoragh_e_commerce/pages/home/home_page.dart';
import 'package:angoragh_e_commerce/pages/product-details/product_details_page.dart';
import 'package:angoragh_e_commerce/pages/splash_screen.dart';
import 'package:angoragh_e_commerce/pages/user/profile_page.dart';
import 'package:angoragh_e_commerce/pages/user/profile_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routes() => [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), binding: HomeBinding()),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: ProductDetailsScreen.routeName,
          page: () => const ProductDetailsScreen(),
        ),
        GetPage(
          name: FilterScreen.routeName,
          page: () => const FilterScreen(),
        ),
        GetPage(
          name: CampingDetailsScreen.routeName,
          page: () => const CampingDetailsScreen(),
        ),
        GetPage(
          name: ProfileScreen.routeName,
          page: () => const ProfileScreen(),
        ),
      ];
}
