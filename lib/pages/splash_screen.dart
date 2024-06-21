import 'dart:async';
import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/login_page.dart';

class SplashScreen extends StatelessWidget {
static const String routeName ='/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AuthController.to.isLoggedIn.value?HomeScreen
          .routeName:LoginScreen.routeName);
    },);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}