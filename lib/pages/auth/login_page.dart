import 'package:angoragh_e_commerce/controllers/auth_controller.dart';
import 'package:angoragh_e_commerce/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Import your AuthService

class LoginScreen extends StatelessWidget {

static const String routeName='/login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



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
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed:() {
AuthController.to.login(emailController.text,passwordController.text );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}