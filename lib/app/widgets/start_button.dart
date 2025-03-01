import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onTap;

  const StartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.brown[700], // Warna tombol
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
