import 'package:flutter/material.dart';

class RegisterModel {
  final String label;
  final String hint;
  final IconData? prefix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  RegisterModel(
      {required this.label,
      required this.hint,
      required this.prefix,
      required this.controller,
      required this.validator,
      required this.keyboardType,
      required this.obscureText});
}
