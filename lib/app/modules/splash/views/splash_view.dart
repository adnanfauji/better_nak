import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_nak/app/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.welcome); // Pindah ke WelcomeView setelah Splash
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5D7B4),
      body: Center(
        child: Image.asset('images/LogoBetter-nak.png', width: 300),
      ),
    );
  }
}
