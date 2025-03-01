import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_nak/app/modules/auth/controllers/auth_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lupa Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan email Anda untuk mendapatkan tautan reset password.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: authController.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: authController.sendResetPassword,
                child: Text("Kirim Link Reset Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
