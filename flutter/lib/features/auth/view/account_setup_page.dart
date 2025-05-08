import 'package:barbershop/features/auth/widgets/auth_button.dart';
import 'package:barbershop/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class AccountSetupPage extends StatelessWidget {
  const AccountSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AuthTextField(hintText: 'Full Name'),
            AuthTextField(hintText: 'Phone Number'),
            // Dropdowns, avatars, etc.
            SizedBox(height: 16),
            AuthButton(
              text: 'Complete Setup',
              onPressed: () {
                // Сохранить профиль и перейти на домашнюю страницу
              },
            ),
          ],
        ),
      ),
    );
  }
}
