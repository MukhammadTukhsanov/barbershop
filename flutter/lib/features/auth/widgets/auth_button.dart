import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.primary),
        onPressed: isLoading ? null : onPressed,
        child:
            isLoading
                ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                : Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
      ),
    );
  }
}
