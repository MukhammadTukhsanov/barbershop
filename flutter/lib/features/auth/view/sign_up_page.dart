import 'package:barbershop/features/auth/widgets/auth_button.dart';
import 'package:barbershop/features/auth/widgets/auth_text_field.dart';
import 'package:barbershop/features/auth/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AuthTextField(hintText: 'Email'),
            PasswordField(),
            SizedBox(height: 16),
            AuthButton(
              text: 'Continue',
              onPressed: () {
                // Перейти к Account Setup
                context.go('/account-setup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
