import 'package:better_nak/app/modules/auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import '../../../widgets/welcome_button.dart';
import 'package:better_nak/app/modules/auth/views/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5D7B4), // Warna latar belakang
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // Judul
              const Text(
                "Better-Nak",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Logo Better-Nak
              Image.asset(
                'images/LogoBetter-nak.png',
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),

              // Tombol Masuk
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: WelcomeButton(
                  buttonText: "Masuk",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Daftar Sekarang
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: WelcomeButton(
                  buttonText: "Daftar Sekarang",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              // Teks Ketentuan Layanan
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Dengan masuk atau mendaftar, kamu menyetujui Ketentuan Layanan dan Kebijakan Privasi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
