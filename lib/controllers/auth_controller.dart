import 'package:angoragh_e_commerce/DB/db_helper.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/pages/home/home_page.dart';
import 'package:angoragh_e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  RxBool isLoggedIn = false.obs;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String? token;
  @override
  void onInit() { 
    getAccessToken();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login(String email, String password) async {
    try {
      var response = await AuthService.loginService(email, password);
      globalLogger.d(response, 'Login response');
      if (response['success']) {
        var data = response['data'];
        var token = data['token'];
        DatabaseHelper.insertLoginData(token);
        isLoggedIn.value = true;

        showSnackBar(msg: 'Login successfully!');
        Get.put<HomeController>(HomeController(), permanent: true);
        Get.toNamed(HomeScreen.routeName);
      } else {
        // Show error message
        showSnackBar(msg: response['message']);
      }
    } catch (e) {
      // Handle network errors or other exceptions
      showSnackBar(msg: 'Failed to login. Please try again later.');
    }
  }

  void getAccessToken() async {
    token = await DatabaseHelper.getAccessToken();
    if (token != null) {
      isLoggedIn.value = true;
      Get.put<HomeController>(HomeController(), permanent: true);
      globalLogger.d(token,'Access Token');
    } else {
      isLoggedIn.value = false;
    }
  }
}
