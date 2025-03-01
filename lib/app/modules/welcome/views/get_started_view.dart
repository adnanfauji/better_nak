import 'package:flutter/material.dart';
import 'welcome_view.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEED7B0), // Warna latar belakang
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(), // Memberikan ruang di atas

            // Logo Better-Nak
            Image.asset(
              'images/LogoBetter-nak.png',
              width: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.contain,
            ),

            const Spacer(), // Memberikan ruang di bawah logo

            // Tombol Get Started
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Warna tombol
                  minimumSize:
                      const Size(double.infinity, 50), // Lebar tombol penuh
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
