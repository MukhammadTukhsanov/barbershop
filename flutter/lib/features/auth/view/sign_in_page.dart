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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 64),
                            const Text(
                              "Saxifangizga\nkiring",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AuthTextField(
                                    hintText: 'Email',
                                    prefixIcon: Icons.mail,
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
                                  const SizedBox(height: 24),
                                  SizedBox(height: 36),
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: Divider(
                                          color: Color(0xFFE8E8E8),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          "Yoki",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Color(0xFFE8E8E8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 36),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _socialButton(
                                        Icons.facebook,
                                        Colors.blue,
                                        () {},
                                      ),
                                      const SizedBox(width: 12),
                                      _socialButton(
                                        Icons.apple,
                                        Colors.black,
                                        () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32), // вместо Spacer

                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Saxifangiz yo'qmi? ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Yaratish",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap =
                                              () => context.push(
                                                AppRoutes.signup,
                                              ),
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
              );
            },
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
