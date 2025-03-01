import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_nak/app/modules/auth/bindings/auth_binding.dart';
import 'package:better_nak/app/routes/app_routes.dart';
import 'package:better_nak/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetterNak',
      initialBinding: AuthBinding(),
      initialRoute: AppRoutes.splash, // Ubah menjadi splash
      getPages: AppPages.pages,
    );
  }
}
