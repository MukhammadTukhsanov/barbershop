// lib/features/client/client_home_page.dart

import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Client Home")),
      body: const Center(child: Text("Welcome to the Client Home Page!")),
    );
  }
}
