import 'package:flutter/material.dart';
import 'package:task3/src/feature/widgets/border_text_field.dart';


class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefix,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefix),
        border:border(color: Colors.white, radius: 50),
      ),
    );
  }
}
