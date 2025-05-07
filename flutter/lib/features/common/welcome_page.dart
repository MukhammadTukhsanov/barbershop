// lib/features/common/welcome_page.dart

import 'package:barbershop/routes/app_routs.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Colors.blue, // O'zingiz xohlagan rangni qo'llang
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.content_cut, size: 100.0, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Welcome to Our Barber Shop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.login,
                ); // Auth sahifasiga o'tish
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
