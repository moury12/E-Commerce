import 'dart:async';
import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
static const String routeName ='/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          // Check if the user is logged in
          future: AuthController.to.isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there is an error, handle it accordingly
              return Text('Error: ${snapshot.error}');
            } else {

              final bool isLoggedIn = snapshot.data!;
              final Widget destination = isLoggedIn ? HomeScreen() : LoginScreen();

              // Use Get.offAll to replace the current stack of screens
              Timer(
                Duration(seconds: 2), // Set a delay for a more realistic splash screen
                    () => Get.offAll(destination),
              );

              return Text('Splash Screen'); // Customize this with your splash screen UI
            }
          },
        ),
      ),
    );
  }
}