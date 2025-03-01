import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:better_nak/app/routes/app_routes.dart'; // Pastikan rute telah didefinisikan

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.product); // Navigasi ke halaman produk
          },
          child: Text("GO TO PRODUCT PAGE >>"),
        ),
      ),
    );
  }
}
