import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;

  const PasswordField({
    Key? key,
    this.controller,
    this.hintText = 'Password',
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscure = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _obscure,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfffafafa),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 232, 232, 232),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.primaries.last,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
