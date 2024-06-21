import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );

  }
}