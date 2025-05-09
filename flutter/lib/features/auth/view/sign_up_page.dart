import 'package:barbershop/features/auth/controller/auth_controller.dart';
import 'package:barbershop/features/auth/controller/validators.dart';
import 'package:barbershop/features/auth/widgets/auth_button.dart';
import 'package:barbershop/features/auth/widgets/auth_text_field.dart';
import 'package:barbershop/features/auth/widgets/password_field.dart';
import 'package:barbershop/routes/app_routs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final auth = ref.read(authControllerProvider);
      await auth.signUp(
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      context.go('/account-setup');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Saxifangizni yarating",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 36),
                    AuthTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.mail,
                      controller: _emailController,
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      hintText: 'Telefon raqam',
                      prefixIcon: Icons.phone,
                      controller: _phoneController,
                      validator: Validators.validatePhone,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      hintText: 'Isim Familya',
                      prefixIcon: Icons.person,
                      controller: _nameController,
                      validator: Validators.validateName,
                    ),
                    const SizedBox(height: 16),
                    PasswordField(
                      controller: _passwordController,
                      validator: Validators.validatePassword,
                    ),
                    const SizedBox(height: 36),
                    AuthButton(
                      text: 'Davom etish',
                      isLoading: _isLoading,
                      onPressed: _handleSignUp,
                    ),
                    const SizedBox(height: 36),
                    Row(
                      children: const [
                        Expanded(child: Divider(color: Color(0xFFE8E8E8))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Yoki",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFFE8E8E8))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton(Icons.facebook, Colors.blue, () {}),
                        const SizedBox(width: 12),
                        _socialButton(Icons.apple, Colors.black, () {}),
                      ],
                    ),
                    const SizedBox(height: 32),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Saxifangiz bormi? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "Kirish",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () => context.go(AppRoutes.signin),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _socialButton(IconData icon, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(50, 50),
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFE8E8E8), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: onPressed,
    child: Icon(icon, color: color, size: 24),
  );
}
