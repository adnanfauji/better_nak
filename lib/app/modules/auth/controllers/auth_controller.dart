import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var isPasswordHidden = true.obs;
  var isLoading = false.obs;
  var rememberMe = false.obs;

  var isAgreed = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email dan Password harus diisi!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_isValidEmail(emailController.text)) {
      Get.snackbar('Error', 'Format email tidak valid!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    var url = Uri.parse('http://localhost/better_nak_api/api/login.php');

    try {
      isLoading.value = true;

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      isLoading.value = false;
      var data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        Get.snackbar('Success', 'Login berhasil!',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/dashboard');
      } else {
        Get.snackbar('Error', data['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Terjadi kesalahan saat login: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signup() async {
    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (fullName.length < 3) {
      Get.snackbar('Error', 'Nama lengkap minimal 3 karakter!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar('Error', 'Format email tidak valid!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (password.length < 6) {
      Get.snackbar('Error', 'Password minimal 6 karakter!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Konfirmasi password tidak cocok!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    var url = Uri.parse('http://localhost/better_nak_api/api/signup.php');

    try {
      isLoading.value = true;

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": fullName,
          "email": email,
          "password": password,
        }),
      );

      var data = jsonDecode(response.body);
      isLoading.value = false;

      if (data['status'] == 'success') {
        Get.snackbar('Success', 'Akun berhasil dibuat!',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Error', data['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Terjadi kesalahan saat signup: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> sendResetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Email tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar("Error", "Format email tidak valid",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    var url =
        Uri.parse('http://localhost/better_nak_api/api/reset_password.php');

    try {
      isLoading.value = true;

      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      isLoading.value = false;
      var data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        Get.snackbar("Sukses", "Link reset password telah dikirim ke $email",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", data['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Terjadi kesalahan: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void registerUser() {}
}
