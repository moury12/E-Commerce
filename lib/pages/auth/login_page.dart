import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: AuthController.to.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: AuthController.to.passwordController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {

                AuthController.to.login(AuthController.to.emailController.text,
                    AuthController.to.passwordController.text);
                AuthController.to.getAccessToken();
                // Get.put(HomeController());
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
