import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/model/register_model.dart';


final TextEditingController nameController = TextEditingController();
final TextEditingController nationalIdController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController tokenController = TextEditingController();

List<RegisterModel> registerFields = [
 RegisterModel(
    label: 'Name',
    hint: 'Enter your name',
    prefix: Icons.person,
    controller: nameController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter your name';
      } else if (value.length < 3) {
        return 'Name must be at least 3 characters long';
      }
      return null;
    },
    keyboardType: TextInputType.text,
    obscureText: false,
  ),
  RegisterModel(
    label: 'National ID',
    hint: 'Enter your national ID',
    prefix: Icons.credit_card,
    controller: nationalIdController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter your national ID';
      } else if (value.length != 14) {
        return 'National ID must be 14 digits';
      }
      return null;
    },
    keyboardType: TextInputType.number,
    obscureText: false,
  ),
  RegisterModel(
    label: 'Phone Number',
    hint: 'Enter your phone number',
    prefix: Icons.phone,
    controller: phoneController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter your phone number';
      } else if (value.length != 11) {
        return 'Phone number must be 11 digits';
      }
      return null;
    },
    keyboardType: TextInputType.phone,
    obscureText: false,
  ),
  RegisterModel(
    label: 'Email',
    hint: 'Enter your email',
    prefix: Icons.email,
    controller: emailController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter your email';
      } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    },
    keyboardType: TextInputType.emailAddress,
    obscureText: false,
  ),
  RegisterModel(
    label: 'Password',
    hint: 'Enter your password',
    prefix: Icons.lock,
    controller: passwordController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter your password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      return null;
    },
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
  ),
  RegisterModel(
    label: 'Token',
    hint: 'Enter the token',
    prefix: Icons.lock_open,
    controller: tokenController,
    validator: (value) {
      if (value==null||value.isEmpty) {
        return 'Please enter the token';
      } else if (value.length < 5) {
        return 'Token must be at least 5 characters long';
      }
      return null;
    },
    keyboardType: TextInputType.text,
    obscureText: false,
  ),
];

