import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_nak/app/modules/auth/controllers/auth_controller.dart';
import 'package:better_nak/app/modules/auth/views/signup_view.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80.0),
              Text(
                'Login untuk Better-Nak',
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),

              // Input Email
              TextFormField(
                controller: authController.emailController, // Pakai controller
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 25.0),

              // Input Password
              Obx(() => TextFormField(
                    controller:
                        authController.passwordController, // Pakai controller
                    validator: (value) => value == null || value.isEmpty
                        ? 'Password tidak boleh kosong'
                        : null,
                    obscureText: authController.isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(authController.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: authController.togglePasswordVisibility,
                      ),
                    ),
                  )),

              const SizedBox(height: 25.0),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Row(
                        children: [
                          Checkbox(
                            value: authController.rememberMe.value,
                            onChanged: (value) {
                              authController.rememberMe.value = value ?? false;
                            },
                          ),
                          const Text('Ingat aku'),
                        ],
                      )),
                  GestureDetector(
                    onTap: () => Get.to(() => ForgotPasswordView()),
                    child: const Text(
                      'Lupa Sandi?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),

              // Tombol Sign In
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() => ElevatedButton(
                      onPressed: authController.isLoading.value
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                authController.login();
                              }
                            },
                      child: authController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Masuk'),
                    )),
              ),
              const SizedBox(height: 30.0),

              // Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Atau masuk dengan'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 30),

              // Tombol Masuk dengan Google
              OutlinedButton.icon(
                onPressed: () {
                  Get.snackbar('Google Login', 'Fitur ini belum tersedia',
                      snackPosition: SnackPosition.BOTTOM);
                },
                icon: Image.asset('images/google_icon.png', width: 24),
                label: const Text("Masuk dengan Google"),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Masuk dengan Facebook
              OutlinedButton.icon(
                onPressed: () {
                  Get.snackbar('Facebook Login', 'Fitur ini belum tersedia',
                      snackPosition: SnackPosition.BOTTOM);
                },
                icon: Image.asset('images/facebook_icon.png', width: 24),
                label: const Text("Masuk dengan Facebook"),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),

              // Link ke Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun? "),
                  TextButton(
                    onPressed: () => Get.to(() => SignupView()),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ForgotPasswordView() {}
}
