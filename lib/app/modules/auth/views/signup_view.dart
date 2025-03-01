import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_nak/app/modules/auth/controllers/auth_controller.dart';
import 'package:better_nak/app/themes/theme.dart';
import 'package:better_nak/app/widgets/custom_scaffold.dart';
import 'package:better_nak/app/modules/auth/views/login_view.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formSignupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 0),
              Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextField(
                          controller: authController.fullNameController,
                          label: 'Full Name',
                          hint: 'Enter Full Name'),
                      const SizedBox(height: 10.0),
                      _buildTextField(
                          controller: authController.emailController,
                          label: 'Email',
                          hint: 'Enter Email'),
                      const SizedBox(height: 10.0),
                      _buildTextField(
                          controller: authController.passwordController,
                          label: 'Password',
                          hint: 'Enter Password',
                          obscureText: true),
                      const SizedBox(height: 10.0),
                      _buildAgreementCheckbox(),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Daftar'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      _buildDividerWithText('Atau daftar dengan'),
                      const SizedBox(height: 20.0),

                      // Tombol Masuk dengan Google
                      OutlinedButton.icon(
                        onPressed: () {
                          Get.snackbar(
                              'Google Login', 'Fitur ini belum tersedia',
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
                          Get.snackbar(
                              'Facebook Login', 'Fitur ini belum tersedia',
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        icon:
                            Image.asset('images/facebook_icon.png', width: 24),
                        label: const Text("Masuk dengan Facebook"),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sudah memiliki akun? '),
                          GestureDetector(
                            onTap: () => Get.to(() => LoginView()),
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child:
                Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text, style: const TextStyle(color: Colors.black45)),
        ),
        Expanded(
            child:
                Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5))),
      ],
    );
  }

  Widget _buildAgreementCheckbox() {
    return Row(
      children: [
        Obx(() => Checkbox(
              value: authController.isAgreed.value,
              onChanged: (value) {
                authController.isAgreed.value = value!;
              },
            )),
        Expanded(
          // Tambahkan ini
          child: Text(
            "I agree to the terms and conditions",
            overflow: TextOverflow
                .ellipsis, // Opsional: Tambahkan jika ingin teks terpotong jika masih panjang
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formSignupKey.currentState!.validate()) {
      if (!authController.isAgreed.value) {
        Get.snackbar("Warning", "You must agree to the terms and conditions.",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      authController.registerUser();
    }
  }
}
