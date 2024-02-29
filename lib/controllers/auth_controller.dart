import 'dart:convert';

import 'package:angoragh_e_commerce/DB/db_helper.dart';
import 'package:angoragh_e_commerce/constant/constant.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:angoragh_e_commerce/main.dart';
import 'package:angoragh_e_commerce/models/auth_model.dart';
import 'package:angoragh_e_commerce/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mh_core/utils/global.dart';
class AuthController extends GetxController{
  static AuthController get to => AuthController();
  RxBool isLoggedIn = false.obs;
  void login(String email, String password) async {
    try {
      var response = await AuthService.loginService(email, password);
      globalLogger.d(response, 'Login response');
      if (response['success']) {
        var data = response['data'];
        var token = data['token'];
        _insert(accessToken: token);
        isLoggedIn.value = true;
        showSnackBar(msg: 'Login successfully!');
        Get.put<HomeController>(HomeController(), permanent: true);

      } else {
        // Show error message
        showSnackBar(msg: response['message']);
      }
    } catch (e) {
      // Handle network errors or other exceptions
      showSnackBar(msg: 'Failed to login. Please try again later.');
    }
  }

  void _insert({String? phone, required String accessToken, String? loginType}) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userMobile: phone ?? '',
      DatabaseHelper.accessToken: accessToken,
      DatabaseHelper.isLogIn: 1,
      DatabaseHelper.signInType: loginType,
      DatabaseHelper.updatedAt: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.createdAt: DateTime.now().millisecondsSinceEpoch
    };
    final id = await dbHelper.insert(DatabaseHelper.loginTable, row);
    globalLogger.d('inserted row id: $id $loginType');
  }
}