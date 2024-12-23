import 'package:flutter/material.dart';

import 'package:task3/src/feature/home/model/register_model.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

List<RegisterModel> loginFields = [
  RegisterModel(
    label: 'Email',
    hint: 'Enter your email',
    prefix: Icons.email,
    controller: emailController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    }, keyboardType: TextInputType.text, obscureText: false,
  ),
  RegisterModel(
    label: 'Password',
    hint: 'Enter your password',
    prefix: Icons.lock,
    controller: passwordController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      return null;
    }, keyboardType: TextInputType.text, obscureText: false,
  ),
];
