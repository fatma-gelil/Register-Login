import 'package:flutter/material.dart';

class RegisterModel {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final String hint;
  final IconData prefix;
  final bool obscureText;
  final TextInputType keyboardType;

  RegisterModel({
    required this.controller,
    required this.validator,
    required this.label,
    required this.hint,
    required this.prefix,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });
}
