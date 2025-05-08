import 'package:barbershop/features/auth/controller/auth_controller.dart';
import 'package:barbershop/features/auth/controller/validators.dart';
import 'package:barbershop/features/auth/widgets/auth_button.dart';
import 'package:barbershop/features/auth/widgets/auth_text_field.dart';
import 'package:barbershop/features/auth/widgets/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final auth = ref.read(authControllerProvider);
      await auth.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      context.go('/home'); // Заменить на нужный маршрут
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true, // This is usually true by default
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Saxifangizni yarating",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),

                  AuthTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  PasswordField(
                    controller: _passwordController,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 36),

                  AuthButton(
                    text: 'Sign In',
                    isLoading: _isLoading,
                    onPressed: _handleSignIn,
                  ),

                  const SizedBox(height: 36),

                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color.fromARGB(255, 232, 232, 232),
                      ),
                      Positioned(
                        child: Container(
                          child: Text(
                            "Yoki",
                            style: TextStyle(color: Colors.black),
                          ),
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Saxifangiz yo'qmi? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "Yaratish",
                            style: TextStyle(
                              color: Colors.blue,
                            ), // Use theme if needed
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () => context.go('/signup'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
