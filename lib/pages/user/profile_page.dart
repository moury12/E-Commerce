import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Obx(
         () {
            return Text("${AuthController.to.user.value.firstName??''} ${AuthController.to.user.value.lastName??''}");
          }
        )
      ],),
    );
  }
}
