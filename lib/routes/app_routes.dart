import 'package:angoragh_e_commerce/bindings/home_binding.dart';
import 'package:angoragh_e_commerce/pages/home_page.dart';
import 'package:get/get.dart';

class AppRoutes{
static routes()=>[
  GetPage(name: HomeScreen.routeName, page:() =>  HomeScreen(),
  binding: HomeBindings())
];
}