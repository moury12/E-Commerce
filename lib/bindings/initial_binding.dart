import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );

  }
}