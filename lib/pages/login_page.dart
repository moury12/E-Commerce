import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Import your AuthService

class LoginScreen extends StatelessWidget {

static const String routeName='/login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void _login() async {
    final String email = emailController.text.trim();
    final String password = phoneNumberController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and phone number');
      return;
    }

    try {
      final AuthTokenModel authToken = await AuthController.loginUser(
        email: email,
        password: password,
      );

      print('Login successful. Token: ${authToken.token}');

      // Navigate to the next screen or perform other actions
    } catch (error) {
      print('Login failed. Error: $error');
      Get.snackbar('Error', 'Failed to login. Please try again.');
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}