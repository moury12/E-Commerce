import 'package:angoragh_e_commerce/DB/db_helper.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/models/user_model.dart';
import 'package:angoragh_e_commerce/pages/home/home_page.dart';
import 'package:angoragh_e_commerce/pages/splash_screen.dart';
import 'package:angoragh_e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  RxBool isLoggedIn = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<UserModel> user = UserModel().obs;
  String? token;
  @override
  void onInit() {
    getAccessToken();
    // getUserData();
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
      if (response['success']) {
        var data = response['data'];
        var token = data['token'];
        DatabaseHelper.insertLoginData(token);
        isLoggedIn.value = true;
        debugPrint(response.toString());
        Get.snackbar('Authentication', 'Login successfully!');
Get.toNamed(SplashScreen.routeName);
        // Get.put<HomeController>(HomeController(), permanent: true);
        // Get.toNamed(HomeScreen.routeName);
      } else {
        // Show error message
        Get.snackbar('Error', response['message']);
      }
    } catch (e) {
      // Handle network errors or other exceptions
      Get.snackbar('Authentication Error', 'Failed to login. Please try again later.');
    }
  }

  void getAccessToken() async {
    token = await DatabaseHelper.getAccessToken();
    if (token != null) {
      isLoggedIn.value = true;
      Get.put<HomeController>(HomeController(), permanent: true);
      debugPrint('$token Access Token');
    } else {
      isLoggedIn.value = false;
    }
  }

  void getUserData() async {
    debugPrint(token);
    user.value = await AuthService.fetchUserData(token??'');
  }
}
