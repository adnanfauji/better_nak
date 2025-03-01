import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to the Product Page!"),
      ),
    );
  }
}
